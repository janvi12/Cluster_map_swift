//
//  JTClusterBlock.m
//  JTClusterMap_swift
//
//  Created by Harshul Shah on 09/11/16.
//  Copyright © 2016 Harshul Shah. All rights reserved.
//

#import "JTClusterBlock.h"
#import "JTClusterMap.h"

@implementation JTClusterBlock
@synthesize blockRect;

- (void) addAnnotation:(id<MKAnnotation>)annotation
{
    if( !annotationsCollection )
    {
        annotationsCollection = [[JTAnnotationsCollection alloc] init];
    }
    
    [annotationsCollection addObject:annotation];
}
- (id<MKAnnotation>) getAnnotationForIndex:(NSInteger)index
{
    return [annotationsCollection objectAtIndex:index];
}

- (id<MKAnnotation>) getClusteredAnnotation
{
    if( [self count] == 1 )
    {
        return [self getAnnotationForIndex:0];
    }
    else if ( [self count] > 1 )
    {
        double x = [annotationsCollection xSum] / [annotationsCollection count];
        double y = [annotationsCollection ySum] / [annotationsCollection count];
        
        CLLocationCoordinate2D location = MKCoordinateForMapPoint(MKMapPointMake(x, y));
#if !__has_feature(objc_arc)
        JTClusterPin *pin = [[[JTClusterPin alloc] init] autorelease];
#else
        JTClusterPin *pin = [[JTClusterPin alloc] init];
#endif
        pin.coordinate = location;
        pin.nodes = [annotationsCollection collection];
        return pin;
    }
    return nil;
}

- (NSInteger) count
{
    return [annotationsCollection count];
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%i annotations",[self count]];
}

#if !__has_feature(objc_arc)
- (void) dealloc
{
    [annotationsCollection release], annotationsCollection = nil;
    [super dealloc];
}
#endif
@end