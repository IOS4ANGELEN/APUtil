//
//  NSArray+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/2/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (APUtil)

- (NSArray *) arrayByRemovingObject:(id)obj;
- (NSArray *) arrayByRemovingObjectsFromArray:(NSArray*) objects;

@end
