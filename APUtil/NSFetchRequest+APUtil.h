//
//  NSFetchRequest+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 23/10/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchRequest (APUtil)

+ (NSFetchRequest*) fetchRequestWithEntity:(NSEntityDescription*)entity
                          groupedByKeyPath:(NSString*) groupedKeyPath
                                 operation:(NSString*) operation
                          operationKeyPath:(NSString*) operationKeyPath
                       operationResultName:(NSString*) oprationResultName
                       operationResultType:(NSAttributeType) resultType;

@end
