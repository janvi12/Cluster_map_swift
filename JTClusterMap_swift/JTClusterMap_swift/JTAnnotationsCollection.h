//
//  JTAnnotationsCollection.h
//  JTClusterMap_swift
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface JTAnnotationsCollection : NSObject
{
    NSMutableArray *collection;
    
    double xSum;
    double ySum;
}

@property (nonatomic,readonly) NSMutableArray *collection;

@property double xSum;
@property double ySum;

- (void) addObject:(id<MKAnnotation>)annotation;
- (id) objectAtIndex:(NSUInteger)index;
- (NSUInteger) count;

@end
