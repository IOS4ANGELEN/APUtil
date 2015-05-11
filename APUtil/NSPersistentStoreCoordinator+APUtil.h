//
//  NSPersistentStoreCoordinator+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 24/12/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator (APUtil)

/// Removes all associated persistante store
- (void) removeStores;

@end
