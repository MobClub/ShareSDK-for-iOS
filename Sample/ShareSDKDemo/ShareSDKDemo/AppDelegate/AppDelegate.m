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
#import "MOBPolicyManager.h"
#import <LineSDK/LineSDK.h>
#import "WeiboSDK.h"
#import <MOBFoundation/MobSDK+Privacy.h>
#import <MOBFoundation/MOBFoundation.h>
#import "NSString+SSDKCategory.h"
#import "WWKApi.h"
#import "WXApi.h"
#import <ShareSDK/SSDKAuthViewManager.h>
#import "MOBShareCommandDetailView.h"
#import <WeiboSDK.h>

#import <TwitterConnector/TwitterConnector.h>
@interface AppDelegate () <ISSERestoreSceneDelegate,WeiboSDKDelegate,LineSDKLoginDelegate,WXApiDelegate>

@property (strong, nonatomic) NSDictionary *parameters;

@end


@implementation AppDelegate 


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //在MOBShareSDKRegister注册第三方平台信息
//    [TwitterConnector setAuthVersion:@"2"];
    
    [[LineSDKLogin sharedInstance]setDelegate:self];
    [ShareSDK setRestoreSceneDelegate:self];
    [ShareSDK setShareVideoEnable:YES];
    [ShareSDK setAutoLogAppEventsEnabled:YES];
    [ShareSDK setBanGetIdfa:YES];
    
    //开启截屏分享监听 与ShareSDK本身无关
    [[MobScreenshotCenter shareInstance] start];
    [SSDKAuthViewManager defaultManager].timeOut = 20;
    // 加入Bugly来统计Demo异常情况
    [Bugly startWithAppId:@"b319f530b6"];
    //注册各平台参数
    [self registerShareSDK];
    //由于iOS13此方法加载时并没有加载window，下面的方法可以将在此处理window相关问题延迟到window加载之后
    [[SSDKScenePackage defaultPackage] addBeforeWindowEvent:^(SSDKScenePackage * _Nonnull application) {
        application.window.backgroundColor = [UIColor whiteColor];
    }];
    
    //初始化数据源
    [MOBPlatformDataSource dataSource];
    
    [[MOBPolicyManager defaultManager] show];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(allowPolicyAction:) name:@"kMOBPolicyManagerAllowNofitication" object:nil];
    [WXApi registerApp:@"wx617c77c82218ea2c" universalLink:@"https://70imc.share2dlink.com/"];
    [WeiboSDK registerApp:@"568898243" universalLink:@"https://70imc.share2dlink.com/"];
//    [WXApi checkUniversalLinkReady:^(WXULCheckStep step, WXCheckULStepResult * _Nonnull result) {
//        NSLog(@"mmmmmmmmmmmm %@  %@  %@  %@",@(step),@(result.success),result.suggestion, result.errorInfo);
//    }];
//    [WeiboSDK checkUniversalLink:^(WBULCheckStep step, NSError *error) {
//        NSLog(@"mmmmmmmmmmmm %@  %@",@(step), error);
//    }];
    
    
    return YES;
    
}



