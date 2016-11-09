//
//  JTClusterBlock.h
//  JTClusterMap_swift
//
//  Created by Harshul Shah on 09/11/16.
//  Copyright © 2016 Harshul Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "JTAnnotationsCollection.h"

@interface JTClusterBlock : NSObject
{
    JTAnnotationsCollection *annotationsCollection;
    
    MKMapRect blockRect;
}

@property MKMapRect blockRect;

- (void) addAnnotation:(id<MKAnnotation>)annotation;
- (id<MKAnnotation>) getClusteredAnnotation;
- (id<MKAnnotation>) getAnnotationForIndex:(NSInteger)index;
- (NSInteger) count;

@end
