//
//  NSSet+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 1/3/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (APUtil)

/** 
 The intersection with another set
 @see http://ronnqvi.st/array-intersections-and-differences/
 */
- (NSSet*) setWithIntersection:(NSSet*) other;

/// Returns a new set containing only the objects that belongs to all sets
+ (NSSet*) intersectSets:(NSArray*) sets;

/// Returns the combinations of all sets
+ (NSSet*) setWithSets:(NSArray*) sets;

@end
