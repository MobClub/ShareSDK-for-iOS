//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "AGAppDelegate.h"
#import "AGViewController.h"
#import "AGAuthViewController.h"
#import "AGApiViewController.h"
#import "ShareSDKDemoMoreViewController.h"
#import "QQDemoViewController.h"
#import "RespViewController.h"
#import "AGWeiXinQQDemoController.h"
#import "AGLeftSideViewController.h"
#import <RennSDK/RennSDK.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
#import <Pinterest/Pinterest.h>
#import "YXApi.h"

@implementation AGAppDelegate

@synthesize viewDelegate = _viewDelegate;

- (id)init
{
    if(self = [super init])
    {
        _scene = WXSceneSession;
        _viewDelegate = [[AGViewDelegate alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [_viewDelegate release];
    [super dealloc];
}

- (void)initializePlat
{
            /**
     Connect Sina Weibo applications to use these functions, this application requires SinaWeiboConnection.framework
     On http://open.weibo.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                             redirectUri:@"http://www.sharesdk.cn"];
    
            /**
     Connect Tencent Weibo applications to use these functions, this application requires TencentWeiboConnection.framework
     On http://dev.t.qq.com register application and related information to fill in the following fields
     
     If you need to implement SSO, you need to import libWeiboSDK.a and the introduction of WBApi.h, WBApi types of incoming interfaces
     **/
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                redirectUri:@"http://www.sharesdk.cn"
                                   wbApiCls:[WeiboApi class]];
    
            //Connect SMS
    [ShareSDK connectSMS];
    
            /**
     Connect QZone applications to use these functions, this application requires QZoneConnection.framework
     On http://connect.qq.com/intro/login/ register application and related information to fill in the following fields
     
     If you need to implement SSO, you need to import TencentOpenAPI.framework and the introduction of QQApiInterface.h and TencentOAuth.h, QQApiInterface and TencentOAuth types of incoming interfaces
     **/
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
            /**
     Connect WeChat applications to use these functions, this application requires WeChatConnection.framework and WeChat SDK
     On http://open.weixin.qq.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885" wechatCls:[WXApi class]];
    
            /**
     Connect QQ applications to use these functions, this application requires QQConnection.framework and QQApi.framework
     On http://mobile.qq.com/api/ register application and related information to fill in the following fields
     **/
    // Legacy appId in the application (eg: QQxxxxxx type), the following methods can be initialized
    //    [ShareSDK connectQQWithAppId:@"QQ075BCD15" qqApiCls:[QQApi class]];
    
    [ShareSDK connectQQWithQZoneAppKey:@"100371282"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
            /**
     Connect Facebook applications to use these functions, this application requires FacebookConnection.framework
     On https://developers.facebook.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
            /**
     Connect Twitter applications to use these functions, this application requires TwitterConnection.framework
     On https://dev.twitter.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                             consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                                redirectUri:@"http://www.sharesdk.cn"];
    
            /**
     Connect Google+ applications to use these functions, this application requires GooglePlusConnection.framework and GooglePlus.framework and GoogleOpenSource.framework
     On https://code.google.com/apis/console register application and related information to fill in the following fields
     **/
    [ShareSDK connectGooglePlusWithClientId:@"232554794995.apps.googleusercontent.com"
                               clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
                                redirectUri:@"http://localhost"
                                  signInCls:[GPPSignIn class]
                                   shareCls:[GPPShare class]];
    
            /**
     Connect RenRen applications to use these functions, this application requires RenRenConnection.framework
     On http://dev.renren.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectRenRenWithAppId:@"226427"
                              appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                           appSecret:@"f29df781abdd4f49beca5a2194676ca4"
                   renrenClientClass:[RennClient class]];
    
            /**
     Connect KaiXin applications to use these functions, this application requires KaiXinConnection.framework
     On http://open.kaixin001.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
                            appSecret:@"da32179d859c016169f66d90b6db2a23"
                          redirectUri:@"http://www.sharesdk.cn/"];
    
            /**
     Connect YiXin applications to use these functions, this application requires YiXinConnection.framework
     On http://open.yixin.im/ register application and related information to fill in the following fields
     **/
    [ShareSDK connectYiXinWithAppId:@"yx0d9a9f9088ea44d78680f3274da1765f"
                           yixinCls:[YXApi class]];
    
            //Connect Mail
    [ShareSDK connectMail];
    
            //Connect Print
    [ShareSDK connectAirPrint];
    
            //Connect Copy
    [ShareSDK connectCopy];
    
            /**
     Connect Soho Weibo applications to use these functions, this application requires SohuWeiboConnection.framework
     On http://open.t.sohu.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectSohuWeiboWithConsumerKey:@"q70QBQM9T0COxzYpGLj9"
                               consumerSecret:@"XXYrx%QXbS!uA^m2$8TaD4T1HQoRPUH0gaG2BgBd"
                                  redirectUri:@"http://www.sharesdk.cn"];
    
            /**
     Connect NetEase Weibo applications to use these functions, this application requires T163WeiboConnection.framework
     On http://open.t.163.com register application and related information to fill in the following fields
     **/
    [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                              appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                            redirectUri:@"http://www.shareSDK.cn"];
    
            /**
     Connect DouBan applications to use these functions, this application requires DouBanConnection.framework
     On http://developers.douban.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectDoubanWithAppKey:@"02e2cbe5ca06de5908a863b15e149b0b"
                            appSecret:@"9f1e7b4f71304f2f"
                          redirectUri:@"http://www.sharesdk.cn"];
    
            /**
     Connect EverNote applications to use these functions, this application requires EverNoteConnection.framework
     On http://dev.yinxiang.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                          consumerKey:@"sharesdk-7807"
                       consumerSecret:@"d05bf86993836004"];
    
            /**
     Connect LinkedIn applications to use these functions, this application requires LinkedInConnection.framework
     On https://www.linkedin.com/secure/developer register application and related information to fill in the following fields
     **/
    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                              secretKey:@"cC7B2jpxITqPLZ5M"
                            redirectUri:@"http://sharesdk.cn"];
    
            /**
     Connect Pinterest applications to use these functions, this application requires Pinterest.framework
     On http://developers.pinterest.com/ register application and related information to fill in the following fields
     **/
    [ShareSDK connectPinterestWithClientId:@"1432928"
                              pinterestCls:[Pinterest class]];
    
            /**
     Connect Pocket applications to use these functions, this application requires PocketConnection.framework
     On http://getpocket.com/developer/ register application and related information to fill in the following fields
     **/
    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                               redirectUri:@"pocketapp1234"];
    
            /**
     Connect Instapaper applications to use these functions, this application requires InstapaperConnection.framework
     On http://www.instapaper.com/main/request_oauth_consumer_token register application and related information to fill in the following fields
     **/
    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
    
            /**
     Connect YouDaoNote applications to use these functions, this application requires YouDaoNoteConnection.framework
     On http://note.youdao.com/open/developguide.html#app register application and related information to fill in the following fields
     **/
    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                   redirectUri:@"http://www.sharesdk.cn/"];
    
            /**
     Connect Soho SuiShenKan applications to use these functions, this application requires SohuConnection.framework
     On https://open.sohu.com register application and related information to fill in the following fields
     **/
    [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
                             appSecret:@"b8eec53707c3976efc91614dd16ef81c"
                           redirectUri:@"http://sharesdk.cn"];
    
    
            /**
     Connect Flickr applications to use these functions, this application requires FlickrConnection.framework
     On http://www.flickr.com/services/apps/create/ register application and related information to fill in the following fields
     **/
    [ShareSDK connectFlickrWithApiKey:@"33d833ee6b6fca49943363282dd313dd"
                            apiSecret:@"3a2c5b42a8fbb8bb"];
    
            /**
     Connect Tumblr applications to use these functions, this application requires TumblrConnection.framework
     On http://www.tumblr.com/oauth/apps register application and related information to fill in the following fields
     **/
    [ShareSDK connectTumblrWithConsumerKey:@"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM"
                            consumerSecret:@"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo"
                               callbackUrl:@"http://sharesdk.cn"];

            /**
     Connect Dropbox applications to use these functions, this application requires DropboxConnection.framework
     On https://www.dropbox.com/developers/apps register application and related information to fill in the following fields
     **/
    [ShareSDK connectDropboxWithAppKey:@"7janx53ilz11gbs"
                             appSecret:@"c1hpx5fz6tzkm32"];
    
            /**
     Connect Instagram applications to use these functions, this application requires InstagramConnection.framework
     On http://instagram.com/developer/clients/register/ register application and related information to fill in the following fields
     **/
    [ShareSDK connectInstagramWithClientId:@"ff68e3216b4f4f989121aa1c2962d058"
                              clientSecret:@"1b2e82f110264869b3505c3fe34e31a1"
                               redirectUri:@"http://sharesdk.cn"];
    
            /**
     Connect VKontakte applications to use these functions, this application requires VKontakteConnection.framework
     On http://vk.com/editapp?act=create register application and related information to fill in the following fields
     **/
    [ShareSDK connectVKontakteWithAppKey:@"3921561"
                               secretKey:@"6Qf883ukLDyz4OBepYF1"];
}

