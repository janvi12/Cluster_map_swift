//
//  ClusterAnnotationView.swift
//  JTClusterMap_swift
//
//  Created by Harshul Shah on 09/11/16.
//  Copyright © 2016 Harshul Shah. All rights reserved.
//

import UIKit

class ClusterAnnotationView: MKAnnotationView
{
    var coordinate: CLLocationCoordinate2D!
    var label: UILabel!
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        label = UILabel(frame: CGRectMake(0, 0, 32, 33))
        self.addSubview(label)
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.boldSystemFontOfSize(11)
        label.textAlignment = .Center
        label.shadowColor = UIColor.blackColor()
        label.shadowOffset = CGSizeMake(0, -1)
        
        return
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setClusterText(text: String) -> Void
    {
        label.text = text
    }
}