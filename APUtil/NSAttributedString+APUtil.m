//
//  NSAttributedString+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/11/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "NSAttributedString+APUtil.h"

@implementation NSAttributedString (APUtil)

+ (NSAttributedString*) attributedStringFromString:(NSString*) sourceString
                                   highlithingText:(NSString*) highlightedString
                                         withColor:(UIColor*) color
                                          withSize:(CGFloat) fontSize {
    
    if (!sourceString) {
        return nil;
    }
    
    NSRange rangeToBeHilighted = [sourceString rangeOfString:highlightedString options:NSCaseInsensitiveSearch];
    
    UIFont *boldFont = [UIFont boldSystemFontOfSize:fontSize];
    UIFont *regularFont = [UIFont systemFontOfSize:fontSize];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:sourceString attributes:@{NSFontAttributeName :regularFont}];
    [attrString setAttributes:@{NSFontAttributeName:boldFont,NSForegroundColorAttributeName:color} range:rangeToBeHilighted];
    
    return [attrString copy];
}

@end
