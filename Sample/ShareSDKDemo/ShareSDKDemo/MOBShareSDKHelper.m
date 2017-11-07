//
//  MOBShareSDKHelper.m
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/1.
//  Copyright © 2017年 mob. All rights reserved.
//
#import "MOBShareSDKHelper.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <ShareSDK/ShareSDK+Base.h>

//新浪微博需要引入的头文件
#ifdef IMPORT_SINA_WEIBO
#import "WeiboSDK.h"
#endif
//QQ需要引入的头文件
#if (defined IMPORT_SUB_QQFriend) || (defined IMPORT_SUB_QZone)
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#endif
//微信需要引入的头文件
#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
#import "WXApi.h"
#endif
//支付宝需要引入的头文件
#if (defined IMPORT_AliPaySocial) || (defined IMPORT_AliPaySocialTimeline)
#import "APOpenAPI.h"
#endif
//美拍需要引入的头文件
#ifdef IMPORT_MeiPai
#import <MPShareSDK/MPShareSDK.h>
#endif
//钉钉需要引入的头文件
#ifdef IMPORT_DingTalk
#import <DTShareKit/DTOpenAPI.h>
#endif
//易信需要引入的头文件
#if (defined IMPORT_SUB_YiXinSession) || (defined IMPORT_SUB_YiXinTimeline) || (defined IMPORT_SUB_YiXinFav)
#import "YXApi.h"
#endif
//FacebookMessenger需要引入的头文件
#ifdef IMPORT_FacebookMessenger
#import <FBSDKMessengerShareKit/FBSDKMessengerShareKit.h>
#endif
//Line需要引入的头文件
#ifdef IMPORT_Line
#import <LineSDK/LineSDK.h>
#endif
//KaKao需要引入的头文件
#if (defined IMPORT_SUB_KakaoTalk) || (defined IMPORT_SUB_KakaoStory)
#import <KakaoOpenSDK/KakaoOpenSDK.h>
#endif

//微信回调
#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
@interface MOBShareSDKHelper ()<WXApiDelegate>
{
    
}
@end
#endif


@implementation MOBShareSDKHelper

+ (void)load
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hasGetAppKey:)
                                                 name:UIApplicationDidFinishLaunchingNotification
                                               object:nil];
}

+ (void)hasGetAppKey:(NSNotification *)notification
{
    [MOBShareSDKHelper shareInstance].platforems = [MOBShareSDKHelper _getPlatforems];
    [ShareSDK registerActivePlatforms:[MOBShareSDKHelper shareInstance].platforems
                             onImport:^(SSDKPlatformType platformType) {
                                 [MOBShareSDKHelper _setConnectorWithPlatformType:platformType];
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                          [MOBShareSDKHelper _setConfigurationWithPlatformType:platformType appInfo:appInfo];
                      }];
    
//#define InitTest
#ifdef InitTest
    [self testShare];
#endif
}

+ (void)testShare
{
    NSLog(@"---------%s---------",__func__);
    BOOL support = [ShareSDK isSupportAuth:SSDKPlatformTypeMeiPai];
    
    NSLog(@"%zd",support);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params SSDKSetupShareParamsByText:@"Text" images:[UIImage imageNamed:@""] url:nil title:@"test" type:SSDKContentTypeAuto];
    
    [ShareSDK share:SSDKPlatformTypeWechat parameters:params onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        NSLog(@"\n--------------->HelperWarning<---------------:\n\nState:%zd,Error:%@\n\n----------------------------------",state,error);
    }];
}

