//
//  UIColor+APUtil.h
//  Pods
//
//  Created by Flavio Negrão Torres on 11/06/15.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (APUtil)

- (UIColor *)ap_colorByDarkeningColorWithValue:(CGFloat)value;
- (UIColor*)blendWithColor:(UIColor*)color2 alpha:(CGFloat)alpha2;

@end
