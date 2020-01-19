//
//  AppDelegate.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/6.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "AppDelegate.h"
#import "MobScreenshotCenter.h"
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import <ShareSDKExtension/SSEFriendsPaging.h>
#import <Bugly/Bugly.h>
#import "MOBPlatformDataSource.h"

@interface AppDelegate () <ISSERestoreSceneDelegate>

@end


@implementation AppDelegate 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
   
    //在MOBShareSDKRegister注册第三方平台信息
    
    [ShareSDK setRestoreSceneDelegate:self];
    
    //开启截屏分享监听 与ShareSDK本身无关
    [[MobScreenshotCenter shareInstance] start];
    
    // 加入Bugly来统计Demo异常情况
    [Bugly startWithAppId:@"b319f530b6"];
    
    
    //由于iOS13此方法加载时并没有加载window，下面的方法可以将在此处理window相关问题延迟到window加载之后
    [[SSDKScenePackage defaultPackage] addBeforeWindowEvent:^(SSDKScenePackage * _Nonnull application) {
        application.window.backgroundColor = [UIColor whiteColor];
    }];
    
    //初始化数据源
    [MOBPlatformDataSource dataSource];
    return YES;
}

#pragma mark - ISSERestoreSceneDelegate

/**
 闭环分享代理回调
 
 */
- (void)ISSEWillRestoreScene:(SSERestoreScene *)scene error:(NSError *)error{
    
    Class sceneClass = NSClassFromString(scene.className);
    if (sceneClass) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        UIViewController *sceneVC = [[sceneClass alloc] performSelector:sel_registerName("initWithShareSDKScene:") withObject:scene];
#pragma clang diagnostic pop
        [[SSDKScenePackage defaultPackage] addBeforeWindowEvent:^(SSDKScenePackage * _Nonnull application) {
            [[UIApplication currentToNavgationController] pushViewController:sceneVC animated:YES];
        }];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application{
    
}

@end
