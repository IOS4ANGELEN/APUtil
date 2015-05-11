//
//  NSManagedObjectContext+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 11/14/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

@import CoreData;

@interface NSManagedObjectContext (APUtil)

/// Fetch in Background
- (void) executeFetchRequest:(NSFetchRequest*) fr completion:(void (^)(NSArray* results, NSError* error)) block;

/// Count in Background
- (void) countFetchRequest:(NSFetchRequest*) fr completion:(void (^)(NSUInteger count, NSError* error)) completion;

/// New child context from this context using NSMainQueueConcurrencyType
- (NSManagedObjectContext*) childContext;

/// New child context from this context using NSPrivateQueueConcurrencyType
- (NSManagedObjectContext*) childPrivateContext;

/// Saves itself and its parent context
- (void) saveAndSaveParentContext;

- (NSManagedObject*) objectFromOtherContext:(NSManagedObject*) managedObject;

@end
