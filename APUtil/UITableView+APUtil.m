//
//  UITableView+APUtil.m
//  MilkMap
//
//  Created by Flavio Negrão Torres on 1/28/14.
//  Copyright (c) 2014 Apetis. All rights reserved.
//

#import "UITableView+APUtil.h"

@implementation UITableView (APUtil)

- (void) deselectSelectRowAnimated:(BOOL)animated {
    NSIndexPath* indexPath = [self indexPathForSelectedRow];
    [self deselectRowAtIndexPath:indexPath animated:animated];
}


- (UITableViewCell*) selectedCell {
    NSIndexPath* selectedIndexPath = [self indexPathForSelectedRow];
    return [self cellForRowAtIndexPath:selectedIndexPath];
}

@end
