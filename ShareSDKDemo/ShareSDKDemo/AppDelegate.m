//
//  AppDelegate.m
//  ShareSDKDemo
//
//  Created by 刘靖煌 on 15/10/24.
//  Copyright © 2015年 mob.com. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ISSPlatformApp.h>

#import "ShareViewController.h"
#import "AuthViewController.h"
#import "CustomizeViewController.h"

//ShareSDK头文件
#import <ShareSDK/ShareSDK.h>
//以下是ShareSDK必须添加的依赖库：
//1、SystemConfiguration.framework
//2、QuartzCore.framework
//3、CoreTelephony.framework
//4、libicucore.dylib
//5、libz.1.2.5.dylib
//6、Security.framework
//7、JavaScriptCore.framework
//8、libstdc++.dylib
//9、CoreText.framework

//＝＝＝＝＝＝＝＝＝＝以下是各个平台SDK的头文件，根据需要集成的平台添加＝＝＝
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//以下是腾讯SDK的依赖库：
//libsqlite3.dylib

//微信SDK头文件
#import "WXApi.h"
//以下是微信SDK的依赖库：
//libsqlite3.dylib

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"
//以下是新浪微博SDK的依赖库：
//1、ImageIO.framework
//2、libsqlite3.dylib
//3、AdSupport.framework

//支付宝SDK
#import "APOpenAPI.h"

//人人SDK头文件
#import <RennSDK/RennSDK.h>

//GooglePlus SDK头文件
#import <GooglePlus/GooglePlus.h>
//GooglePlus SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"
//以下是GooglePlus SDK的依赖库
//1、CoreMotion.framework
//2、CoreLocation.framework
//3、MediaPlayer.framework
//4、AssetsLibrary.framework
//5、AddressBook.framework

//Pinterest SDK头文件
#import <Pinterest/Pinterest.h>

//易信SDK头文件
#import "YXApi.h"

