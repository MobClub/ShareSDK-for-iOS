//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "SSCAppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import "SSCViewController.h"
#import "WeiboApi.h"
#import "WXApi.h"

@implementation SSCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [ShareSDK registerApp:@"api20"];
    [ShareSDK registerApp:@"4a88b2fb067c"];
    
    //添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                           appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                         redirectUri:@"http://www.sharesdk.cn"];

    //添加腾讯微博应用
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                              appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                            redirectUri:@"http://www.sharesdk.cn"
                               wbApiCls:[WeiboApi class]];

    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"
                           wechatCls:[WXApi class]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIViewController *vc = [[SSCViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:nil];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url sourceApplication:sourceApplication annotation:annotation wxDelegate:nil];
}

@end
