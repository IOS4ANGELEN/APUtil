//
//  NSPersistentStoreCoordinator+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 24/12/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSPersistentStoreCoordinator+APUtil.h"

@implementation NSPersistentStoreCoordinator (APUtil)

- (void) removeStores {
    // Remove any previously registred store.
    [self.persistentStores enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSError* error;
        if (![self removePersistentStore:obj error:&error]) {
            NSAssert(NO, @"Can't remove existent store from its PSC: %@",obj);
        }
    }];
}

@end
