//
//  NSLayoutConstraint+APUtil.m
//  donaRaposa
//
//  Created by Flavio Negrão Torres on 05/02/15.
//  Copyright (c) 2015 Apetis. All rights reserved.
//

#import "NSLayoutConstraint+APUtil.h"

@implementation NSLayoutConstraint (APUtil)

+ (NSArray*) constraintsToMatchFramesFromView:(UIView*) fromView toView:(UIView*) toView {
    NSMutableArray* constraints = [NSMutableArray array];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [constraints addObject:[NSLayoutConstraint constraintWithItem:fromView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    return constraints;
}

@end