/**
 *	@brief	Hosted mode initialization platform
 */
- (void)initializePlatForTrusteeship
{
            //Import QQ Connect classes, if not need share to QZone or QQ you can not call this method
    [ShareSDK importQQClass:[QQApiInterface class] tencentOAuthCls:[TencentOAuth class]];
    
            //Import RenRen classes, if not need share to RenRen you can not call this method
    [ShareSDK importRenRenClass:[RennClient class]];
    
            //Import Tencent Weibo classes, if not need share to Tencent Weibo you can not call this method
    [ShareSDK importTencentWeiboClass:[WeiboApi class]];
    
            //Import WeChat classes, if not need share to WeChat you can not call this method
    [ShareSDK importWeChatClass:[WXApi class]];
    
            //Import Google+ classes, if not need share to Google+ you can not call this method
    [ShareSDK importGooglePlusClass:[GPPSignIn class]
                         shareClass:[GPPShare class]];
    
            //Import Pinterest classes, if not need share to Pinterest you can not call this method
    [ShareSDK importPinterestClass:[Pinterest class]];
    
            //Import YiXin classes, if not need share to YiXin you can not call this method
    [ShareSDK importYiXinClass:[YXApi class]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
            /**
     Sign SDK application, please go to http://www.sharesdk.cn register the application.
     This method must be invoked at startup, otherwise it will restrict the use of the SDK.
     **/
    [ShareSDK registerApp:@"iosv1101"];

            //If you use the server configure app information, set the platform initialization code to the following method
//    [ShareSDK registerApp:@"iosv1101" useAppTrusteeship:YES];
    [self initializePlat];
    
            //If you use the server configure app information, set the platform initialization code to the following method
//    [self initializePlatForTrusteeship];
    
    _interfaceOrientationMask = SSInterfaceOrientationMaskAll;
    
            //Horizontal screen settings
//    [ShareSDK setInterfaceOrientationMask:UIInterfaceOrientationMaskLandscape];
    
            //Monitor change user information
    [ShareSDK addNotificationWithName:SSN_USER_INFO_UPDATE
                               target:self
                               action:@selector(userInfoUpdateHandler:)];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

            //Main View
    UIViewController *apiVC = [[[AGApiViewController alloc] init] autorelease];
    apiVC.title = NSLocalizedString(@"TEXT_INTERFACE", @"接口");
    UINavigationController *navApiVC = [[[UINavigationController alloc] initWithRootViewController:apiVC] autorelease];
    
            //Left side view.
    AGLeftSideViewController *leftVC = [[[AGLeftSideViewController alloc] init] autorelease];
    
    IIViewDeckController *vc = [[[IIViewDeckController alloc] initWithCenterViewController:navApiVC leftViewController:leftVC] autorelease];
    vc.leftSize = self.window.width - (320 - 44.0);
    self.viewController = vc;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(newStatusBarOrientation))
    {
        self.viewController.leftSize = self.window.height - (320 - 44.0);
    }
    else
    {
        self.viewController.leftSize = self.window.width - (320 - 44.0);
    }
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}

