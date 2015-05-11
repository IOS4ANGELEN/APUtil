//
//  NSFetchRequest+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 23/10/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSFetchRequest+APUtil.h"

@implementation NSFetchRequest (APUtil)

+ (NSFetchRequest*) fetchRequestWithEntity:(NSEntityDescription*)entity
                          groupedByKeyPath:(NSString*) groupedKeyPath
                                 operation:(NSString*) operation
                          operationKeyPath:(NSString*) operationKeyPath
                       operationResultName:(NSString*) oprationResultName
                       operationResultType:(NSAttributeType) resultType {

    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:entity.name];
    
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setExpression:[NSExpression expressionWithFormat:@"%K.%K",operation,operationKeyPath]];
    [expressionDescription setName:oprationResultName];
    [expressionDescription setExpressionResultType:resultType];
    
    NSDictionary* properties = [entity propertiesByName];
    NSEntityDescription* groupedByProperty = properties[groupedKeyPath];
    request.propertiesToGroupBy = @[groupedByProperty];
    request.propertiesToFetch = @[groupedByProperty,expressionDescription];
    request.resultType = NSDictionaryResultType;
    
    return request;
}

@end
