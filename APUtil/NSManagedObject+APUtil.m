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


- (instancetype) clonedAttributesInMOC:(NSManagedObjectContext*) moc {
    
    //create new object in data store
    NSManagedObject *cloned = [NSEntityDescription
                               insertNewObjectForEntityForName:self.entity.name
                               inManagedObjectContext:moc];
    //loop through all attributes and assign then to the clone
    NSDictionary *attributes = self.entity.attributesByName;
    
    for (NSString *attr in [attributes allKeys]) {
        [cloned setValue:[self valueForKey:attr] forKey:attr];
    }
    
    return cloned;
}



@end
