//
//  NSManagedObject+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 20/10/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (APUtil)

/// retorna uma referencia unica baseada no objectID
- (NSString*) uniqueRef;

+ (NSFetchRequest*) fetchRequest;
+ (NSArray*) allObjectsInContext:(NSManagedObjectContext*) context;
+ (instancetype) newObjectInContext:(NSManagedObjectContext*) context;

- (instancetype) clonedAttributesInMOC:(NSManagedObjectContext*) moc;

@end
