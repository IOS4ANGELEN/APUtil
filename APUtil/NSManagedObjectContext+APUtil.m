//
//  NSManagedObjectContext+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 11/14/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "NSManagedObjectContext+APUtil.h"


@implementation NSManagedObjectContext (APUtil)


+ (instancetype)sharedBackgroundContext {
    static NSManagedObjectContext* backgroundContext = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        backgroundContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    });
    return backgroundContext;
}


- (void) executeFetchRequest:(NSFetchRequest*) fr completion:(void (^)(NSArray* results, NSError* error)) completion {
    
    NSManagedObjectContext *backgroundContext = [NSManagedObjectContext sharedBackgroundContext];
    if (!backgroundContext.persistentStoreCoordinator) {
        backgroundContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    
    [backgroundContext performBlock:^{
        NSError *error = nil;
        NSArray *fetchedObjects = [backgroundContext executeFetchRequest:fr error:&error];
        
        [self performBlock:^{
            
            if (fetchedObjects) {
                
                if (fr.resultType == NSDictionaryResultType ||
                    fr.resultType == NSManagedObjectIDResultType) {
                    
                    if (completion) completion(fetchedObjects, nil);
                    
                } else {
                    NSMutableArray *mutObjects = [[NSMutableArray alloc] initWithCapacity:[fetchedObjects count]];
                    for (NSManagedObject *fetchedObject in fetchedObjects) {
                        [mutObjects addObject:[self objectWithID:fetchedObject.objectID]];
                    }
                    
                    if (completion) {
                        NSArray *objects = [mutObjects copy];
                        completion(objects, nil);
                    }
                }
                
            } else {
                if (completion) completion(nil, error);
            }
        }];
    }];
}


- (void) countFetchRequest:(NSFetchRequest*) fr completion:(void (^)(NSUInteger count, NSError* error)) completion {
    
    NSManagedObjectContext *backgroundContext = [NSManagedObjectContext sharedBackgroundContext];
    if (!backgroundContext.persistentStoreCoordinator) {
        backgroundContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    
    [backgroundContext performBlock:^{
        NSError *error = nil;
        NSUInteger count = [backgroundContext countForFetchRequest:fr error:&error];
        
        [self performBlock:^{
            
            if (!error) {
                if (completion) completion(count, nil);
                
            } else {
                 if (completion) completion(0, error);
            }
        }];
    }];
}


- (NSManagedObjectContext*) childContext {
    NSManagedObjectContext* childContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    childContext.parentContext = self;
    return childContext;
}

- (NSManagedObjectContext*) childPrivateContext {
    NSManagedObjectContext* childContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    childContext.parentContext = self;
    return childContext;
}

- (void) saveAndSaveParentContext {
    NSError* error = nil;
    if (![self save:&error]) {
        NSLog(@"Error saving: %@",error);
        
    } else {
        NSError* parentError = nil;
        if (![self.parentContext save:&parentError]){
            NSLog(@"Error saving: %@",parentError);
        }
    }
}


- (NSManagedObject*) objectFromOtherContext:(NSManagedObject*) managedObject {
    return [self objectWithID:[managedObject objectID]];
}


@end
