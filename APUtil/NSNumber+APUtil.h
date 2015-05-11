//
//  NSNumber+APUtil.h
//  Latte
//
//  Created by Flavio Torres on 12/06/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (APUtil)

+ (NSNumberFormatter*) sharedFormatter;

#pragma mark - Decimals
// Returns a string formated with decimal separation (, in this case)
- (NSString*) stringValueWithDecimalPlaces:(NSUInteger) decimalCases;
- (NSString*) stringAsCurrency;
- (NSString*) stringValueDecimalStyle;

#pragma mark - Comparison methods
- (BOOL)isGreaterThanOrEqualTo:(id)object;
- (BOOL)isLessThanOrEqualTo:(id)object;

#pragma mark - Currency
+ (NSString*) currencySymbol;


@end
