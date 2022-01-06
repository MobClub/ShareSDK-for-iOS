//
//  AppDelegate.m
//  SecVerifyDemo
//
//  Created by yoozoo on 2019/9/2.
//  Copyright © 2019 yoozoo. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>

#import "SVDVerifyViewController.h"
#import <MOBFoundation/MOBFoundation.h>
#import <MOBFoundation/MobSDK+Privacy.h>
#import "SVDVerifyNaviationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"****>>>11: %f", [NSDate date].timeIntervalSince1970);
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[SVDVerifyNaviationViewController alloc] initWithRootViewController:[SVDVerifyViewController new]];
    
    [Bugly startWithAppId:@"e21ce79e66"];
    
    // 采用plist自动注册
//    [MobSDK registerAppKey:@"moba6b6c6d6" appSecret:@"b89d2427a3bc7ad1aea1e1e8c1d36bf3"];
    
    [self.window makeKeyAndVisible];
    
    // 默认同意隐私协议
    [MobSDK uploadPrivacyPermissionStatus:YES onResult:nil];
    
    return YES;
}
@end
