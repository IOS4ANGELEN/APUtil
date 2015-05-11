//
//  UIImage+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/30/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "UIImage+APUtil.h"

@implementation UIImage (APUtil)

- (UIImage*) imageWithBadge:(UIImage*) badge {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [badge drawInRect:CGRectMake(0, self.size.height - badge.size.height, badge.size.width, badge.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*) imageWithColor:(UIColor*)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    UIBezierPath* rPath = [UIBezierPath bezierPathWithRect:CGRectMake(0., 0., size.width, size.height)];
    [color setFill];
    [rPath fill];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage*) squareVersion {
    
    //Crop the image to a square
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    if (width != height) {
        CGFloat newDimension = MIN(width, height);
        CGFloat widthOffset = (width - newDimension) / 2;
        CGFloat heightOffset = (height - newDimension) / 2;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(newDimension, newDimension), NO, 0.);
        [self drawAtPoint:CGPointMake(-widthOffset, -heightOffset)
                         blendMode:kCGBlendModeCopy
                             alpha:1.];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
        
    } else {
        return self;
    }
}

- (NSData*) jpgRepresentation {
    return UIImageJPEGRepresentation(self, 0.85);
}

- (NSData*) pngRepresentation {
    return UIImagePNGRepresentation(self);
}


@end
