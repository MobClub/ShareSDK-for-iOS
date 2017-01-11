//
//  NSMutableDictionary+ShareSDK.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/6.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDKTypeDefine.h"

/**
 *  初始化分享平台相关
 */
@interface NSMutableDictionary (SSDKInit)

/**
 *  设置平台的授权配置
 *
 *  @param authSettings 授权配置信息
 *                      例如在配置新浪微博的初始化信息中设置授权配置信息:
 *                      [appInfo SSDKSetAuthSettings:@[@"follow_app_official_microblog"]];
 */
- (void)SSDKSetAuthSettings:(NSArray *)authSettings;

/**
 *  设置新浪微博应用信息
 *
 *  @param appKey       应用标识
 *  @param appSecret    应用密钥
 *  @param redirectUri  回调地址
 *  @param authType     授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupSinaWeiboByAppKey:(NSString *)appKey
                         appSecret:(NSString *)appSecret
                       redirectUri:(NSString *)redirectUri
                          authType:(NSString *)authType;

/**
 *  设置微信(微信好友，微信朋友圈、微信收藏)应用信息
 *
 *  @param appId      应用标识
 *  @param appSecret  应用密钥
 */
- (void)SSDKSetupWeChatByAppId:(NSString *)appId
                     appSecret:(NSString *)appSecret;

/**
 *  设置Twitter应用信息
 *
 *  @param consumerKey    应用标识
 *  @param consumerSecret 应用密钥
 *  @param redirectUri    回调地址
 */
- (void)SSDKSetupTwitterByConsumerKey:(NSString *)consumerKey
                       consumerSecret:(NSString *)consumerSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *  设置QQ分享平台（QQ空间，QQ好友分享）应用信息
 *
 *  @param appId          应用标识
 *  @param appKey         应用Key
 *  @param authType       授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupQQByAppId:(NSString *)appId
                    appKey:(NSString *)appKey
                  authType:(NSString *)authType;

/**
 *  设置Facebook应用信息
 *
 *  @param apiKey       应用标识
 *  @param appSecret    应用密钥
 *  @param authType     授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupFacebookByApiKey:(NSString *)apiKey
                        appSecret:(NSString *)appSecret
                         authType:(NSString *)authType;

/**
 *  设置Facebook应用信息
 *
 *  @param apiKey       应用标识
 *  @param appSecret    应用密钥
 *  @param displayName  分享后显示的app名称 需与facebook后台配置一致 使用SSO分享必须
 *  @param authType     授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupFacebookByApiKey:(NSString *)apiKey
                        appSecret:(NSString *)appSecret
                      displayName:(NSString *)displayName
                         authType:(NSString *)authType;


/**
 *  设置腾讯微博应用信息
 *
 *  @param appKey        应用标识
 *  @param appSecret     应用密钥
 *  @param redirectUri   回调地址
 *  @param authType      授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupTencentWeiboByAppKey:(NSString *)appKey
                            appSecret:(NSString *)appSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *  设置豆瓣应用信息
 *
 *  @param apiKey      应用标识
 *  @param secret      应用密钥
 *  @param redirectUri 回调地址
 */
- (void)SSDKSetupDouBanByApiKey:(NSString *)apiKey
                         secret:(NSString *)secret
                    redirectUri:(NSString *)redirectUri;

/**
 *  设置人人网应用信息
 *
 *  @param appId     应用标识
 *  @param appKey    应用Key
 *  @param secretKey 应用密钥
 *  @param authType  授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupRenRenByAppId:(NSString *)appId
                        appKey:(NSString *)appKey
                     secretKey:(NSString *)secretKey
                      authType:(NSString *)authType;

/**
 *  设置开心网应用信息
 *
 *  @param apiKey      应用标识
 *  @param secretKey   应用密钥
 *  @param redirectUri 回调地址
 */
- (void)SSDKSetupKaiXinByApiKey:(NSString *)apiKey
                      secretKey:(NSString *)secretKey
                    redirectUri:(NSString *)redirectUri;

/**
 *  设置Pocket应用信息
 *
 *  @param consumerKey 应用标识
 *  @param redirectUri 回调地址
 *  @param authType    授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupPocketByConsumerKey:(NSString *)consumerKey
                         redirectUri:(NSString *)redirectUri
                            authType:(NSString *)authType;

/**
 *  设置Google＋应用信息
 *
 *  @param clientId     应用标识
 *  @param clientSecret 应用密钥
 *  @param redirectUri  回调地址
 */
- (void)SSDKSetupGooglePlusByClientID:(NSString *)clientId
                         clientSecret:(NSString *)clientSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *  设置Instagram应用信息
 *
 *  @param clientId     应用标识
 *  @param clientSecret 应用密钥
 *  @param redirectUri  回调地址
 */
- (void)SSDKSetupInstagramByClientID:(NSString *)clientId
                        clientSecret:(NSString *)clientSecret
                         redirectUri:(NSString *)redirectUri;

