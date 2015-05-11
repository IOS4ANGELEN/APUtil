//
//  UIImageView+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 12/30/13.
//  Copyright (c) 2013 Apetis. All rights reserved.
//

@import QuartzCore;

#import "UIImageView+APUtil.h"
#import "UIView+APUtil.h"

@implementation UIImageView (APUtil)

- (void) addActivityIndicatorWithStyle: (UIActivityIndicatorViewStyle) style
                                  size: (CGSize) size {
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    activityIndicator.frame = CGRectMake((self.bounds.origin.x + self.bounds.size.width) / 2 - size.width / 2,
                                         (self.bounds.origin.y + self.bounds.size.height) / 2 - size.height / 2,
                                         size.width, size.height);
    [activityIndicator startAnimating];
    [self addSubview:activityIndicator];
}

//TODO: não esta funcionando direito isso, removido até ter tempo para acertar.
- (void) removeActivityIndicator {
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIActivityIndicatorView class]]) {
            [obj removeFromSuperview];
            *stop = YES;
        }
    }];
}


- (void) roundedCorners:(CGFloat) radius {
    CALayer* layer = self.layer;
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
}

- (void) setCircleMask {
    self.layer.cornerRadius = self.frame.size.height /2;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0;
}

@end