//ShareSDK注册各平台参数详见
//MOBShareSDKRegister.m
- (void)registerShareSDK{

//     [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {

//    #ifdef IMPORT_SINA_WEIBO
//         [platformsRegister setupSinaWeiboWithAppkey:@"568898243" appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3" redirectUrl:@"http://www.sharesdk.cn" universalLink:@"https://70imc.share2dlink.com/"];

//    #endif
//
//    #if (defined IMPORT_SUB_QQFriend) || (defined IMPORT_SUB_QZone)
//            [platformsRegister setupQQWithAppId:MOBSSDKQQAppID appkey:MOBSSDKQQAppKey];
//    #endif
//
//    #if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
//            [platformsRegister setupWeChatWithAppId:MOBSSDKWeChatAppID appSecret:MOBSSDKWeChatAppSecret universalLink:MOBSSDKWeChatuniversalLink];
//    #endif
//
//    #if (defined IMPORT_AliPaySocial) || (defined IMPORT_AliPaySocialTimeline)
//            [platformsRegister setupAliSocialWithAppId:MOBSSDKAliPayAppID];
//    #endif
//
//    #ifdef IMPORT_MeiPai
//            [platformsRegister setupMeiPaiWithAppkey:MOBSSDKMeiPaiAppKey];
//    #endif
//
//    #ifdef IMPORT_DingTalk
//            [platformsRegister setupDingTalkWithAppId:MOBSSDKDingTalkAppId];
//    #endif
////分享与授权不同key
//    #ifdef IMPORT_DingTalkAuth
//            [platformsRegister setupDingTalkAuthWithAppId:MOBSSDKDingTalkAuthAppId appSecret:MOBSSDKDingTalkAuthAppSecret redirectUrl:MOBSSDKDingTalkAuthRedirectUri];
//    #endif
//    #ifdef IMPORT_DouBan
//            [platformsRegister setupDouBanWithApikey:MOBSSDKDouBanApiKey appSecret:MOBSSDKDouBanSecret redirectUrl:MOBSSDKDouBanRedirectUri];
//    #endif
//
//    #ifdef IMPORT_TencentWeibo
//            [platformsRegister setupTencentWeiboWithAppkey:MOBSSDKTencentWeiboAppKey appSecret:MOBSSDKTencentWeiboAppSecret redirectUrl:MOBSSDKTencentWeiboRedirectUri];
//    #endif
//
//    #ifdef IMPORT_YinXiang
//            [platformsRegister setupEvernoteByConsumerKey:MOBSSDKEvernoteConsumerKey consumerSecret:MOBSSDKEvernoteConsumerSecret sandbox:MOBSSDKEvernoteSandbox];
//    #endif
//
//    #ifdef IMPORT_YouDaoNote
//            [platformsRegister setupYouDaoNoteWithConsumerKey:MOBSSDKYouDaoNoteConsumerKey consumerSecret:MOBSSDKYouDaoNoteConsumerSecret oauthCallback:MOBSSDKYouDaoNoteOauthCallback];
//    #endif
//
//    #ifdef IMPORT_Mingdao
//            [platformsRegister setupMingDaoByAppKey:MOBSSDKMingdaoAppKey appSecret:MOBSSDKMingdaoAppSecret redirectUrl:MOBSSDKMingdaoRedirectUri];
//    #endif
//
//
//    #ifdef IMPORT_Renren
//            [platformsRegister setupRenRenWithAppId:MOBSSDKRenrenAppId appKey:MOBSSDKRenrenAppKey secretKey:MOBSSDKRenrenSecretKey authType:MOBSSDKRenrenAuthType];
//    #endif
//
//    #if (defined IMPORT_SUB_YiXinSession) || (defined IMPORT_SUB_YiXinTimeline) || (defined IMPORT_SUB_YiXinFav)
//            [platformsRegister setupYiXinByAppId:MOBSSDKYiXinAppId appSecret:MOBSSDKYiXinAppSecret redirectUrl:MOBSSDKYiXinRedirectUri];
//    #endif
//
//    #ifdef IMPORT_Facebook
//    #pragma mark - Facebook 重设权限
//            //                  [appInfo SSDKSetAuthSettings:@[
//            //                                                 @"public_profile",//默认(无需审核)
//            //                                                 @"user_friends",//好友列表(无需审核)
//            //                                                 @"email",//邮箱(无需审核)
//            //                                                 @"user_about_me",//用户个人说明(需审核)
//            //                                                 @"publish_actions",//应用内分享 必要权限(需审核)
//            //                                                 @"user_videos"//应用内视频分享 必要权限(需审核)
//            //                                                 ]];
//
//            [platformsRegister setupFacebookWithAppkey:MOBSSDKFacebookAppID appSecret:MOBSSDKFacebookAppSecret displayName:MOBSSDKFacebookDisplayName];
//    #endif
//
//    #ifdef IMPORT_Instagram
//
//            [platformsRegister setupInstagramWithClientId:MOBSSDKInstagramClientID clientSecret:MOBSSDKInstagramClientSecret redirectUrl:MOBSSDKInstagramRedirectUri];
//
//    //         [platformsRegister setupInstagramInFBWithClientId:MOBSSDKInstagramClientID clientSecret:MOBSSDKInstagramClientSecret redirectUrl:MOBSSDKInstagramRedirectUri];
//    #endif
//
//    #ifdef IMPORT_Twitter
//            [platformsRegister setupTwitterWithKey:MOBSSDKTwitterConsumerKey secret:MOBSSDKTwitterConsumerSecret redirectUrl:MOBSSDKTwitterRedirectUri];
//    #endif
//
//    #ifdef IMPORT_Line
//            [platformsRegister setupLineAuthType:MOBSSDKLineAuthType];
//    #endif
//
//    #ifdef IMPORT_GooglePlus
//            [platformsRegister setupGooglePlusByClientID:MOBSSDKGooglePlusClientID clientSecret:MOBSSDKGooglePlusClientSecret redirectUrl:MOBSSDKGooglePlusRedirectUri];
//    #endif
//
//    #if (defined IMPORT_SUB_KakaoTalk) || (defined IMPORT_SUB_KakaoStory)
//            [platformsRegister setupKaKaoWithAppkey:MOBSSDKKaKaoAppKey restApiKey:MOBSSDKKaKaoRestApiKey redirectUrl:MOBSSDKKaKaoRedirectUri];
//    #endif
//
//    #ifdef IMPORT_YouTube
//            [platformsRegister setupYouTubeWithClientId:MOBSSDKYouTubeClientId clientSecret:MOBSSDKYouTubeClientSecret redirectUrl:MOBSSDKYouTubeRedirectUri];
//    #endif
//
//    #ifdef IMPORT_Flickr
//            [platformsRegister setupFlickrWithApiKey:MOBSSDKFlickrApiKey apiSecret:MOBSSDKFlickrApiSecret];
//    #endif
//
//    #ifdef IMPORT_Dropbox
//            [platformsRegister setupDropboxWithAppKey:MOBSSDKDropboxAppKey appSecret:MOBSSDKDropboxAppSecret redirectUrl:MOBSSDKDropboxOauthCallback];
//    #endif
//
//    #ifdef IMPORT_Evernote
//            [platformsRegister setupEvernoteByConsumerKey:MOBSSDKEvernoteConsumerKey consumerSecret:MOBSSDKEvernoteConsumerSecret sandbox:MOBSSDKEvernoteSandbox];
//    #endif
//
//    #ifdef IMPORT_Pinterest
//            [platformsRegister setupPinterestByClientId:MOBSSDKPinterestClientId];
//    #endif
//
//    #ifdef IMPORT_Pocket
//            [platformsRegister setupPocketWithConsumerKey:MOBSSDKPocketConsumerKey redirectUrl:MOBSSDKPocketRedirectUri];
//    #endif
//
//    #ifdef IMPORT_LinkedIn
//            [platformsRegister setupLinkedInByApiKey:MOBSSDKLinkedInApiKey secretKey:MOBSSDKLinkedInSecretKey redirectUrl:MOBSSDKLinkedInRedirectUrl];
//    #endif
//
//    #ifdef IMPORT_VKontakte
//            [platformsRegister setupVKontakteWithApplicationId:MOBSSDKVKontakteApplicationId secretKey:MOBSSDKVKontakteSecretKey authType:MOBSSDKVKontakteAuthType];
//    #endif
//
//    #ifdef IMPORT_Instapaper
//            [platformsRegister setupInstapaperWithConsumerKey:MOBSSDKInstapaperConsumerKey consumerSecret:MOBSSDKInstapaperConsumerSecret];
//    #endif
//
//    #ifdef IMPORT_Tumblr
//            [platformsRegister setupTumblrByConsumerKey:MOBSSDKTumblrConsumerKey consumerSecret:MOBSSDKTumblrConsumerSecret redirectUrl:MOBSSDKTumblrCallbackUrl];
//    #endif
//
//    #ifdef IMPORT_SMS
//            [platformsRegister setupSMSOpenCountryList:MOBSSDKSMSOpenCountryList];
//    #endif
//
//    #ifdef IMPORT_CMCC
//            [platformsRegister setupCMCCByAppId:MOBSSDKCMCCAppId appKey:MOBSSDKCMCCAppKey displayUI:MOBSSDKCMCCDisplayUI];
//    #endif
//
//    #ifdef IMPORT_Telegram
//            [platformsRegister setupTelegramByBotToken:MOBSSDKTelegramBotToken botDomain:MOBSSDKTelegramBotDomain];
//    #endif
//
//    #ifdef IMPORT_Reddit
//            [platformsRegister setupRedditByAppKey:MOBSSDKRedditAppKey redirectUri:MOBSSDKRedditRedirectUri];
//    #endif
//
//
//    #ifdef IMPORT_Douyin
//            [platformsRegister setupDouyinByAppKey:MOBSSDKDouyinAppKey appSecret:MOBSSDKDouyinAppSecret];
//    #endif
//    #ifdef IMPORT_WeWork
//            [platformsRegister setupWeWorkByAppKey:MOBSSDKWeWorkAppKey corpId:MOBSSDKWeWorkCorpId agentId:MOBSSDKWeWorkAgentId appSecret:MOBSSDKWeWorkAppSecret];
//    #endif
//
//    #ifdef IMPORT_SMS
//            [platformsRegister setupSMSOpenCountryList:MOBSSDKSMSOpenCountryList];
//    #endif
//
//    #ifdef IMPORT_CMCC
//            [platformsRegister setupCMCCByAppId:MOBSSDKCMCCAppId appKey:MOBSSDKCMCCAppKey displayUI:MOBSSDKCMCCDisplayUI];
//    #endif
//
//    #ifdef IMPORT_Oasis
//            [platformsRegister setOasisByAppkey:MOBSSDKOasisAppKey];
//    #endif
    
//        }];
    
}


