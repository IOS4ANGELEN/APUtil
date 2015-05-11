//
//  UIImage+resize.h
//  MilkMap
//
//  Created by Flavio Torres on 25/10/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Category to enable UIImage to scale
 http://www.icab.de/blog/2010/10/01/scaling-images-and-creating-thumbnails-from-uiviews/
*/
@interface UIImage (resize)

- (UIImage*) resizeToSize:(CGSize) imageSize;

@end
