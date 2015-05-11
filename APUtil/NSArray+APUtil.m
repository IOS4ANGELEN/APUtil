//
//  NSArray+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/2/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "NSArray+APUtil.h"

@implementation NSArray (APUtil)

- (NSArray *)arrayByRemovingObject:(id)obj {
    
    if (!obj) return [self copy]; // copy because all array* methods return new arrays
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
    [mutableArray removeObject:obj];
    return [NSArray arrayWithArray:mutableArray];
}

- (NSArray *) arrayByRemovingObjectsFromArray:(NSArray*) objects {
    
    if (!objects) return [self copy]; // copy because all array* methods return new arrays
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
    [mutableArray removeObjectsInArray:objects];
    return [NSArray arrayWithArray:mutableArray];
}


@end