//注册平台
+ (NSArray *)_getPlatforems
{
    NSMutableArray *platforems = [NSMutableArray array];
    //QQ好友
#ifdef IMPORT_SUB_QQFriend
    [platforems addObject:@(SSDKPlatformSubTypeQQFriend)];
#endif
    //QQ空间
#ifdef IMPORT_SUB_QZone
    [platforems addObject:@(SSDKPlatformSubTypeQZone)];
#endif
    //微信好友
#ifdef IMPORT_SUB_WechatSession
    [platforems addObject:@(SSDKPlatformSubTypeWechatSession)];
#endif
    //微信朋友圈
#ifdef IMPORT_SUB_WechatTimeline
    [platforems addObject:@(SSDKPlatformSubTypeWechatTimeline)];
#endif
    //微信收藏
#ifdef IMPORT_SUB_WechatFav
    [platforems addObject:@(SSDKPlatformSubTypeWechatFav)];
#endif
    //微博
#ifdef IMPORT_SINA_WEIBO
    [platforems addObject:@(SSDKPlatformTypeSinaWeibo)];
#endif
    //支付宝好友
#ifdef IMPORT_AliPaySocial
    [platforems addObject:@(SSDKPlatformTypeAliSocial)];
#endif
    //支付宝朋友圈
#ifdef IMPORT_AliPaySocialTimeline
    [platforems addObject:@(SSDKPlatformTypeAliSocialTimeline)];
#endif
    //钉钉
#ifdef IMPORT_DingTalk
    [platforems addObject:@(SSDKPlatformTypeDingTalk)];
#endif
    //腾讯微博
#ifdef IMPORT_TencentWeibo
    [platforems addObject:@(SSDKPlatformTypeTencentWeibo)];
#endif
    //美拍
#ifdef IMPORT_DouBan
    [platforems addObject:@(SSDKPlatformTypeDouBan)];
#endif
    //美拍
#ifdef IMPORT_MeiPai
    [platforems addObject:@(SSDKPlatformTypeMeiPai)];
#endif
    //印象笔记
#ifdef IMPORT_YinXiang
    [platforems addObject:@(SSDKPlatformTypeYinXiang)];
#endif
    //有道云笔记
#ifdef IMPORT_YouDaoNote
    [platforems addObject:@(SSDKPlatformTypeYouDaoNote)];
#endif
    //明道
#ifdef IMPORT_Mingdao
    [platforems addObject:@(SSDKPlatformTypeMingDao)];
#endif
    //开心网
#ifdef IMPORT_Kaixin
    [platforems addObject:@(SSDKPlatformTypeKaixin)];
#endif
    //人人网
#ifdef IMPORT_Renren
    [platforems addObject:@(SSDKPlatformTypeRenren)];
#endif
    //易信好友
#ifdef IMPORT_SUB_YiXinSession
    [platforems addObject:@(SSDKPlatformSubTypeYiXinSession)];
#endif
    //易信朋友圈
#ifdef IMPORT_SUB_YiXinTimeline
    [platforems addObject:@(SSDKPlatformSubTypeYiXinTimeline)];
#endif
    //易信收藏
#ifdef IMPORT_SUB_YiXinFav
    [platforems addObject:@(SSDKPlatformSubTypeYiXinFav)];
#endif
    //Facebook
#ifdef IMPORT_Facebook
    [platforems addObject:@(SSDKPlatformTypeFacebook)];
#endif
    //FacebookMessenger
#ifdef IMPORT_FacebookMessenger
     [platforems addObject:@(SSDKPlatformTypeFacebookMessenger)];
#endif
    //Instagram
#ifdef IMPORT_Instagram
    [platforems addObject:@(SSDKPlatformTypeInstagram)];
#endif
    //Twitter
#ifdef IMPORT_Twitter
    [platforems addObject:@(SSDKPlatformTypeTwitter)];
#endif
    //Line
#ifdef IMPORT_Line
    [platforems addObject:@(SSDKPlatformTypeLine)];
#endif
    //WhatsApp
#ifdef IMPORT_WhatsApp
    [platforems addObject:@(SSDKPlatformTypeWhatsApp)];
#endif
    //GooglePlus
#ifdef IMPORT_GooglePlus
    [platforems addObject:@(SSDKPlatformTypeGooglePlus)];
#endif
    //KakaoTalk
#ifdef IMPORT_SUB_KakaoTalk
    [platforems addObject:@(SSDKPlatformSubTypeKakaoTalk)];
#endif
    //KakaoStory
#ifdef IMPORT_SUB_KakaoStory
    [platforems addObject:@(SSDKPlatformSubTypeKakaoStory)];
#endif
    //YouTube
#ifdef IMPORT_YouTube
    [platforems addObject:@(SSDKPlatformTypeYouTube)];
#endif
    //Flickr
#ifdef IMPORT_Flickr
    [platforems addObject:@(SSDKPlatformTypeFlickr)];
#endif
    //Dropbox
#ifdef IMPORT_Dropbox
    [platforems addObject:@(SSDKPlatformTypeDropbox)];
#endif
    //Evernote
#ifdef IMPORT_Evernote
    [platforems addObject:@(SSDKPlatformTypeEvernote)];
#endif
    //Pinterest
#ifdef IMPORT_Pinterest
    [platforems addObject:@(SSDKPlatformTypePinterest)];
#endif
    //Pocket
#ifdef IMPORT_Pocket
    [platforems addObject:@(SSDKPlatformTypePocket)];
#endif
    //LinkedIn
#ifdef IMPORT_LinkedIn
    [platforems addObject:@(SSDKPlatformTypeLinkedIn)];
#endif
    //VKontakte
#ifdef IMPORT_VKontakte
    [platforems addObject:@(SSDKPlatformTypeVKontakte)];
#endif
    //Instapaper
#ifdef IMPORT_Instapaper
    [platforems addObject:@(SSDKPlatformTypeInstapaper)];
#endif
    //Tumblr
#ifdef IMPORT_Tumblr
    [platforems addObject:@(SSDKPlatformTypeTumblr)];
#endif
    //SMS
#ifdef IMPORT_SMS
    [platforems addObject:@(SSDKPlatformTypeSMS)];
#endif
    //Mail
#ifdef IMPORT_Mail
    [platforems addObject:@(SSDKPlatformTypeMail)];
#endif
    //Copy
#ifdef IMPORT_Copy
    [platforems addObject:@(SSDKPlatformTypeCopy)];
#endif
    //Print
#ifdef IMPORT_Print
    [platforems addObject:@(SSDKPlatformTypePrint)];
#endif
    return platforems;
    
}

