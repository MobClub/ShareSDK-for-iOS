//
//  SSDKAuthWindow.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/3/2.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSDKContentViewController;

/**
 *  授权窗口
 */
@interface SSDKWindow : UIWindow

/**
 *  初始化窗口
 *
 *  @param viewController 视图控制器
 *
 *  @return 窗口对象
 */
- (instancetype)initWithViewController:(SSDKContentViewController *)viewController;

/**
 *  取消key window并且隐藏窗口
 */
- (void)resignKeyAndHidden;

@end
