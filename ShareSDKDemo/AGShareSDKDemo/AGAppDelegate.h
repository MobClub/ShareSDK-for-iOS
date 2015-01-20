//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "RespForWeChatViewController.h"
#import "IIViewDeckController.h"
#import "AGViewDelegate.h"

#import "WXApi.h"
#import "WeiboApi.h"
#import <TencentOpenAPI/QQApi.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WeChatViewController.h"

@class AGViewController;

@interface AGAppDelegate : UIResponder <UIApplicationDelegate,
                                        WXApiDelegate>
{
    enum WXScene _scene;
    AGViewDelegate *_viewDelegate;
    SSInterfaceOrientationMask _interfaceOrientationMask;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IIViewDeckController *viewController;
@property (nonatomic,readonly) AGViewDelegate *viewDelegate;
@property (nonatomic) SSInterfaceOrientationMask interfaceOrientationMask;

@end