//分享示例
- (void)share{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //通用参数设置
    [parameters SSDKSetupShareParamsByText:SHARESDKDEMO_TEXT
                                    images:nil
                                       url:nil
                                     title:nil
                                      type:SSDKContentTypeText];
    
    [ShareSDK share:SSDKPlatformSubTypeWechatFav parameters:parameters onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
    }];
}
//授权示例
- (void)auth{
    [ShareSDK authorize:SSDKPlatformTypeWechat settings:nil onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
    }];
}

//获取用户信息

- (void)getUserInfo{
    [ShareSDK getUserInfo:SSDKPlatformSubTypeWechatFav onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    
}

- (void)applicationWillResignActive:(UIApplication *)application{
    
}

- (void)allowPolicyAction:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    if([dic boolValueForKey:@"isAllowPolicy" default:NO] && self.parameters){
        MOBShareCommandDetailView *detailView = [[MOBShareCommandDetailView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        [detailView showWithParams:self.parameters];
    }
}

#pragma mark - ISSERestoreSceneDelegate
/**
 口令分享代理回调
 */
- (void)ISSEWillAlertCommand:(NSDictionary *)parameters error:(NSError *)error{
    if(parameters){
        if([[UIApplication sharedApplication].keyWindow.rootViewController.clasName isEqualToString:@"SSDKScenePackageRootViewController"] && [[UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController isKindOfClass:[UIAlertController class]]){
            return;
        }
        if([[UIApplication sharedApplication].keyWindow.rootViewController.clasName isEqualToString:@"MOBTabBarController"] && [UIApplication sharedApplication].windows.count > 2){
            return;
        }
        self.parameters = parameters;
        id cacheKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"kMOBPolicyManagerSaveKey"];
        if ([cacheKey boolValue]) {
            MOBShareCommandDetailView *detailView = [[MOBShareCommandDetailView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
            [detailView showWithParams:parameters];
        }
    }
    
}

/**
 视频分享代理回调
 */
- (void)ISSEWillAlertVideoInfo:(NSDictionary *)parameters{
    if(parameters){
        if([[UIApplication sharedApplication].keyWindow.rootViewController.clasName isEqualToString:@"SSDKScenePackageRootViewController"] && [[UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController isKindOfClass:[UIAlertController class]]){
            return;
        }
        if([[UIApplication sharedApplication].keyWindow.rootViewController.clasName isEqualToString:@"MOBTabBarController"] && [UIApplication sharedApplication].windows.count > 2){
            return;
        }
        self.parameters = parameters;
    
        id cacheKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"kMOBPolicyManagerSaveKey"];
        if ([cacheKey boolValue]) {
            NSString *str = [parameters yy_modelToJSONString];
            //判断是否已经解析过此二维码,如果解析过就不再弹框
            NSString *cacheStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"videoParams"];
            if(![cacheStr isEqualToString:str]){
                [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"videoParams"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                MOBShareCommandDetailView *detailView = [[MOBShareCommandDetailView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
                [detailView showWithParams:parameters];
            }
        }
    }
    
}

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

//
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//    if( [WXApi handleOpenURL:url delegate:self]){
//
//    }else if ([QQApiInterface handleOpenURL:url delegate:self]){
//
//    }else if ([WeiboSDK handleOpenURL:url delegate:self]) {
//
//    }
//
//    return YES;
//}

//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
//    if( [WXApi handleOpenURL:url delegate:self]){
//
//    }else if ([QQApiInterface handleOpenURL:url delegate:self]){
//
//    }else if ([WeiboSDK handleOpenURL:url delegate:self]) {
//
//    }
//    return YES;
//}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//    if( [WXApi handleOpenURL:url delegate:self]){
//
//    }else if ([QQApiInterface handleOpenURL:url delegate:self]){
//
//    }else if ([WeiboSDK handleOpenURL:url delegate:self]) {
//
//    }
//    return YES;
//}

//- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler{
//    NSLog(@"mmmmmmmmmmmm web::::%@",userActivity.webpageURL);
//    if( [WXApi handleOpenUniversalLink:userActivity delegate:self]){
//
//    }else if ([QQApiInterface handleOpenUniversallink:userActivity.webpageURL delegate:self]){
//
//    }else
//    if ([WeiboSDK handleOpenUniversalLink:userActivity delegate:self]){
//
//    }
//    return NO;
//}

//- (void)onReq:(BaseReq *)req{
//    NSLog(@"qqqqqqq===============%@",req);
//}
//- (void)onResp:(BaseResp *)resp{
//    NSLog(@"ppppppp===============%@",resp);
//}
//- (void)didReceiveWeiboRequest:(WBBaseRequest *)request{
//    NSLog(@"wbqqqqq==============%@",request);
//}
//- (void)didReceiveWeiboResponse:(WBBaseResponse *)response{
//    NSLog(@"wbppppp==============%@",response);
//}


- (void)didLogin:(LineSDKLogin *)login
credential:(nullable LineSDKCredential *)credential
   profile:(nullable LineSDKProfile *)profile
           error:(nullable NSError *)error{
    
}

@end