//注册平台依赖 Connector
+ (void)_setConnectorWithPlatformType:(SSDKPlatformType)platformType
{
    switch (platformType) {
            //新浪微博
        case SSDKPlatformTypeSinaWeibo:
#ifdef IMPORT_SINA_WEIBO
           [ShareSDKConnector connectWeibo:[WeiboSDK class]];
#endif
            break;
            //QQ
        case SSDKPlatformTypeQQ:
#if (defined IMPORT_SUB_QQFriend) || (defined IMPORT_SUB_QZone)
            [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
#endif
            break;
            //微信
        case SSDKPlatformTypeWechat:
#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
            //如需要获取微信的回调则 在delegate中设置 需实现 WXApiDelegate协议
            [ShareSDKConnector connectWeChat:[WXApi class] delegate:[MOBShareSDKHelper shareInstance]];
#endif
            break;
            //支付宝
        case SSDKPlatformTypeAliSocial:
#if (defined IMPORT_AliPaySocial) || (defined IMPORT_AliPaySocialTimeline)
            [ShareSDKConnector connectAliSocial:[APOpenAPI class]];
#endif
            break;
            //美拍
        case SSDKPlatformTypeMeiPai:
#ifdef IMPORT_MeiPai
            [ShareSDKConnector connectMeiPai:[MPShareSDK class]];
#endif
            break;
            //钉钉
        case SSDKPlatformTypeDingTalk:
#ifdef IMPORT_DingTalk
            [ShareSDKConnector connectDingTalk:[DTOpenAPI class]];
#endif
            break;
            //易信
        case SSDKPlatformTypeYiXin:
#if (defined IMPORT_SUB_YiXinSession) || (defined IMPORT_SUB_YiXinTimeline) || (defined IMPORT_SUB_YiXinFav)
            [ShareSDKConnector connectYiXin:[YXApi class]];
#endif
            break;
            //FacebookMessager
        case SSDKPlatformTypeFacebookMessenger:
#ifdef IMPORT_FacebookMessenger
            [ShareSDKConnector connectFacebookMessenger:[FBSDKMessengerSharer class]];
#endif
            break;
            //Line
        case SSDKPlatformTypeLine:
#ifdef IMPORT_Line
            [ShareSDKConnector connectLine:[LineSDKLogin class]];
#endif
            break;
            //Kakao
        case SSDKPlatformTypeKakao:
#if (defined IMPORT_SUB_KakaoTalk) || (defined IMPORT_SUB_KakaoStory)
            [ShareSDKConnector connectKaKao:[KOSession class]];
#endif
            break;
        default:
            break;
    }
}

//注册平台信息
+ (void)_setConfigurationWithPlatformType:(SSDKPlatformType)platformType appInfo:(NSMutableDictionary *)appInfo
{
    switch (platformType) {
            //新浪微博
        case SSDKPlatformTypeSinaWeibo:
#ifdef IMPORT_SINA_WEIBO
            #pragma mark - 新浪微博 增加权限
            //增加默认权限 如：关注官方微博
//                   [appInfo SSDKSetAuthSettings:@[@"follow_app_official_microblog"]];
            [appInfo SSDKSetupSinaWeiboByAppKey:MOBSSDKSinaWeiboAppKey
                                      appSecret:MOBSSDKSinaWeiboAppSecret
                                    redirectUri:MOBSSDKSinaWeiboRedirectUri
                                       authType:MOBSSDKSinaWeiboAuthType];
#endif
            break;
            //QQ
        case SSDKPlatformTypeQQ:
#if (defined IMPORT_SUB_QQFriend) || (defined IMPORT_SUB_QZone)
            [appInfo SSDKSetupQQByAppId:MOBSSDKQQAppID
                                 appKey:MOBSSDKQQAppKey
                               authType:MOBSSDKQQAuthType
                                 useTIM:MOBSSDKQQUseTIM
                            backUnionID:MOBSSDKQQBackUnionID];
#endif
            break;
            //微信
        case SSDKPlatformTypeWechat:
#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
            [appInfo SSDKSetupWeChatByAppId:MOBSSDKWeChatAppID
                                  appSecret:MOBSSDKWeChatAppSecret
                                backUnionID:MOBSSDKWeChatBackUnionID];
#endif
            break;
            //支付宝
        case SSDKPlatformTypeAliSocial:
#if (defined IMPORT_AliPaySocial) || (defined IMPORT_AliPaySocialTimeline)
            [appInfo SSDKSetupAliSocialByAppId:MOBSSDKAliPayAppID];
#endif
            break;
            //美拍
        case SSDKPlatformTypeMeiPai:
#ifdef IMPORT_MeiPai
            [appInfo SSDKSetupMeiPaiByAppKey:MOBSSDKMeiPaiAppKey];
#endif
            break;
            //钉钉
        case SSDKPlatformTypeDingTalk:
#ifdef IMPORT_DingTalk
            [appInfo SSDKSetupDingTalkByAppId:MOBSSDKDingTalkAppId];
#endif
            break;
            //豆瓣
        case SSDKPlatformTypeDouBan:
#ifdef IMPORT_DouBan
            [appInfo SSDKSetupDouBanByApiKey:MOBSSDKDouBanApiKey
                                      secret:MOBSSDKDouBanSecret
                                 redirectUri:MOBSSDKDouBanRedirectUri];
#endif
            break;
        case SSDKPlatformTypeTencentWeibo:
            //腾讯微博
#ifdef IMPORT_TencentWeibo
            [appInfo SSDKSetupTencentWeiboByAppKey:MOBSSDKTencentWeiboAppKey
                                         appSecret:MOBSSDKTencentWeiboAppSecret
                                       redirectUri:MOBSSDKTencentWeiboRedirectUri];
#endif
            break;
            //印象笔记
        case SSDKPlatformTypeYinXiang:
#ifdef IMPORT_YinXiang
            [appInfo SSDKSetupEvernoteByConsumerKey:MOBSSDKEvernoteConsumerKey
                                     consumerSecret:MOBSSDKEvernoteConsumerSecret
                                            sandbox:MOBSSDKEvernoteSandbox];
#endif
            break;
            //有道云笔记
        case SSDKPlatformTypeYouDaoNote:
#ifdef IMPORT_YouDaoNote
            [appInfo SSDKSetupYouDaoNoteByConsumerKey:MOBSSDKYouDaoNoteConsumerKey
                                       consumerSecret:MOBSSDKYouDaoNoteConsumerSecret
                                        oauthCallback:MOBSSDKYouDaoNoteOauthCallback];
#endif
            break;
            //明道
        case SSDKPlatformTypeMingDao:
#ifdef IMPORT_Mingdao
            [appInfo SSDKSetupMingDaoByAppKey:MOBSSDKMingdaoAppKey
                                    appSecret:MOBSSDKMingdaoAppSecret
                                  redirectUri:MOBSSDKMingdaoRedirectUri];
#endif
            break;
            //开心网
        case SSDKPlatformTypeKaixin:
#ifdef IMPORT_Kaixin
            [appInfo SSDKSetupKaiXinByApiKey:MOBSSDKKaiXinApiKey
                                   secretKey:MOBSSDKKaiXinSecretKey
                                 redirectUri:MOBSSDKKaiXinRedirectUri];
#endif
            break;
            //人人网
        case SSDKPlatformTypeRenren:
#ifdef IMPORT_Renren
            [appInfo SSDKSetupRenRenByAppId:MOBSSDKRenrenAppId
                                     appKey:MOBSSDKRenrenAppKey
                                  secretKey:MOBSSDKRenrenSecretKey
                                   authType:MOBSSDKRenrenAuthType];
#endif
            break;
            //易信
        case SSDKPlatformTypeYiXin:
#if (defined IMPORT_SUB_YiXinSession) || (defined IMPORT_SUB_YiXinTimeline) || (defined IMPORT_SUB_YiXinFav)
            [appInfo SSDKSetupYiXinByAppId:MOBSSDKYiXinAppId
                                 appSecret:MOBSSDKYiXinAppSecret
                               redirectUri:MOBSSDKYiXinRedirectUri
                                  authType:MOBSSDKYiXinAuthType];
#endif
            break;
            //Facebook
        case SSDKPlatformTypeFacebook:
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
            [appInfo SSDKSetupFacebookByApiKey:MOBSSDKFacebookAppID
                                     appSecret:MOBSSDKFacebookAppSecret
                                   displayName:MOBSSDKFacebookDisplayName
                                      authType:MOBSSDKFacebookAuthType];
#endif
            break;
            //Instagram
        case SSDKPlatformTypeInstagram:
#ifdef IMPORT_Instagram
            [appInfo SSDKSetupInstagramByClientID:MOBSSDKInstagramClientID
                                     clientSecret:MOBSSDKInstagramClientSecret
                                      redirectUri:MOBSSDKInstagramRedirectUri];
#endif
            break;
            //Twitter
        case SSDKPlatformTypeTwitter:
#ifdef IMPORT_Twitter
        [appInfo SSDKSetupTwitterByConsumerKey:MOBSSDKTwitterConsumerKey
                                consumerSecret:MOBSSDKTwitterConsumerSecret
                                   redirectUri:MOBSSDKTwitterRedirectUri];
#endif
            break;
            //Line
        case SSDKPlatformTypeLine:
#ifdef IMPORT_Line
            [appInfo SSDKSetupLineAuthType:MOBSSDKLineAuthType];
#endif
            break;
            //GooglePlus
        case SSDKPlatformTypeGooglePlus:
#ifdef IMPORT_GooglePlus
            [appInfo SSDKSetupGooglePlusByClientID:MOBSSDKGooglePlusClientID
                                      clientSecret:MOBSSDKGooglePlusClientSecret
                                       redirectUri:MOBSSDKGooglePlusRedirectUri];
#endif
            break;
            //Kakao
        case SSDKPlatformTypeKakao:
#if (defined IMPORT_SUB_KakaoTalk) || (defined IMPORT_SUB_KakaoStory)
            [appInfo SSDKSetupKaKaoByAppKey:MOBSSDKKaKaoAppKey
                                 restApiKey:MOBSSDKKaKaoRestApiKey
                                redirectUri:MOBSSDKKaKaoRedirectUri
                                   authType:MOBSSDKKaKaoAuthType];
#endif
            break;
            //YouTube
        case SSDKPlatformTypeYouTube:
#ifdef IMPORT_YouTube
            [appInfo SSDKSetupYouTubeByClientId:MOBSSDKYouTubeClientId
                                   clientSecret:MOBSSDKYouTubeClientSecret
                                    redirectUri:MOBSSDKYouTubeRedirectUri];
#endif
            break;
            //Flickr
        case SSDKPlatformTypeFlickr:
#ifdef IMPORT_Flickr
            [appInfo SSDKSetupFlickrByApiKey:MOBSSDKFlickrApiKey
                                   apiSecret:MOBSSDKFlickrApiSecret];
#endif
            break;
            //Dropbox
        case SSDKPlatformTypeDropbox:
#ifdef IMPORT_Dropbox
            [appInfo SSDKSetupDropboxByAppKey:MOBSSDKDropboxAppKey
                                    appSecret:MOBSSDKDropboxAppSecret
                                oauthCallback:MOBSSDKDropboxOauthCallback];
#endif
            break;
            //Evernote
        case SSDKPlatformTypeEvernote:
#ifdef IMPORT_Evernote
            [appInfo SSDKSetupEvernoteByConsumerKey:MOBSSDKEvernoteConsumerKey
                                     consumerSecret:MOBSSDKEvernoteConsumerSecret
                                            sandbox:MOBSSDKEvernoteSandbox];
#endif
            break;
        //Pinterest
        case SSDKPlatformTypePinterest:
#ifdef IMPORT_Pinterest
        [appInfo SSDKSetupPinterestByClientId:MOBSSDKPinterestClientId];
#endif
        break;
            //Pocket
        case SSDKPlatformTypePocket:
#ifdef IMPORT_Pocket
            [appInfo SSDKSetupPocketByConsumerKey:MOBSSDKPocketConsumerKey
                                      redirectUri:MOBSSDKPocketRedirectUri
                                         authType:MOBSSDKPocketAuthType];
#endif
            break;
            //LinkedIn
        case SSDKPlatformTypeLinkedIn:
#ifdef IMPORT_LinkedIn
            [appInfo SSDKSetupLinkedInByApiKey:MOBSSDKLinkedInApiKey
                                     secretKey:MOBSSDKLinkedInSecretKey
                                   redirectUrl:MOBSSDKLinkedInRedirectUrl];
#endif
            break;
            //VKontakte
        case SSDKPlatformTypeVKontakte:
#ifdef IMPORT_VKontakte
            [appInfo SSDKSetupVKontakteByApplicationId:MOBSSDKVKontakteApplicationId
                                             secretKey:MOBSSDKVKontakteSecretKey
                                              authType:MOBSSDKVKontakteAuthType];
#endif
            break;
            //Instapaper
        case SSDKPlatformTypeInstapaper:
#ifdef IMPORT_Instapaper
            [appInfo SSDKSetupInstapaperByConsumerKey:MOBSSDKInstapaperConsumerKey
                                       consumerSecret:MOBSSDKInstapaperConsumerSecret];
#endif
            break;
            //Tumblr
        case SSDKPlatformTypeTumblr:
#ifdef IMPORT_Tumblr
            [appInfo SSDKSetupTumblrByConsumerKey:MOBSSDKTumblrConsumerKey
                                   consumerSecret:MOBSSDKTumblrConsumerSecret
                                      callbackUrl:MOBSSDKTumblrCallbackUrl];
#endif
            break;
        case SSDKPlatformTypeSMS:
#ifdef IMPORT_SMS
            [appInfo SSDKSetpSMSOpenCountryList:MOBSSDKSMSOpenCountryList];
#endif
            break;
        default:
            break;
    }
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

#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
//微信的回调
-(void) onReq:(BaseReq*)req
{
    NSLog(@"wechat req %@",req);
}

-(void) onResp:(BaseResp*)resp
{
    NSLog(@"wechat resp %@",resp);
}
#endif
@end
