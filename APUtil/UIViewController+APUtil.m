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

- (void) setActitityIndicatorTitle:(nullable NSString*) title {
    if (!title) {
        self.navigationItem.titleView = nil;
        return;
    }
    
    //Adds a custom Loading View
    UIView* titleView = [[UIView alloc]initWithFrame:CGRectZero];
    
    UILabel* label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.text = title;
    [label sizeToFit];
    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
    
    activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [titleView addSubview:label];
    [titleView addSubview:activityIndicator];
    
    NSDictionary* views = @{@"label":label,@"activityIndicator":activityIndicator};
    [titleView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[activityIndicator]-(4)-[label]|"options:0 metrics:nil views:views]];
    [titleView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|"options:0 metrics:nil views:views]];
    [titleView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:activityIndicator attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    titleView.frame = CGRectMake(0, 0, activityIndicator.frame.size.width + 4 + label.frame.size.width, label.frame.size.height);
    
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
