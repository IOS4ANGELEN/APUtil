//
//  NSJSONSerialization+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 7/2/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (APUtil)

/**
 Parses a local JSON file, assuming the file is in the same bundle as this class.
 @param resource json file name
 @param extension json file extension, ussually is "json"
 @returns NSDictionary parsed.
 */
+ (NSDictionary*) JSONObjectWithResorce:(NSString*) resource withExtension:(NSString*) extension;

@end
