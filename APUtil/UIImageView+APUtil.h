//
//  UIImageView+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/30/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+APUtil.h"

@interface UIImageView (APUtil)

- (void) addActivityIndicatorWithStyle: (UIActivityIndicatorViewStyle) style
                                  size: (CGSize) size;

- (void) removeActivityIndicator;

- (void) roundedCorners:(CGFloat) radius;

- (void) setCircleMask;

@end
