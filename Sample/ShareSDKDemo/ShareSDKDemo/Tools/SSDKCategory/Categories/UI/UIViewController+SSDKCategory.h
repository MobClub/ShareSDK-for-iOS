//
//  UIViewController+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/21.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^ssdk_dismissTask)(UIViewController* object);
@interface UIViewController (SSDKCategory)
@property (nonatomic, copy, readonly) UIViewController * _Nonnull (^ssdk_dismissViewControllerAnimated)(ssdk_dismissTask _Nonnull);

- (UINavigationController *)ssdk_navigationController;

@end

NS_ASSUME_NONNULL_END
