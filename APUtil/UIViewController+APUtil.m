//
//  UIViewController+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 7/4/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "UIViewController+APUtil.h"

@implementation UIViewController (APUtil)

- (void) setTitle: (NSString*) title
         subTitle: (NSString*) subTitle {
    
    UIView* titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 33)];
    UILabel* titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    UILabel* subTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    
//    [titleView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [subTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.minimumScaleFactor = 0.8;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    
    subTitleLabel.text = subTitle;
    subTitleLabel.font = [UIFont systemFontOfSize:14];
    subTitleLabel.textColor = [UIColor grayColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    
    [titleView addSubview:titleLabel];
    [titleView addSubview:subTitleLabel];
    
    NSDictionary* labelsDict = @{@"titleLabel":titleLabel,@"subtitleLabel":subTitleLabel};
    [titleView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel][subtitleLabel]|" options:0 metrics:nil views:labelsDict]];
    
    [titleView addConstraint:[NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [titleView addConstraint:[NSLayoutConstraint constraintWithItem:subTitleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    self.navigationItem.titleView = titleView;
}


- (void) presentViewController:(UIViewController *)viewControllerToPresent
                      animated:(BOOL)animated
     embedNavigationController: (BOOL) embedNav
                    completion:(void (^)(void))completion {
    
    if (embedNav) {
        UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:viewControllerToPresent];
        nav.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:nav animated:animated completion:completion];
    } else {
        [self presentViewController:viewControllerToPresent animated:animated completion:completion];
    }
    
}

@end
