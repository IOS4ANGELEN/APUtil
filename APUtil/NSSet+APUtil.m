//
//  NSSet+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 1/3/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSSet+APUtil.h"
#import "NSArray+APUtil.h"

@implementation NSSet (APUtil)

- (NSSet*) setWithIntersection:(NSSet*) otherSet {
    
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"SELF IN %@", otherSet];
    return  [self filteredSetUsingPredicate:intersectPredicate];
    
}


+ (NSSet*) setWithSets:(NSArray*) sets {
    NSMutableSet* set = [NSMutableSet set];
    [sets enumerateObjectsUsingBlock:^(NSSet* otherSet, NSUInteger idx, BOOL *stop) {
        [set addObjectsFromArray:[otherSet allObjects]];
    }];
    return [set copy];
}


+ (NSSet*) intersectSets:(NSArray*) sets {
    
    if ([sets count] == 1) {
        return [sets lastObject];
    }
    
    if (!sets) {
        return nil;
    }
    
    NSMutableSet* intersection = [NSMutableSet set];
    
    [sets enumerateObjectsUsingBlock:^(NSSet* set, NSUInteger idx, BOOL *stop) {
        
        [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            __block BOOL isContainedInAllOtherSets = YES;
            NSArray* otherSets = [sets arrayByRemovingObject:set];
            
            [otherSets enumerateObjectsUsingBlock:^(NSSet* otherSet, NSUInteger idx, BOOL *stop) {
                if (![otherSet containsObject:obj]) isContainedInAllOtherSets = NO;
            }];
            
            if (isContainedInAllOtherSets) [intersection addObject:obj];
        }];
    }];
    return intersection;
}

@end
