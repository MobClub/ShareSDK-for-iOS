//
//  MOBShareSDKHelper.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/1.
//  Copyright © 2017年 mob. All rights reserved.
//
#import "MOBShareSDKHelper.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
#import <WechatConnector/WechatConnector.h>

@implementation MOBShareSDKHelper

+ (void)load
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_didFinishLaunch:)
                                                 name:UIApplicationDidFinishLaunchingNotification
                                               object:nil];
}

+ (void)_didFinishLaunch:(NSNotification *)notification
{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {

#ifdef IMPORT_SINA_WEIBO
        [platformsRegister setupSinaWeiboWithAppkey:MOBSSDKSinaWeiboAppKey appSecret:MOBSSDKSinaWeiboAppSecret redirectUrl:MOBSSDKSinaWeiboRedirectUri];
#endif

#if (defined IMPORT_SUB_QQFriend) || (defined IMPORT_SUB_QZone)
        [platformsRegister setupQQWithAppId:MOBSSDKQQAppID appkey:MOBSSDKQQAppKey];
#endif

#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
        [platformsRegister setupWeChatWithAppId:MOBSSDKWeChatAppID appSecret:MOBSSDKWeChatAppSecret];
#endif

#if (defined IMPORT_AliPaySocial) || (defined IMPORT_AliPaySocialTimeline)
        [platformsRegister setupAliSocialWithAppId:MOBSSDKAliPayAppID];
#endif

#ifdef IMPORT_MeiPai
        [platformsRegister setupMeiPaiWithAppkey:MOBSSDKMeiPaiAppKey];
#endif

#ifdef IMPORT_DingTalk
        [platformsRegister setupDingTalkWithAppId:MOBSSDKDingTalkAppId];
#endif

#ifdef IMPORT_DouBan
        [platformsRegister setupDouBanWithApikey:MOBSSDKDouBanApiKey appSecret:MOBSSDKDouBanSecret redirectUrl:MOBSSDKDouBanRedirectUri];
#endif

#ifdef IMPORT_TencentWeibo
        [platformsRegister setupTencentWeiboWithAppkey:MOBSSDKTencentWeiboAppKey appSecret:MOBSSDKTencentWeiboAppSecret redirectUrl:MOBSSDKTencentWeiboRedirectUri];
#endif

#ifdef IMPORT_YinXiang
        [platformsRegister setupEvernoteByConsumerKey:MOBSSDKEvernoteConsumerKey consumerSecret:MOBSSDKEvernoteConsumerSecret sandbox:MOBSSDKEvernoteSandbox];
#endif

#ifdef IMPORT_YouDaoNote
        [platformsRegister setupYouDaoNoteWithConsumerKey:MOBSSDKYouDaoNoteConsumerKey consumerSecret:MOBSSDKYouDaoNoteConsumerSecret oauthCallback:MOBSSDKYouDaoNoteOauthCallback];
#endif

#ifdef IMPORT_Mingdao
        [platformsRegister setupMingDaoByAppKey:MOBSSDKMingdaoAppKey appSecret:MOBSSDKMingdaoAppSecret redirectUrl:MOBSSDKMingdaoRedirectUri];
#endif

#ifdef IMPORT_Kaixin
        [platformsRegister setupKaiXinByApiKey:MOBSSDKKaiXinApiKey secretKey:MOBSSDKKaiXinSecretKey redirectUrl:MOBSSDKKaiXinRedirectUri];
#endif

#ifdef IMPORT_Renren
        [platformsRegister setupRenRenWithAppId:MOBSSDKRenrenAppId appKey:MOBSSDKRenrenAppKey secretKey:MOBSSDKRenrenSecretKey authType:MOBSSDKRenrenAuthType];
#endif

#if (defined IMPORT_SUB_YiXinSession) || (defined IMPORT_SUB_YiXinTimeline) || (defined IMPORT_SUB_YiXinFav)
        [platformsRegister setupYiXinByAppId:MOBSSDKYiXinAppId appSecret:MOBSSDKYiXinAppSecret redirectUrl:MOBSSDKYiXinRedirectUri];
#endif

#ifdef IMPORT_Facebook
#pragma mark - Facebook 重设权限
                //                  [appInfo SSDKSetAuthSettings:@[
                //                                                 @"public_profile",//默认(无需审核)
                //                                                 @"user_friends",//好友列表(无需审核)
                //                                                 @"email",//邮箱(无需审核)
                //                                                 @"user_about_me",//用户个人说明(需审核)
                //                                                 @"publish_actions",//应用内分享 必要权限(需审核)
                //                                                 @"user_videos"//应用内视频分享 必要权限(需审核)
                //                                                 ]];

        [platformsRegister setupFacebookWithAppkey:MOBSSDKFacebookAppID appSecret:MOBSSDKFacebookAppSecret displayName:MOBSSDKFacebookDisplayName];
#endif

#ifdef IMPORT_Instagram
        [platformsRegister setupInstagramWithClientId:MOBSSDKInstagramClientID clientSecret:MOBSSDKInstagramClientSecret redirectUrl:MOBSSDKInstagramRedirectUri];
#endif

#ifdef IMPORT_Twitter
         [platformsRegister setupTwitterWithKey:MOBSSDKTwitterConsumerKey secret:MOBSSDKTwitterConsumerSecret redirectUrl:MOBSSDKTwitterRedirectUri];
#endif

#ifdef IMPORT_Line
        [platformsRegister setupLineAuthType:MOBSSDKLineAuthType];
#endif

#ifdef IMPORT_GooglePlus
        [platformsRegister setupGooglePlusByClientID:MOBSSDKGooglePlusClientID clientSecret:MOBSSDKGooglePlusClientSecret redirectUrl:MOBSSDKGooglePlusRedirectUri];
#endif

#if (defined IMPORT_SUB_KakaoTalk) || (defined IMPORT_SUB_KakaoStory)
        [platformsRegister setupKaKaoWithAppkey:MOBSSDKKaKaoAppKey restApiKey:MOBSSDKKaKaoRestApiKey redirectUrl:MOBSSDKKaKaoRedirectUri];
#endif

#ifdef IMPORT_YouTube
        [platformsRegister setupYouTubeWithClientId:MOBSSDKYouTubeClientId clientSecret:MOBSSDKYouTubeClientSecret redirectUrl:MOBSSDKYouTubeRedirectUri];
#endif

#ifdef IMPORT_Flickr
        [platformsRegister setupFlickrWithApiKey:MOBSSDKFlickrApiKey apiSecret:MOBSSDKFlickrApiSecret];
#endif

#ifdef IMPORT_Dropbox
        [platformsRegister setupDropboxWithAppKey:MOBSSDKDropboxAppKey appSecret:MOBSSDKDropboxAppSecret redirectUrl:MOBSSDKDropboxOauthCallback];
#endif

#ifdef IMPORT_Evernote
        [platformsRegister setupEvernoteByConsumerKey:MOBSSDKEvernoteConsumerKey consumerSecret:MOBSSDKEvernoteConsumerSecret sandbox:MOBSSDKEvernoteSandbox];
#endif

#ifdef IMPORT_Pinterest
        [platformsRegister setupPinterestByClientId:MOBSSDKPinterestClientId];
#endif

#ifdef IMPORT_Pocket
        [platformsRegister setupPocketWithConsumerKey:MOBSSDKPocketConsumerKey redirectUrl:MOBSSDKPocketRedirectUri];
#endif

#ifdef IMPORT_LinkedIn
        [platformsRegister setupLinkedInByApiKey:MOBSSDKLinkedInApiKey secretKey:MOBSSDKLinkedInSecretKey redirectUrl:MOBSSDKLinkedInRedirectUrl];
#endif

#ifdef IMPORT_VKontakte
        [platformsRegister setupVKontakteWithApplicationId:MOBSSDKVKontakteApplicationId secretKey:MOBSSDKVKontakteSecretKey authType:MOBSSDKVKontakteAuthType];
#endif

#ifdef IMPORT_Instapaper
        [platformsRegister setupInstapaperWithConsumerKey:MOBSSDKInstapaperConsumerKey consumerSecret:MOBSSDKInstapaperConsumerSecret];
#endif

#ifdef IMPORT_Tumblr
        [platformsRegister setupTumblrByConsumerKey:MOBSSDKTumblrConsumerKey consumerSecret:MOBSSDKTumblrConsumerSecret redirectUrl:MOBSSDKTumblrCallbackUrl];
#endif

#ifdef IMPORT_SMS
        [platformsRegister setupSMSOpenCountryList:MOBSSDKSMSOpenCountryList];
#endif

#ifdef IMPORT_CMCC
        [platformsRegister setupCMCCByAppId:MOBSSDKCMCCAppId appKey:MOBSSDKCMCCAppKey displayUI:MOBSSDKCMCCDisplayUI];
#endif

#ifdef IMPORT_Telegram
        [platformsRegister setupTelegramByBotToken:MOBSSDKTelegramBotToken botDomain:MOBSSDKTelegramBotDomain];
#endif
        
#ifdef IMPORT_Reddit
        [platformsRegister setupRedditByAppKey:MOBSSDKRedditAppKey redirectUri:MOBSSDKRedditRedirectUri];
#endif
        
#ifdef IMPORT_ESurfing
        [platformsRegister setupESurfingByAppKey:MOBSSDKESurfingAppkey appSecret:MOBSSDKESurfingAppSecret appName:MOBSSDKESurfingAppName];
#endif
    }];
    
#define InitTest
#ifdef InitTest
                [self testShare];
#endif
//    });
}

+ (void)testShare
{
//    [WeChatConnector openMiniProgramWithUserName:@"gh_afb25ac019c9" path:@"pages/index/index" miniProgramType:0];
}

+ (MOBShareSDKHelper *)shareInstance
{
    static MOBShareSDKHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[MOBShareSDKHelper alloc] init];
    });
    return helper;
}

-(void) onReq:(id)req
{
    NSLog(@"wechat req %@",req);
}

-(void) onResp:(id)resp
{
    NSLog(@"wechat resp %@",resp);
}


@end
