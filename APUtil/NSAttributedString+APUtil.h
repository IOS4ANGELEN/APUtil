//
//  NSAttributedString+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/11/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (APUtil)

+ (NSAttributedString*) attributedStringFromString:(NSString*) sourceString
                                   highlithingText:(NSString*) highlightedString
                                         withColor:(UIColor*) color
                                          withSize:(CGFloat) fontSize;

@end