//Kakao SDK头文件
#import <KakaoOpenSDK/KakaoOpenSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //1.初始化ShareSDK应用,字符串"5559f92aa230"换成http://www.mob.com/后台申请的ShareSDK应用的Appkey
    [ShareSDK registerApp:@"5559f92aa230"];
    
    //2. 初始化社交平台
    [self initializePlat];
    
    //以下是Demo界面的相关代码
    //分享页面
    ShareViewController *share = [[ShareViewController alloc] init];
    share.tabBarItem.title = NSLocalizedString(@"Share", nil);
    share.tabBarItem.image = [UIImage imageNamed:@"tabbar_share"];
    share.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_share_sel"];
    
    //第三方登录页面
    AuthViewController *auth = [[AuthViewController alloc] init];
    auth.tabBarItem.title = NSLocalizedString(@"Auth", nil);
    auth.tabBarItem.image = [UIImage imageNamed:@"tabbar_auth"];
    auth.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_auth_sel"];
    
    //自定义界面页面
    CustomizeViewController *custom = [[CustomizeViewController alloc] init];
    custom.tabBarItem.title = NSLocalizedString(@"Custom", nil);
    custom.tabBarItem.image = [UIImage imageNamed:@"tabbar_cus"];
    custom.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_cus_sel"];
    
    UITabBarController *tabBarVc = [[UITabBarController alloc] init];
    tabBarVc.view.backgroundColor = [UIColor whiteColor];
    tabBarVc.viewControllers = @[share,auth,custom];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarVc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)initializePlat
{
    /**
     连接支付宝开放平台应用以使用相关功能（不含支付宝支付，仅支持支付宝朋友分享功能,此应用需要引用AliPaySocialConnection.frameworkhttps://open.alipay.com/platform/home.htm上注册支付宝开放平台应用,并将相关信息填写到以下字段
     **/
    [ShareSDK connectAliPaySocialWithAppID:@"2015072400185895"
                                openApiCls:[APOpenAPI class]
                           mediaMessageCls:[APMediaMessage class]
                        shareTextObjectCls:[APShareTextObject class]
                         shareImgObjectCls:[APShareImageObject class]
                         shareWebObjectCls:[APShareWebObject class]
                     sendMessageToAPReqCls:[APSendMessageToAPReq class]];
    /**
     连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
     http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                             redirectUri:@"http://www.sharesdk.cn"
                             weiboSDKCls:[WeiboSDK class]];
    /**
     连接腾讯微博开放平台应用以使用相关功能，此应用需要引用TencentWeiboConnection.framework
     http://dev.t.qq.com上注册腾讯微博开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                redirectUri:@"http://www.sharesdk.cn"];
    
    //连接短信分享
    [ShareSDK connectSMS];
    
    /**
     连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
     http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
     
     如果需要实现SSO，需要导入TencentOpenAPI.framework,并引入QQApiInterface.h和TencentOAuth.h，将QQApiInterface和TencentOAuth的类型传入接口
     **/
    [ShareSDK connectQZoneWithAppKey:@"100371282"
                           appSecret:@"aed9b0303e3ed1e27bae87c33761161d"
                   qqApiInterfaceCls:[QQApiInterface class]
                     tencentOAuthCls:[TencentOAuth class]];
    
    /**
     连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
     http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
     **/
    //    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885" wechatCls:[WXApi class]];
    [ShareSDK connectWeChatWithAppId:@"wx4868b35061f87885"
                           appSecret:@"64020361b8ec4c99936c0e3999a9f249"
                           wechatCls:[WXApi class]];
    /**
     连接QQ应用以使用相关功能，此应用需要引用QQConnection.framework和QQApi.framework库
     http://mobile.qq.com/api/上注册应用，并将相关信息填写到以下字段
     **/
    //旧版中申请的AppId（如：QQxxxxxx类型），可以通过下面方法进行初始化
    //    [ShareSDK connectQQWithAppId:@"QQ075BCD15" qqApiCls:[QQApi class]];
    [ShareSDK connectQQWithQZoneAppKey:@"100371282"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
    /**
     连接Facebook应用以使用相关功能，此应用需要引用FacebookConnection.framework
     https://developers.facebook.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                              appSecret:@"38053202e1a5fe26c80c753071f0b573"];
    
    /**
     连接Twitter应用以使用相关功能，此应用需要引用TwitterConnection.framework
     https://dev.twitter.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectTwitterWithConsumerKey:@"LRBM0H75rWrU9gNHvlEAA2aOy"
                             consumerSecret:@"gbeWsZvA9ELJSdoBzJ5oLKX0TU09UOwrzdGfo9Tg7DjyGuMe8G"
                                redirectUri:@"http://mob.com"];
    
    /**
     连接Google+应用以使用相关功能，此应用需要引用GooglePlusConnection.framework、GooglePlus.framework和GoogleOpenSource.framework库
     https://code.google.com/apis/console上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectGooglePlusWithClientId:@"232554794995.apps.googleusercontent.com"
                               clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
                                redirectUri:@"http://localhost"
                                  signInCls:[GPPSignIn class]
                                   shareCls:[GPPShare class]];
    
    /**
     连接人人网应用以使用相关功能，此应用需要引用RenRenConnection.framework
     http://dev.renren.com上注册人人网开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectRenRenWithAppId:@"226427"
                              appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                           appSecret:@"f29df781abdd4f49beca5a2194676ca4"
                   renrenClientClass:[RennClient class]];
    
    /**
     连接开心网应用以使用相关功能，此应用需要引用KaiXinConnection.framework
     http://open.kaixin001.com上注册开心网开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
                            appSecret:@"da32179d859c016169f66d90b6db2a23"
                          redirectUri:@"http://www.sharesdk.cn/"];
    
    /**
     连接易信应用以使用相关功能，此应用需要引用YiXinConnection.framework
     http://open.yixin.im/上注册易信开放平台应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectYiXinWithAppId:@"yx0d9a9f9088ea44d78680f3274da1765f"
                           yixinCls:[YXApi class]];
    
    //连接邮件
    [ShareSDK connectMail];
    
    //连接打印
    [ShareSDK connectAirPrint];
    
    //连接拷贝
    [ShareSDK connectCopy];
    
    /**
     连接豆瓣应用以使用相关功能，此应用需要引用DouBanConnection.framework
     http://developers.douban.com上注册豆瓣社区应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectDoubanWithAppKey:@"02e2cbe5ca06de5908a863b15e149b0b"
                            appSecret:@"9f1e7b4f71304f2f"
                          redirectUri:@"http://www.sharesdk.cn"];
    
    /**
     连接印象笔记应用以使用相关功能，此应用需要引用EverNoteConnection.framework
     http://dev.yinxiang.com上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                          consumerKey:@"sharesdk-7807"
                       consumerSecret:@"d05bf86993836004"];
    
    /**
     连接LinkedIn应用以使用相关功能，此应用需要引用LinkedInConnection.framework库
     https://www.linkedin.com/secure/developer上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                              secretKey:@"cC7B2jpxITqPLZ5M"
                            redirectUri:@"http://sharesdk.cn"];
    
    /**
     连接Pinterest应用以使用相关功能，此应用需要引用Pinterest.framework库
     http://developers.pinterest.com/上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectPinterestWithClientId:@"1432928"
                              pinterestCls:[Pinterest class]];
    
    /**
     连接Pocket应用以使用相关功能，此应用需要引用PocketConnection.framework
     http://getpocket.com/developer/上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                               redirectUri:@"pocketapp1234"];
    
    /**
     连接Instapaper应用以使用相关功能，此应用需要引用InstapaperConnection.framework
     http://www.instapaper.com/main/request_oauth_consumer_token上注册Instapaper应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
    
    /**
     连接有道云笔记应用以使用相关功能，此应用需要引用YouDaoNoteConnection.framework
     http://note.youdao.com/open/developguide.html#app上注册应用，并将相关信息填写到以下字段
     **/
    [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                   redirectUri:@"http://www.sharesdk.cn/"];
    
    /**
     链接Flickr,此平台需要引用FlickrConnection.framework框架。
     http://www.flickr.com/services/apps/create/上注册应用，并将相关信息填写以下字段。
     **/
    [ShareSDK connectFlickrWithApiKey:@"33d833ee6b6fca49943363282dd313dd"
                            apiSecret:@"3a2c5b42a8fbb8bb"];
    
    /**
     链接Tumblr,此平台需要引用TumblrConnection.framework框架
     http://www.tumblr.com/oauth/apps上注册应用，并将相关信息填写以下字段。
     **/
    [ShareSDK connectTumblrWithConsumerKey:@"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM"
                            consumerSecret:@"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo"
                               callbackUrl:@"http://sharesdk.cn"];
    
    /**
     连接Dropbox应用以使用相关功能，此应用需要引用DropboxConnection.framework库
     https://www.dropbox.com/developers/apps上注册应用，并将相关信息填写以下字段。
     **/
    [ShareSDK connectDropboxWithAppKey:@"i5vw2mex1zcgjcj"
                             appSecret:@"3i9xifsgb4omr0s"
                           callbackUrl:@"https://www.sharesdk.cn"];
    
    /**
     连接Instagram应用以使用相关功能，此应用需要引用InstagramConnection.framework库
     http://instagram.com/developer/clients/register/上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectInstagramWithClientId:@"ff68e3216b4f4f989121aa1c2962d058"
                              clientSecret:@"1b2e82f110264869b3505c3fe34e31a1"
                               redirectUri:@"http://sharesdk.cn"];
    
    /**
     连接VKontakte应用以使用相关功能，此应用需要引用VKontakteConnection.framework库
     http://vk.com/editapp?act=create上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectVKontakteWithAppKey:@"3921561"
                               secretKey:@"6Qf883ukLDyz4OBepYF1"];
    
    /**
     连接明道应用以使用相关功能，此应用需要引用MingDaoConnection.framework库
     http://open.mingdao.com/上注册应用，并将相关信息填写以下字段
     **/
    [ShareSDK connectMingDaoWithAppKey:@"EEEE9578D1D431D3215D8C21BF5357E3"
                             appSecret:@"5EDE59F37B3EFA8F65EEFB9976A4E933"
                           redirectUri:@"http://sharesdk.cn"];
    
    /**
     连接Line应用以使用相关功能，此应用需要引用LineConnection.framework库
     **/
    [ShareSDK connectLine];
    
    /**
     连接WhatsApp应用以使用相关功能，此应用需要引用WhatsAppConnection.framework库
     **/
    [ShareSDK connectWhatsApp];
    
    /**
     连接KakaoTalk应用以使用相关功能，此应用需要引用KakaoTalkConnection.framework库
     **/
    [ShareSDK connectKakaoWithType:ShareTypeKaKaoTalk
                          ByAppKey:@"48d3f524e4a636b08d81b3ceb50f1003"
                        restApiKey:@"ac360fa50b5002637590d24108e6cb10"
                       redirectUri:@"http://www.mob.com/oauth"
                          KakaoCls:[KOSession class]];
    
    /**
     连接KakaoStory应用以使用相关功能，此应用需要引用KakaoStoryConnection.framework库
     **/
    [ShareSDK connectKakaoWithType:ShareTypeKaKaoStory
                          ByAppKey:@"48d3f524e4a636b08d81b3ceb50f1003"
                        restApiKey:@"ac360fa50b5002637590d24108e6cb10"
                       redirectUri:@"http://www.mob.com/oauth"
                          KakaoCls:[KOSession class]];
}

#pragma mark - 如果使用SSO（可以简单理解成跳客户端授权），以下方法是必要的

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

@end
