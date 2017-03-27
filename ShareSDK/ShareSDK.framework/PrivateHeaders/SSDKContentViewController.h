//
//  SSDKContentViewController.h
//  ShareSDK
//
//  Created by fenghj on 15/6/15.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  内容视图控制器
 */
@interface SSDKContentViewController : UIViewController

/**
 *  关闭事件
 *
 *  @param closeHandler 关闭事件处理器
 */
- (void)onClose:(void(^)())closeHandler;

@end
