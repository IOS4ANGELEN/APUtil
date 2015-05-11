//
//  UIViewController+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 7/4/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (APUtil)

- (void) setTitle: (NSString*) title subTitle: (NSString*) subTitle;

- (void) presentViewController:(UIViewController *)viewControllerToPresent
                      animated:(BOOL)animated
     embedNavigationController: (BOOL) embedNav
                    completion:(void (^)(void))completion;

@end
