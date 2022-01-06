//
//  SVVerifyAuthPageMakerExample.h
//  SecVerifyDemo
//
//  Created by TanXiang on 2020/11/27.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SecVerify/SVSDKHyVerify.h>
@interface CustomExample : NSObject <SVSDKVerifyDelegate>

- (instancetype)initWithTarget:(id)target;

//隐私协议设置示例
+(void)setPrivacySettingExample:(SVSDKHyUIConfigure *)uiConfigure;

//自定义UI
-(void)setupAuthPageCustomStyle:(UIViewController *)authVC userInfo:(SVSDKHyProtocolUserInfo *)userInfo;

//(可选)设置横竖屏旋转
-(void)authPageViewWillTransition:(UIViewController *)authVC toSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator userInfo:(SVSDKHyProtocolUserInfo *)userInfo;

@end
