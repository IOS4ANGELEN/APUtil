//
//  UITableView+APUtil.h
//  MilkMap
//
//  Created by Flavio Negrão Torres on 1/28/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (APUtil)

- (void) deselectSelectRowAnimated:(BOOL)animated;

- (UITableViewCell*) selectedCell;
    
@end
