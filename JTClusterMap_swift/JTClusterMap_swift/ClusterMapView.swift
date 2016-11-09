//
//  ClusterMapView.swift
//  JTClusterMap_swift
//

import UIKit

class ClusterMapView: UIViewController, MKMapViewDelegate
{
    let BASE_RADIUS = 0.5// = 1 mile
    let MINIMUM_LATITUDE_DELTA = 0.20
    let BLOCKS = 4
    let MINIMUM_ZOOM_LEVEL = 100000
    
    var mapView = JTClusterMapView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let viewBounds = UIScreen.mainScreen().applicationFrame
        mapView = JTClusterMapView(frame: viewBounds)
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        mapView.centerCoordinate = self.nycCoord()
        
        var pins = [MKAnnotation]()
        
        let nycCoord: CLLocationCoordinate2D = self.nycCoord()
        
        for i in 0..<50
        {
            let latAdj: Double = ((Double(random()) % 1000) / 1000.0)
            let lngAdj: Double = ((Double(random()) % 1000) / 1000.0)
            
            let newCoord : CLLocationCoordinate2D = CLLocationCoordinate2DMake(nycCoord.latitude + latAdj, nycCoord.longitude + lngAdj)
            let pin = JTClusterPin()
            pin.title = "Pin \(i + 1)"
            pin.subtitle = "Pin \(i + 1) subtitle"
            pin.coordinate = newCoord
            pins.append(pin)
        }
        mapView.addAnnotations(pins)
    }
    
    func nycCoord() -> CLLocationCoordinate2D
    {
        return CLLocationCoordinate2DMake(40.77, -73.98)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        if annotation is MKUserLocation
        {
            return nil
        }
        
        let pin = (annotation as! JTClusterPin)
        var annView: MKAnnotationView!
        
        if pin.nodeCount() > 0
        {
            pin.title = "___"
            
            annView = mapView.dequeueReusableAnnotationViewWithIdentifier("cluster") as? ClusterAnnotationView
            
            if (annView == nil)
            {
                annView = ClusterAnnotationView(annotation: annotation, reuseIdentifier: "cluster")
            }
            
            annView.image = UIImage(named: "map_cluster.png")!
            (annView as! ClusterAnnotationView).setClusterText(String(pin.nodeCount()))
            annView.canShowCallout = false
        }
        else
        {
            annView = mapView.dequeueReusableAnnotationViewWithIdentifier("pin")
            if annView == nil
            {
                annView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            }
            annView.image = UIImage(named: "pin.png")!
            annView.canShowCallout = true
            annView.calloutOffset = CGPointMake(-6.0, 0.0)
        }
        return annView
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView)
    {
        if !(view is ClusterAnnotationView)
        {
            return
        }
        
        let centerCoordinate = (view.annotation as! JTClusterPin).coordinate
        
        let newSpan = MKCoordinateSpanMake(mapView.region.span.latitudeDelta / 2.0, mapView.region.span.longitudeDelta / 2.0)
        mapView.setRegion(MKCoordinateRegionMake(centerCoordinate, newSpan), animated: true)
    }
}