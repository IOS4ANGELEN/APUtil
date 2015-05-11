//
//  UIAlertController+APUtil.h
//  donaRaposa
//
//  Created by Flavio Negrão Torres on 27/01/15.
//  Copyright (c) 2015 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (APUtil)

+ (instancetype) alertControllerForLocalizedErrorMessage:(NSError*) error;
+ (instancetype) alertControllerForTitle:(NSString*) title message:(NSString*) msg okButtonAction:(void (^)(UIAlertAction* action)) actionBlock;
+ (UIAlertControllerStyle) preferedAlertControllerStyle;

@end
