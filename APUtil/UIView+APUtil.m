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

@end
