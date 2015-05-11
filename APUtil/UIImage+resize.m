//
//  UIImage+resize.m
//  MilkMap
//
//  Created by Flavio Torres on 25/10/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import "UIImage+resize.h"


@implementation UIImage (resize)

// Use retina displays
- (void)beginImageContextWithSize:(CGSize)size {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] == 2.0) {
            UIGraphicsBeginImageContextWithOptions(size, YES, 2.0);
        } else {
            UIGraphicsBeginImageContext(size);
        }
    } else {
        UIGraphicsBeginImageContext(size);
    }
}


- (void)endImageContext {
    UIGraphicsEndImageContext();
}


// resize image
- (UIImage*) resizeToSize:(CGSize) imageSize {
    
    //[self beginImageContextWithSize:imageSize];
    UIGraphicsBeginImageContext(imageSize);
    
    // desired maximum width/height of your image
    CGRect imageRect = CGRectMake(0, 0, imageSize.width, imageSize.height); // desired x/y coords, with maximum width/height
    
    // Background color, branco quando ficar espaço vazio após reajustar o tamanho da imagem
    [[UIColor whiteColor]setFill];
    UIRectFill(imageRect);
    
    // calculate resize ratio, and apply to rect
    CGFloat ratio = MIN(imageSize.width / self.size.width, imageSize.height / self.size.height);
    imageRect.size.width = self.size.width * ratio;
    imageRect.size.height = self.size.height * ratio;
    
    //Centralizar imagem
    CGFloat x = (imageSize.width - imageRect.size.width) / 2;
    CGFloat y = (imageSize.height - imageRect.size.height) / 2;
    
    [self drawInRect:CGRectMake(x,y,imageRect.size.width,imageRect.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    
    return newImage;
}


@end
