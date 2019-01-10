//
//  AppDelegate.m
//  ShareSDKDemo
//
//  Created by youzu on 17/3/6.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "AppDelegate.h"
#import "MobScreenshotCenter.h"
#import <MOBFoundation/MobSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //开启截屏分享监听 与ShareSDK本身无关
    [[MobScreenshotCenter shareInstance] start];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
//    [MobSDK setInternationalDomain:MOBFSDKDomainTypeUS];
    
    /*注册见类MOBShareSDKHelper*/
    //Demo中使用了 MOBShareSDKHelper 进行注册 使用方法位直接加入工程就可以
    //MOBShareSDKHelper.h 中进行修改来设置使用的平台 及 各平台的参数
    
//    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
//        [platformsRegister setupQQWithAppId:@"1111111" appkey:@"2222222"];
//        [platformsRegister setupWeChatWithAppId:@"333333" appSecret:@"444444"];
//        [platformsRegister setupSinaWeiboWithAppkey:@"568898243" appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3" redirectUrl:@"http://www.sharesdk.cn"];
//        [platformsRegister setupFacebookWithAppkey:@"1412473428822331" appSecret:@"a42f4f3f867dc947b9ed6020c2e93558" displayName:@"shareSDK"];
//        [platformsRegister setupTwitterWithKey:@"0000000" secret:@"999999" redirectUrl:@"http://vvvv"];
//        [platformsRegister setupInstagramWithClientId:@"ff68e3216b4f4f989121aa1c2962d058" clientSecret:@"1b2e82f110264869b3505c3fe34e31a1" redirectUrl:@"http://sharesdk.cn"];
//        [platformsRegister setupDingTalkWithAppId:@"dingoabcwtuab76wy0kyzo"];
//        [platformsRegister setupAliSocialWithAppId:@"2017062107540437"];
//        [platformsRegister setupDouBanWithApikey:@"02e2cbe5ca06de5908a863b15e149b0b" appSecret:@"9f1e7b4f71304f2f" redirectUrl:@"http://www.sharesdk.cn"];
//        [platformsRegister setupDropboxWithAppKey:@"us514wslpfojbxc" appSecret:@"w0nmp4os3ngo1ja" redirectUrl:@"http://localhost"];
//        [platformsRegister setupYiXinByAppId:@"yx0d9a9f9088ea44d78680f3274da1765f" appSecret:@"1a5bd421ae089c3" redirectUrl:@"https://open.yixin.im/resource/oauth2_callback.html"];
//        [platformsRegister setupFlickrWithApiKey:@"cbed81d4a1bc7417693ab7865e354717" apiSecret:@"4c490343869091f2"];
//        [platformsRegister setupInstapaperWithConsumerKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA" consumerSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
//        [platformsRegister setupLineAuthType:SSDKAuthTypeBoth];
//        [platformsRegister setupEvernoteByConsumerKey:@"46131514-6903" consumerSecret:@"08d7a6f3afcc888a" sandbox:YES];
//        [platformsRegister setupKaKaoWithAppkey:@"9c17eb03317e0e627ec95a400f5785fb" restApiKey:@"802e551a5048c3172fc1dedaaf40fcf1" redirectUrl:@"http://www.mob.com/oauth"];
//        [platformsRegister setupVKontakteWithApplicationId:@"5312801" secretKey:@"ZHG2wGymmNUCRLG2r6CY" authType:SSDKAuthTypeBoth];
//        [platformsRegister setupYouTubeWithClientId:@"906418427202-jinnbqal1niq4s8isbg2ofsqc5ddkcgr.apps.googleusercontent.com" clientSecret:@"" redirectUrl:@"http://localhost"];
//        [platformsRegister setupMeiPaiWithAppkey:@"1089867639"];
//        [platformsRegister setupTencentWeiboWithAppkey:@"801307650" appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c" redirectUrl:@"http://www.sharesdk.cn"];
//
//        [platformsRegister setupRenRenWithAppId:@"226427" appKey:@"fc5b8aed373c4c27a05b712acba0f8c3" secretKey:@"f29df781abdd4f49beca5a2194676ca4" authType:SSDKAuthTypeBoth];
//        [platformsRegister setupCMCCByAppId:@"300011862498" appKey:@"38D9CA1CC280C5F207E2C343745D4A4B" displayUI:YES];
//        [platformsRegister setupYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940" consumerSecret:@"d98217b4020e7f1874263795f44838fe" oauthCallback:@"http://www.sharesdk.cn/"];
//    }];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"application:openURL:sourceApplication:annotation:");
//    [self application:application handleOpenURL:url];
    return  YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSLog(@"application:handleOpenURL:");
//    [self application:application openURL:url sourceApplication:nil annotation:nil];
    return  YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    return  YES;
}

@end
