//
//  UIView+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/30/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

@import QuartzCore;

#import "UIView+APUtil.h"

@implementation UIView (APUtil)

- (void) addBorderWithColor: (UIColor*) color {
    self.layer.cornerRadius = 3;
    self.layer.borderWidth = 1;
    self.layer.borderColor = color.CGColor;
}

- (void) removeBorder {
    self.layer.borderWidth = 0;
}


- (void) addHairlineToBorders:(UIViewHairLineBorder) borders withColor:(UIColor*) color {
    
    if (borders & UIViewHairLineBorderTop) {
        CALayer* subLayer = [CALayer layer];
        subLayer.backgroundColor = color.CGColor;
        subLayer.frame = CGRectMake(0, 1, self.bounds.size.width, 0.5);
        [self.layer addSublayer:subLayer];
    }
    
    if (borders & UIViewHairLineBorderRight) {
        CALayer* subLayer = [CALayer layer];
        subLayer.backgroundColor = color.CGColor;
        subLayer.frame = CGRectMake(self.bounds.size.width - 1, 0, 0.5, self.bounds.size.height);
        [self.layer addSublayer:subLayer];
    }
    
    if (borders & UIViewHairLineBorderBottom) {
        CALayer* subLayer = [CALayer layer];
        subLayer.backgroundColor = color.CGColor;
        subLayer.frame = CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 0.5);
        [self.layer addSublayer:subLayer];
    }
    
    if (borders & UIViewHairLineBorderLeft) {
        CALayer* subLayer = [CALayer layer];
        subLayer.backgroundColor = color.CGColor;
        subLayer.frame = CGRectMake(0, 0, 0.5, self.bounds.size.height);
        [self.layer addSublayer:subLayer];
    }
}


- (UIView*)dropShadowViewWithColor:(UIColor*)color andRadius:(CGFloat)shadowRadius andOffset:(CGSize)shadowOffset andOpacity:(CGFloat)shadowOpacity {
    
    CGRect shadowFrame = CGRectInset(self.frame, -2, -2);
    UIView * shadow = [[UIView alloc] initWithFrame:shadowFrame];
    shadow.userInteractionEnabled = NO; // Modify this if needed
    shadow.layer.shadowColor = color.CGColor;
    shadow.layer.shadowOffset = shadowOffset;
    shadow.layer.shadowRadius = shadowRadius;
    shadow.layer.masksToBounds = NO;
    shadow.clipsToBounds = NO;
    shadow.layer.shadowOpacity = shadowOpacity;
    [self.superview insertSubview:shadow belowSubview:self];
    [shadow addSubview:self];
    return shadow;
}

@end
