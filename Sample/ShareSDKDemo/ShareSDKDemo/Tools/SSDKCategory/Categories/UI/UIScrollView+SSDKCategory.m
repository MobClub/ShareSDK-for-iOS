//
//  UIScrollView+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/7.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIScrollView+SSDKCategory.h"

@implementation UIScrollView (SSDKCategory)
- (void)adJustedContentIOS11{
    if (@available(iOS 11.0, *)) {
        [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}
@end
