//
//  UITableView+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/19.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UITableView+SSDKCategory.h"
#import "UIScrollView+SSDKCategory.h"
@implementation UITableView (SSDKCategory)
+ (UITableView *)tableViewStyle:(UITableViewStyle)style{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    return tableView;
}

- (void)adJustedContentIOS11{
    if (@available(iOS 11.0, *)) {
        [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
    }
}
@end
