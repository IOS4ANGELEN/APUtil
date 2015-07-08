//
//  NSString+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 11/13/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "NSString+APUtil.h"

@implementation NSString (APUtil)

- (BOOL) isValidEmailAddress {
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:self];
}

- (NSNumber*) currencyNumber {
    NSScanner* scanner = [NSScanner localizedScannerWithString:self];
    float floatnumber;
    if ([scanner scanFloat:&floatnumber]) {
        return @(floatnumber);
    } else {
        return nil;
    }
}

- (NSInteger) numberOfOccurenciesOfString:(NSString*) string {
    return [[self componentsSeparatedByString:string] count] - 1;
}

- (NSString*) noWhiteSpacesAndNewLine {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString*) ap_firstWord {
    return [[self componentsSeparatedByString:@" "]firstObject];
}

- (NSString*) stringByAppendingCarrierReturnBefore {
    return [NSString stringWithFormat:@"\n%@",self];
}

@end
