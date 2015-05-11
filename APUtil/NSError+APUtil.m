//
//  NSError+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 11/6/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "NSError+APUtil.h"

@implementation NSError (APUtil)

- (NSString*) prettyLog {
    
    return [self prettyLogWithIdentation:0];
}

- (NSString*) prettyLogWithIdentation: (NSInteger) indentation {
    
    NSMutableString* prettyLogString = [NSMutableString new];
    
    NSMutableString* spaces = [NSMutableString new];
    for (NSInteger i = 0 ; i < indentation; i++) {
        [spaces appendString:@"    "];
    }
    
    [prettyLogString appendString:[NSString stringWithFormat:@"\n%@    NSError domain: %@\n%@    NSError code: %ld",spaces,self.domain,spaces,(long)self.code]];
    
    [self.userInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([key isEqualToString:NSUnderlyingErrorKey]) {
            NSError* underlyingerror = (NSError*) obj;
            [prettyLogString appendString:[NSString stringWithFormat:@"\n%@    Underlying Error",spaces]];
            [prettyLogString appendString:[underlyingerror prettyLogWithIdentation:1]];
        } else
            [prettyLogString appendString:[NSString stringWithFormat:@"\n%@    %@: %@",spaces, key,obj]];
    }];
    
    return prettyLogString;
}

@end
