//
//  NSLayoutConstraint+APUtil.h
//  donaRaposa
//
//  Created by Flavio Negrão Torres on 05/02/15.
//  Copyright (c) 2015 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (APUtil)

+ (NSArray*) constraintsToMatchFramesFromView:(UIView*) fromView toView:(UIView*) toView;

@end
