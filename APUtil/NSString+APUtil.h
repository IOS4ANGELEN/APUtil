//
//  NSString+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 11/13/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (APUtil)

- (BOOL) isValidEmailAddress;

// Scans the string for a valid float and return it as a NSNumber
- (NSNumber*) currencyNumber;

- (NSInteger) numberOfOccurenciesOfString:(NSString*) string;

- (NSString*) noWhiteSpacesAndNewLine;

@end
