//
//  NSNumber+APUtil.m
//  Latte
//
//  Created by Flavio Torres on 12/06/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "NSNumber+APUtil.h"

@implementation NSNumber (APUtil)

+ (NSNumberFormatter*) sharedFormatter
{
    static NSNumberFormatter* formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSNumberFormatter new];
        //NSLocale *brLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
        [formatter setLocale:[NSLocale currentLocale]];
    });
    return formatter;
}

- (NSString*) stringValueWithDecimalPlaces:(NSUInteger) decimalCases
{
    //--------------------------------------------
    // Set to decimal style and output to console
    //--------------------------------------------
    [[NSNumber sharedFormatter] setNumberStyle:NSNumberFormatterDecimalStyle];
    [[NSNumber sharedFormatter] setMaximumFractionDigits:decimalCases];
    [[NSNumber sharedFormatter] setMinimumFractionDigits:decimalCases];
    return [[NSNumber sharedFormatter] stringFromNumber:self];
}


- (NSString*) stringAsCurrency {
    [[NSNumber sharedFormatter] setNumberStyle:NSNumberFormatterCurrencyStyle];
    //[[NSNumber brFormatter] setLocale:[NSLocale currentLocale]];
    return [[NSNumber sharedFormatter] stringFromNumber:self];
}

- (NSString*) stringValueDecimalStyle {
    [[NSNumber sharedFormatter] setNumberStyle:NSNumberFormatterDecimalStyle];
    //[[NSNumber brFormatter] setLocale:[NSLocale currentLocale]];
    return [[NSNumber sharedFormatter] stringFromNumber:self];
}


- (BOOL)isGreaterThanOrEqualTo:(id)object
{
    if (![object isKindOfClass:[NSNumber class]])
    {
        // Not sure what NSNumber does if you pass in something that isn't a number.
        // Handle this case
        return NO;
    }
    
    NSNumber *numberToCompareAgainst = (NSNumber *)object;
    
    NSComparisonResult comparisonResult = [self compare:numberToCompareAgainst];
    
    if (comparisonResult == NSOrderedSame || comparisonResult == NSOrderedDescending)
        return YES;
    
    return NO;
}

- (BOOL)isLessThanOrEqualTo:(id)object
{
    if (![object isKindOfClass:[NSNumber class]])
    {
        // Not sure what NSNumber does if you pass in something that isn't a number.
        // Handle this case
        return NO;
    }
    
    NSNumber *numberToCompareAgainst = (NSNumber *)object;
    
    NSComparisonResult comparisonResult = [self compare:numberToCompareAgainst];
    
    if (comparisonResult == NSOrderedSame || comparisonResult == NSOrderedAscending)
        return YES;
    
    return NO;
}


#pragma mark - Currency

+ (NSString*) currencySymbol {
    [[NSNumber sharedFormatter] setNumberStyle:NSNumberFormatterCurrencyStyle];
    return [[NSNumber sharedFormatter] currencySymbol];
}


@end
