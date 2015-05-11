//
//  NSMassFormatter+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 14/11/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSMassFormatter+APUtil.h"

@implementation NSMassFormatter (APUtil)

+ (NSMassFormatter*) sharedFormater {
    static NSMassFormatter* formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSMassFormatter new];
    });
    return formatter;
}

@end
