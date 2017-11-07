//
//  AuthViewController.h
//  CustomAuthView
//
//  Created by fenghj on 15/7/1.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

/**
 *  授权视图控制器
 */
@interface AuthViewController : UIViewController

/**
 *  初始化授权视图控制器
 *
 *  @param authView 视图对象
 *
 *  @return 视图控制器
 */
- (instancetype)initWithAuthView:(UIView<ISSDKAuthView> *)authView;

@end
