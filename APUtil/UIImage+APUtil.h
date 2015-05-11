//
//  UIImage+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/30/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+resize.h"

@interface UIImage (APUtil)

/// Returns a 1x1 image using the color provided
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage*) imageWithColor:(UIColor*)color size:(CGSize)size;

- (UIImage*) imageWithBadge:(UIImage*) badge;

- (UIImage*) squareVersion;

- (NSData*) jpgRepresentation;

- (NSData*) pngRepresentation;

@end
