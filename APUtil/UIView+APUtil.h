//
//  UIView+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/30/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS (NSInteger, UIViewHairLineBorder) {
   UIViewHairLineBorderNone         = 0,
    UIViewHairLineBorderTop         = 1 << 0,
    UIViewHairLineBorderRight       = 1 << 1,
    UIViewHairLineBorderBottom      = 1 << 2,
    UIViewHairLineBorderLeft        = 1 << 3
};

@interface UIView (APUtil)

/**
 Adds a rectangle border to the receiver. iOS 7 style like
 
 */
- (void) addBorderWithColor: (UIColor*) color;


/**
 Removes the border from the receiver
 
 */
- (void) removeBorder;


/**
 Adds a thin hairline to the view border
 
 */
- (void) addHairlineToBorders:(UIViewHairLineBorder) borders withColor:(UIColor*) color;



- (UIView*)dropShadowViewWithColor:(UIColor*)color andRadius:(CGFloat)shadowRadius andOffset:(CGSize)shadowOffset andOpacity:(CGFloat)shadowOpacity;

@end


