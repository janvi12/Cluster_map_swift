//
//  JTClusterPin.m
//  JTClusterMap_swift
//
//  Created by Harshul Shah on 09/11/16.
//  Copyright © 2016 Harshul Shah. All rights reserved.
//

#import "JTClusterPin.h"

@implementation JTClusterPin
@synthesize title,coordinate,subtitle;
@synthesize nodes;

- (NSUInteger) nodeCount
{
    if( nodes )
        return [nodes count];
    return 0;
}

#if !__has_feature(objc_arc)
- (void)dealloc
{
    [title release];
    [subtitle release];
    [nodes release];
    [super dealloc];
}
#endif

@end