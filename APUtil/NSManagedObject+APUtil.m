//
//  NSManagedObject+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 20/10/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSManagedObject+APUtil.h"

@implementation NSManagedObject (APUtil)


- (NSString*) uniqueRef {
    return [[[self objectID]URIRepresentation]relativeString];
}

+ (NSFetchRequest*) fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([self class])];
}

+ (NSArray*) allObjectsInContext:(NSManagedObjectContext*) context {
    NSFetchRequest* fr = [self fetchRequest];
    NSError* error = nil;
    NSArray* objects = [context executeFetchRequest:fr error:&error];
    if (!error) {
        return objects;
    } else {
        return nil;
    }
}

+ (instancetype) newObjectInContext:(NSManagedObjectContext*) context {
    return [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class]) inManagedObjectContext:context];
}



@end