- (void)userInfoUpdateHandler:(NSNotification *)notif
{
    NSMutableArray *authList = [NSMutableArray arrayWithContentsOfFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()]];
    if (authList == nil)
    {
        authList = [NSMutableArray array];
    }
    
    NSString *platName = nil;
    NSInteger plat = [[[notif userInfo] objectForKey:SSK_PLAT] integerValue];
    switch (plat)
    {
        case ShareTypeSinaWeibo:
            platName = NSLocalizedString(@"TEXT_SINA_WEIBO", @"新浪微博");
            break;
        case ShareType163Weibo:
            platName = NSLocalizedString(@"TEXT_NETEASE_WEIBO", @"网易微博");
            break;
        case ShareTypeDouBan:
            platName = NSLocalizedString(@"TEXT_DOUBAN", @"豆瓣");
            break;
        case ShareTypeFacebook:
            platName = @"Facebook";
            break;
        case ShareTypeKaixin:
            platName = NSLocalizedString(@"TEXT_KAIXIN", @"开心网");
            break;
        case ShareTypeQQSpace:
            platName = NSLocalizedString(@"TEXT_QZONE", @"QQ空间");
            break;
        case ShareTypeRenren:
            platName = NSLocalizedString(@"TEXT_RENREN", @"人人网");
            break;
        case ShareTypeSohuWeibo:
            platName = NSLocalizedString(@"TEXT_SOHO_WEIBO", @"搜狐微博");
            break;
        case ShareTypeTencentWeibo:
            platName = NSLocalizedString(@"TEXT_TENCENT_WEIBO", @"腾讯微博");
            break;
        case ShareTypeTwitter:
            platName = @"Twitter";
            break;
        case ShareTypeInstapaper:
            platName = @"Instapaper";
            break;
        case ShareTypeYouDaoNote:
            platName = NSLocalizedString(@"TEXT_YOUDAO_NOTE", @"有道云笔记");
            break;
        case ShareTypeGooglePlus:
            platName = @"Google+";
            break;
        case ShareTypeLinkedIn:
            platName = @"LinkedIn";
            break;
        default:
            platName = NSLocalizedString(@"TEXT_UNKNOWN", @"未知");
    }
    
    id<ISSPlatformUser> userInfo = [[notif userInfo] objectForKey:SSK_USER_INFO];
    BOOL hasExists = NO;
    for (int i = 0; i < [authList count]; i++)
    {
        NSMutableDictionary *item = [authList objectAtIndex:i];
        ShareType type = [[item objectForKey:@"type"] integerValue];
        if (type == plat)
        {
            [item setObject:[userInfo nickname] forKey:@"username"];
            hasExists = YES;
            break;
        }
    }
    
    if (!hasExists)
    {
        NSDictionary *newItem = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 platName,
                                 @"title",
                                 [NSNumber numberWithInteger:plat],
                                 @"type",
                                 [userInfo nickname],
                                 @"username",
                                 nil];
        [authList addObject:newItem];
    }
    
    [authList writeToFile:[NSString stringWithFormat:@"%@/authListCache.plist",NSTemporaryDirectory()] atomically:YES];
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return self.interfaceOrientationMask;
}

#pragma mark - WXApiDelegate

-(void) onReq:(BaseReq*)req
{
    
}

-(void) onResp:(BaseResp*)resp
{
    
}

@end
