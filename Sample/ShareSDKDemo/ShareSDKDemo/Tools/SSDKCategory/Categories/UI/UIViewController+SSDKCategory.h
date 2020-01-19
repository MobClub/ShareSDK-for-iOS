//
//  UIViewController+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/21.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SSDKCategory)

- (UINavigationController *)ssdk_navigationController;

@property (nonatomic, copy, readonly) UIViewController * (^ showFromViewController)(UIViewController *viewController);


/**
 模态推出透明视图vc
 
 @param vc 将要被推出的视图
 */
- (void)presentTransparentViewController:(UIViewController *)vc;

/**
 被视图vc以透明状态推出
 
 @param vc 将要被推出的视图
 */
- (void)presentedTransparentViewController:(UIViewController *)vc;

- (void)presentedFromViewController:(UIViewController *)vc;


/**
 立刻显示
 */
- (void)showInRootViewController;

//显示延时time小时
- (void)showAndDissmissAfterTime:(NSTimeInterval)time;


@end

NS_ASSUME_NONNULL_END
