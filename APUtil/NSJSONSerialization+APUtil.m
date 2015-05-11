//
//  NSJSONSerialization+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 7/2/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSJSONSerialization+APUtil.h"

@implementation NSJSONSerialization (APUtil)

+ (NSDictionary*) JSONObjectWithResorce:(NSString*) resource withExtension:(NSString*) extension {
    
    NSBundle* bundle = [NSBundle mainBundle];
    NSURL* url = [bundle URLForResource:resource withExtension:extension];
    NSData* apelidosData = [NSData dataWithContentsOfURL:url];
    NSError* localError = nil;
    NSDictionary* parsedJSONDict = [NSJSONSerialization JSONObjectWithData:apelidosData options:0 error:&localError];
    if (localError) {
        NSLog(@"Error JSON parsing %@.%@ : %@",resource,extension,localError);
        return nil;
    } else {
        return parsedJSONDict;
    }
}

@end