/**
 *  设置LinkedIn应用信息
 *
 *  @param apiKey      应用标识
 *  @param secretKey   应用密钥
 *  @param redirectUrl 回调地址
 */
- (void)SSDKSetupLinkedInByApiKey:(NSString *)apiKey
                        secretKey:(NSString *)secretKey
                      redirectUrl:(NSString *)redirectUrl;

/**
 *  设置Tumblr应用信息
 *
 *  @param consumerKey    应用标识
 *  @param consumerSecret 应用密钥
 *  @param callbackUrl    回调地址
 */
- (void)SSDKSetupTumblrByConsumerKey:(NSString *)consumerKey
                      consumerSecret:(NSString *)consumerSecret
                         callbackUrl:(NSString *)callbackUrl;

/**
 *  设置Flickr应用信息
 *
 *  @param apiKey    应用标识
 *  @param apiSecret 应用密钥
 */
- (void)SSDKSetupFlickrByApiKey:(NSString *)apiKey
                      apiSecret:(NSString *)apiSecret;

/**
 *  设置有道云笔记应用信息
 *
 *  @param consumerKey    应用标识
 *  @param consumerSecret 应用密钥
 *  @param oauthCallback    回调地址
 */
- (void)SSDKSetupYouDaoNoteByConsumerKey:(NSString *)consumerKey
                          consumerSecret:(NSString *)consumerSecret
                           oauthCallback:(NSString *)oauthCallback;

/**
 *  设置印象笔记应用信息，注：中国版和国际版都是调用此接口进行初始化操作。
 *
 *  @param consumerKey    应用标识
 *  @param consumerSecret 应用密钥
 *  @param sandbox        是否为沙箱模式, YES 沙箱模式，NO 非沙箱模式
 */
- (void)SSDKSetupEvernoteByConsumerKey:(NSString *)consumerKey
                        consumerSecret:(NSString *)consumerSecret
                               sandbox:(BOOL)sandbox;

/**
 *  设置支付宝好友应用信息
 *
 *  @param appId 应用标识
 */
- (void)SSDKSetupAliPaySocialByAppId:(NSString *)appId;

/**
 *  设置Pinterest应用信息
 *
 *  @param clientId 应用标识
 */
- (void)SSDKSetupPinterestByClientId:(NSString *)clientId;

/**
 *  设置KaKao应用信息
 *
 *  @param appKey   应用标识, 当使用客户端授权分享和授权时需要传入该标识
 *  @param restApiKey  RestApi标识
 *  @param reidrectUri 回调地址
 *  @param authType    授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupKaKaoByAppKey:(NSString *)appKey
                    restApiKey:(NSString *)restApiKey
                   redirectUri:(NSString *)redirectUri
                      authType:(NSString *)authType;

/**
 *  设置Dropbox应用信息
 *
 *  @param appKey        应用标识
 *  @param appSecret     应用密钥
 *  @param oauthCallback 回调地址
 */
- (void)SSDKSetupDropboxByAppKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret
                   oauthCallback:(NSString *)oauthCallback;

/**
 *  设置VKontakte应用信息
 *
 *  @param applicationId 应用标识
 *  @param secretKey     应用密钥
 *  @param authType    授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupVKontakteByApplicationId:(NSString *)applicationId
                                secretKey:(NSString *)secretKey;

- (void)SSDKSetupVKontakteByApplicationId:(NSString *)applicationId
                                secretKey:(NSString *)secretKey
                                 authType:(NSString *)authType;

/**
 *  设置明道应用信息
 *
 *  @param appKey      应用标识
 *  @param appSecret   应用密钥
 *  @param redirectUri 回调地址
 */
- (void)SSDKSetupMingDaoByAppKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret
                     redirectUri:(NSString *)redirectUri;

/**
 *  设置易信(易信好友，易信朋友圈、易信收藏)应用信息
 *
 *  @param appId        应用标识
 *  @param appSecret    应用密钥
 *  @param redirectUri  回调地址
 *  @param authType     授权方式。值可以是：SSDKAuthTypeSSO、SSDKAuthTypeWeb、SSDKAuthTypeBoth，分别代表SSO、网页授权、SSO＋网页授权。
 */
- (void)SSDKSetupYiXinByAppId:(NSString *)appId
                    appSecret:(NSString *)appSecret
                  redirectUri:(NSString *)redirectUri
                     authType:(NSString *)authType;

/**
 *  设置Instapaper
 *
 *  @param consumerKey    应用标识
 *  @param comsumerSecret 应用密钥
 */
- (void)SSDKSetupInstapaperByConsumerKey:(NSString *)consumerKey
                          consumerSecret:(NSString *)consumerSecret;
/**
 *  设置钉钉应用信息
 *
 *  @param appId 应用标识
 */
- (void)SSDKSetupDingTalkByAppId:(NSString *)appId;
@end
