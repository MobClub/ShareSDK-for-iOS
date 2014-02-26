//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "NSArray+ShareSDK.h"
#import "ShareSDKTypeDef.h"
#import "ShareSDKEventHandlerDef.h"
#import "ShareSDKDef.h"
#import "ISSAuthOptions.h"
#import "ISSViewDelegate.h"
#import "ISSPage.h"
#import "ISSContent.h"
#import "ISSShareActionSheet.h"
#import "ISSShareOptions.h"
#import "ISSShareViewDelegate.h"
#import "ISSShareActionSheetItem.h"
#import "ISSUserField.h"
#import "SSAwardViewController.h"
#import "UIViewController+ShareSDK.h"

/**
 *	@brief	ShareSDK function interface class, all functions performed by such offers (including sharing, authorization, etc.)
 */
@interface ShareSDK : NSObject

/**
 *	@brief	Register app.This method is called when the application starts and can be called only once in the main thread.
 *
 *	@param 	appKey 	App key. Registered ShareSDK app in the official website and get an app key.
 */
+ (void)registerApp:(NSString *)appKey;

/**
 *	@brief	Register app.
 *
 *  @since  ver2.2.6
 *  @since  ver2.9.0 
 *
 *  @deprecated     Has deprecated, the default configuration will use both local and server hosting configuration. Its priority is: server hosting Configuration > Local Configuration
 *
 *	@param 	appKey 	App Key. Registered ShareSDK app in the official website and get an app key.
 *	@param 	useAppTrusteeship 	Whether to use the platform information hosting. If you get the information in the server platform configured for YES, NO, said access to the local configuration information.
 */
+ (void)registerApp:(NSString *)appKey useAppTrusteeship:(BOOL)useAppTrusteeship;


#pragma mark 设置

/**
 *	@brief	SSO Login enabled.
 *
 *	@param 	ssoEnabled 	YES indicates using SSO Login, NO indicates that the SSO Login is not used, the default is YES
 */
+ (void)ssoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	Set statistical policy, in 3G environment by setting the following policies to reduce the flow of network requests.
 *
 *	@param 	policy 	Statistical policy.
 */
+ (void)setStatPolicy:(SSCStatPolicy)policy;

/**
 *	@brief	Set enabled state statistics.
 *
 *  @since  ver2.2.0
 *  @deprecated Deprecated，Use allowExchangeDataEnabled method instead.
 *
 *	@param 	statEnabled 	YES indicates the use of statistical functions, NO indicates they did not use statistical functions
 */
+ (void)statEnabled:(BOOL)statEnabled;

/**
 *	@brief	Whether it is allowed to exchange data with the server. This is a switch attribute, if set to NO, including statistical data, to obtain operating online App configuration information and all interaction with the server are not allowed to call.
 *
 *  @since  ver2.2.6
 *
 *	@param 	enabled 	YES means allowed to communicate with the server, NO if not allowed to communicate
 */
+ (void)allowExchangeDataEnabled:(BOOL)enabled;

/**
 *	@brief	Set application hosting mode, when set to YES, to initialize the sharing platform from server configuration.
 *          Note: When allowExchangeDataEnabled set to NO, this is invalid.
 *
 *  @since  ver2.2.6
 *
 *	@param 	enabled 	YES indicates using managed application mode, NO said they did not use the hosted application model.
 */
+ (void)useAppTrusteeship:(BOOL)enabled;


#pragma mark 初始化

/**
 *	@brief	Initialize sharing paltform.
 *
 *  @since  ver2.6.0
 *
 *	@param 	type 	Platform type.
 *	@param 	appInfo 	App information.
 */
+ (void)connectPlatformWithType:(ShareType)type
                       platform:(id<ISSPlatform>)platform
                        appInfo:(NSDictionary *)appInfo;

/**
 *	@brief	Initialize Sina Weibo platform，This platform need import SinaWeiboConnection.framework
 *          Go to http://open.weibo.com and register Sina Weibo open platform app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey  App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect url,Sina default callback page https://api.weibo.com/oauth2/default.html can fill when there is no or no callback.
 *                          However, the app of open platform Sina callback address must complete this value
 */
+ (void)connectSinaWeiboWithAppKey:(NSString *)appKey
                         appSecret:(NSString *)appSecret
                       redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Sina Weibo platform，This platform need import SinaWeiboConnection.framework
 *          Go to http://open.weibo.com and register Sina Weibo open platform app，Then fill in the relevant information into the field below
 *
 *  @since  ver 2.4.0
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect url,Sina default callback page https://api.weibo.com/oauth2/default.html can fill when there is no or no callback.
 *                          However, the app of open platform Sina callback address must complete this value
 *  @param  weiboSDKCls     Sina Weibo SDK class, you should import libWeiboSDK.a, then passed [WeiboSDK class] this parameter.
 */
+ (void)connectSinaWeiboWithAppKey:(NSString *)appKey
                         appSecret:(NSString *)appSecret
                       redirectUri:(NSString *)redirectUri
                       weiboSDKCls:(Class)weiboSDKCls;

/**
 *	@brief	Initialize Tencent Weibo platform.This platform need import TencentWeiboConnection.framework
 *          Go to http://dev.t.qq.com and register Tencent Weibo open platform app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect url. This address was app address.
 */
+ (void)connectTencentWeiboWithAppKey:(NSString *)appKey
                            appSecret:(NSString *)appSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Tencent Weibo platform.This platform need import TencentWeiboConnection.framework
 *          Go to http://dev.t.qq.com and register Tencent Weibo open platform app，Then fill in the relevant information into the field below
 *
 *  @since  ver2.2.0
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect url. This address was app address.
 *  @param  wbApiCls    Tencent Weibo SDK class, you should import WeiboApi.h, then passed [WeiboApi class] this parameter.
 */
+ (void)connectTencentWeiboWithAppKey:(NSString *)appKey
                            appSecret:(NSString *)appSecret
                          redirectUri:(NSString *)redirectUri
                             wbApiCls:(Class)wbApiCls;


/**
 *	@brief	Initialize QZone platform.This platform need import QZoneConnection.framework
 *          Go to http://connect.qq.com/intro/login/and and register QQ Connect app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 */
+ (void)connectQZoneWithAppKey:(NSString *)appKey
                     appSecret:(NSString *)appSecret;

/**
 *	@brief	Initialize QZone platform.This platform need import QZoneConnection.framework
 *          Go to http://connect.qq.com/intro/login/and and register QQ Connect app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *  @param  qqApiInterfaceCls   QQApi class, If no SSO login can be set to nil
 *  @param  tencentOAuthCls     TencentOauth class, If no SSO login can be set to nil
 */
+ (void)connectQZoneWithAppKey:(NSString *)appKey
                     appSecret:(NSString *)appSecret
             qqApiInterfaceCls:(Class)qqApiInterfaceCls
               tencentOAuthCls:(Class)tencentOAuthCls;

/**
 *	@brief	Initialize NetEase Weibo platform，This platform need import T163WeiboConnection.framework
 *          Go to http://open.t.163.com and register NetEase Weibo open platform app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connect163WeiboWithAppKey:(NSString *)appKey
                        appSecret:(NSString *)appSecret
                      redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Sohu Weibo platform，This platform need import SohuWeiboConnection.framework
 *          Go to http://open.t.sohu.com and register Sohu Weibo open platform app，Then fill in the relevant information into the field below
 *
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret.
 *  @param  redirectUri     Redirect url.
 */
+ (void)connectSohuWeiboWithConsumerKey:(NSString *)consumerKey
                         consumerSecret:(NSString *)consumerSecret
                            redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize DouBan platform，This platform need import DouBanConnection.framework
 *          Go to http://developers.douban.com and register Douban app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret
 *	@param 	redirectUri 	Redirect Url
 */
+ (void)connectDoubanWithAppKey:(NSString *)appKey
                      appSecret:(NSString *)appSecret
                    redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize RenRen platform，This platform need import RenRenConnection.framework
 *          Go to http://dev.renren.comand register app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 */
+ (void)connectRenRenWithAppKey:(NSString *)appKey
                      appSecret:(NSString *)appSecret;

/**
 *	@brief	Initialize RenRen platform，This platform need import RenRenConnection.framework
 *
 *  @since  ver2.2.6
 *
 *  @param  appId   App id
 *	@param 	appKey  App key
 *	@param 	appSecret 	App secret
 *  @param  renrenClientClass   RenrenClient class, When you need to SSO Login pass this parameter。
 *                              You should import RennSDK.framework, then passed [RennClient class] this parameter.
 */
+ (void)connectRenRenWithAppId:(NSString *)appId
                        appKey:(NSString *)appKey
                     appSecret:(NSString *)appSecret
             renrenClientClass:(Class)renrenClientClass;

/**
 *	@brief	Initialize KaiXin platform，This platform need import KaiXinConnection.framework
 *          Go to http://open.kaixin001.com register app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key
 *	@param 	appSecret 	App secret
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connectKaiXinWithAppKey:(NSString *)appKey
                      appSecret:(NSString *)appSecret
                    redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Instapaper platform. This platform need import InstapaperConnection.framework
 *          Go to http://www.instapaper.com/main/request_oauth_consumer_token register app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key
 *	@param 	appSecret 	App secret
 */
+ (void)connectInstapaperWithAppKey:(NSString *)appKey
                          appSecret:(NSString *)appSecret;

/**
 *	@brief	Initialize YouDaoNote platform.This platform need import YouDaoNoteConnection.framework
 *          Go to http://note.youdao.com/open/developguide.html#app register app，Then fill in the relevant information into the field below
 *
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret.
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connectYouDaoNoteWithConsumerKey:(NSString *)consumerKey
                          consumerSecret:(NSString *)consumerSecret
                             redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Facebook platform.This platform need import FacebookConnection.framework
 *          Go to https://developers.facebook.com register app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 */
+ (void)connectFacebookWithAppKey:(NSString *)appKey
                        appSecret:(NSString *)appSecret;

/**
 *	@brief	Initialize Twitter platform.This platform need import TwitterConnection.framework
 *          Go to https://dev.twitter.com register app，Then fill in the relevant information into the field below
 *
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret.
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connectTwitterWithConsumerKey:(NSString *)consumerKey
                       consumerSecret:(NSString *)consumerSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize QQ platform.This platform need import QQConnection.framework and QApi.framework
 *          Go to http://mobile.qq.com/api/ register app，Then fill in the relevant information into the field below
 *
 *	@param 	appId 	App id.
 *	@param 	qqApiCls 	QQApi class, You should import QQApi.h，then passed [QQApi class] this parameter.
 */
+ (void)connectQQWithAppId:(NSString *)appId
                  qqApiCls:(Class)qqApiCls;

/**
 *	@brief	Initialize QQ platform. This platform need import QQConnection.framework and TencentOAuthAPI.framework
 *          Go to http://connect.qq.com register app，Then fill in the relevant information into the field below
 *          You can call this interface passed QZone app key to initialize.
 *
 *  @since  ver2.2.4
 *
 *	@param 	qzoneAppKey 	QZone app key.
 *	@param 	qqApiInterfaceCls 	QQAPIInterface class.
 *	@param 	tencentOAuthCls 	TencentOAuth class.
 */
+ (void)connectQQWithQZoneAppKey:(NSString *)qzoneAppKey
               qqApiInterfaceCls:(Class)qqApiInterfaceCls
                 tencentOAuthCls:(Class)tencentOAuthCls;

/**
 *	@brief	Initialize WeChat platform. This platform need import WeChatConnection.framework and libWeChatSDK.a
 *          Go to http://open.weixin.qq.com register app，Then fill in the relevant information into the field below
 *
 *	@param 	appId 	App id.
 *	@param 	wechatCls 	WXApi class，You should import WXApi.h，then passed [WXApi class] this parameter.
 */
+ (void)connectWeChatWithAppId:(NSString *)appId
                     wechatCls:(Class)wechatCls;

/**
 *	@brief	Initialize Sohu SuiShenKan platform，This platform need import SohuConnection.framework
 *          Go to http://open.sohu.com/ register app，Then fill in the relevant information into the field below
 *
 *  @since  ver2.1.0
 *
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connectSohuKanWithAppKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret
                     redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Pocket platform，This platform need import PocketConnection.framework
 *          Go to http://getpocket.com/developer/ register app，Then fill in the relevant information into the field below
 *
 *  @since  ver2.2.0
 *
 *	@param 	consumerKey 	Consumer key
 *	@param 	redirectUri 	Redirect Url.
 */
+ (void)connectPocketWithConsumerKey:(NSString *)consumerKey
                         redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize EverNote platform，This platform need import EverNoteConnection.framework
 *          Go to http://dev.yinxiang.com register app，Then fill in the relevant information into the field below
 *
 *	@param 	type 	App Type. You can specify a sandbox environment or Evernote China or Evernote International, Note: If you set the sandbox type, you need to apply before the release of the other type, otherwise it will lead to the user not work properly.
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret.
 */
+ (void)connectEvernoteWithType:(SSEverNoteType)type
                    consumerKey:(NSString *)consumerKey
                 consumerSecret:(NSString *)consumerSecret;

/**
 *	@brief	Initialize LinkedIn platform. This platform need import LinkedInConnection.framework
 *          Go to https://www.linkedin.com/secure/developer register app，Then fill in the relevant information into the field below
 *
 *  @since  ver2.4.0
 *
 *	@param 	apiKey 	Api key
 *	@param 	secretKey 	Secret key.
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connectLinkedInWithApiKey:(NSString *)apiKey
                        secretKey:(NSString *)secretKey
                      redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize Google+ platform, This platform need import GooglePlusConnection.framework、GoogleOpenSource.frramework、GooglePlus.framework
 *          Go to https://code.google.com/apis/console register app，Then fill in the relevant information into the field below
 *
 *  @since  ver2.4.0
 *
 *	@param 	clientId 	Client id.
 *	@param 	clientSecret 	Client secret.
 *	@param 	redirectUri 	Redirect url.
 *  @param  signInCls       GPPSignIn class，You should import GooglePlus.framework,then passed [GPPSignIn class] this parameter.
 *  @param  shareCls        GPPShare class，You should import GooglePlus.framework,then passed [GPPShare class] this parameter.
 */
+ (void)connectGooglePlusWithClientId:(NSString *)clientId
                         clientSecret:(NSString *)clientSecret
                          redirectUri:(NSString *)redirectUri
                            signInCls:(Class)signInCls
                             shareCls:(Class)shareCls;

/**
 *	@brief	Initialize Pinterest platform, This platform need import PinterestConnection.framework and Pinterest.framework
 *          Go to http://developers.pinterest.com/ register app，Then fill in the relevant information into the field below
 *
 *	@param 	clientId 	Client id.
 *	@param 	pinterestCls 	Pinterest class，You should import Pinterest.framework，Then passed this parameter.
 */
+ (void)connectPinterestWithClientId:(NSString *)clientId
                        pinterestCls:(Class)pinterestCls;

/**
 *	@brief	Initialize Flickr platform, This platform need import FlickrConnection.framework。
 *          Go to http://www.flickr.com/services/apps/create/ register app，Then fill in the relevant information into the field below
 *
 *	@param 	apiKey 	Api key
 *	@param 	apiSecret 	Api secret
 */
+ (void)connectFlickrWithApiKey:(NSString *)apiKey
                      apiSecret:(NSString *)apiSecret;

/**
 *	@brief	Initialize Tumblr platform. This platform need import TumblrConnection.framework
 *          Go to http://www.tumblr.com/oauth/apps register app，Then fill in the relevant information into the field below
 *
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret.
 *	@param 	callbackUrl 	Callback url.
 */
+ (void)connectTumblrWithConsumerKey:(NSString *)consumerKey
                      consumerSecret:(NSString *)consumerSecret
                         callbackUrl:(NSString *)callbackUrl;

/**
 *	@brief	Initialize Dropbox platform，This platform need import DropboxConnection.framework
 *          Go to https://www.dropbox.com/developers/apps register app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key
 *	@param 	appSecret 	App secret
 */
+ (void)connectDropboxWithAppKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret;

/**
 *	@brief	Initialize Instagram platform. This platform need import InstagramConnection.framework
 *          Go to http://instagram.com/developer/clients/register/ register app，Then fill in the relevant information into the field below
 *
 *	@param 	clientId 	Client id
 *	@param 	clientSecret 	Client secret
 *	@param 	redirectUri 	Redirect url.
 */
+ (void)connectInstagramWithClientId:(NSString *)clientId
                        clientSecret:(NSString *)clientSecret
                         redirectUri:(NSString *)redirectUri;

/**
 *	@brief	Initialize VKontakte platform，This platform need import VKontakteConnection.framework
 *          Go to http://vk.com/editapp?act=create register app，Then fill in the relevant information into the field below
 *
 *	@param 	appKey 	App key
 *	@param 	secretKey 	Secret key
 */
+ (void)connectVKontakteWithAppKey:(NSString *)appKey
                         secretKey:(NSString *)secretKey;

/**
 *	@brief	Initialize mail.
 *
 *  @since  ver2.6.0
 */
+ (void)connectMail;

/**
 *	@brief	Initialize SMS
 *
 *  @since  ver2.6.0
 */
+ (void)connectSMS;

/**
 *	@brief	Initialize Print.
 *
 *  @since  ver2.6.0
 */
+ (void)connectAirPrint;

/**
 *	@brief	Initialize Copy
 *
 *  @since  ver2.6.0
 */
+ (void)connectCopy;

/**
 *	@brief	Initialize WeChat Session platform.
 *
 *  @since  ver2.6.0
 *
 *	@param 	appId 	App id. Must be consistent and WeChat Timeline passed ID
 *	@param 	wechatCls 	WXApi class，You should import WXApi.h，then passed [WXApi class] this parameter.
 */
+ (void)connectWeChatSessionWithAppId:(NSString *)appId
                            wechatCls:(Class)wechatCls;

/**
 *	@brief	Initialize WeChat Timeline platform.
 *
 *  @since  ver2.6.0
 *
 *	@param 	appId 	App id. Must be consistent and WeChat Session passed ID
 *	@param 	wechatCls 	WXApi class，You should import WXApi.h，then passed [WXApi class] this parameter.
 */
+ (void)connectWeChatTimelineWithAppId:(NSString *)appId
                             wechatCls:(Class)wechatCls;

/**
 *	@brief	Initialize WeChat Favorite platform.
 *
 *	@param 	appId 	App id，Must be consistent and WeChat Session、WeChat Timeline passed ID
 *	@param 	wechatCls 	WXApi class，You should import WXApi.h，then passed [WXApi class] this parameter.
 */
+ (void)connectWeChatFavWithAppId:(NSString *)appId
                        wechatCls:(Class)wechatCls;

/**
 *	@brief	Initialize YiXin Session platform.
 *
 *  @since  ver2.7.0
 *
 *	@param 	appId 	App id，Must be consistent and YiXin Timeline passed ID
 *	@param 	yixinCls 	YXApi class，You should import YXApi.h，then passed [YXApi class] this parameter.
 */
+ (void)connectYiXinSessionWithAppId:(NSString *)appId
                            yixinCls:(Class)yixinCls;

/**
 *	@brief	Initialize YiXin Timeline platform.
 *
 *  @since  ver2.7.0
 *
 *	@param 	appId 	App id，Must be consistent and YiXin Session passed ID
 *	@param 	yixinCls 	YXApi class，You should import YXApi.h，then passed [YXApi class] this parameter.
 */
+ (void)connectYiXinTimelineWithAppId:(NSString *)appId
                             yixinCls:(Class)yixinCls;

/**
 *	@brief	Initialize YiXin platform，This platform need import YiXinConnection.framework and libYXSDK.a
 *          Go to http://open.yixin.im/ register app，Then fill in the relevant information into the field below
 *
 *	@param 	appId 	App id，
 *	@param 	yixinCls 	YXApi class，You should import YXApi.h，then passed [YXApi class] this parameter.
 */
+ (void)connectYiXinWithAppId:(NSString *)appId
                     yixinCls:(Class)yixinCls;

/**
 *	@brief	Handle open url,If the integrated Sina Weibo (SSO), Facebook (SSO), WeChat, QQ sharing need to add this method
 *
 *	@param 	url 	Url string.
 *  @param  wxDelegate  WeChat delegate,If there is no integrated WeChat platform, you can pass nil
 *
 *	@return	YES indicates to accept the request. NO indicates they did not accept
 */
+ (BOOL)handleOpenURL:(NSURL *)url wxDelegate:(id)wxDelegate;

/**
 *	@brief	Handle open url,If the integrated Sina Weibo (SSO), Facebook (SSO), WeChat, QQ sharing need to add this method
 *
 *	@param 	url 	Url string.
 *	@param 	sourceApplication 	Source Application.
 *	@param 	annotation 	Annotation
 *  @param  wxDelegate  WeChat delegate,If there is no integrated WeChat platform, you can pass nil
 *
 *	@return	YES indicates to accept the request. NO indicates they did not accept
 */
+ (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation
           wxDelegate:(id)wxDelegate;

/**
 *	@brief	Import Tencent Weibo Classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note: You not use the SSO Login when not in call
 *
 *	@param 	wbApiCls 	WeiboApi class，You should import WBApi.h，Then passed [WeiboApi class] this parameter.
 */
+ (void)importTencentWeiboClass:(Class)wbApiCls;

/**
 *	@brief	Import QQ and QZone Classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note: You not use the QZone SSO Login and QQ Share when not in call
 *
 *	@param 	qqApiInterfaceCls 	QQApiInterface class.
 *	@param 	tencentOAuthCls 	TencentOAuth class.
 */
+ (void)importQQClass:(Class)qqApiInterfaceCls
      tencentOAuthCls:(Class)tencentOAuthCls;

/**
 *	@brief	Import Renren classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note: You not use the SSO Login when not in call
 *
 *	@param 	renrenClientClass 	RenrenClient class, You should import RennSDK.framework，Then passed [RennClient class] this parameter.
 */
+ (void)importRenRenClass:(Class)renrenClientClass;

/**
 *	@brief	Import WeChat classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note：You not use the WeChat share when not in call
 *
 *	@param 	wechatCls 	WXApi class，You should import WXApi.h，Then passed [WXApi class] this parameter.
 */
+ (void)importWeChatClass:(Class)wechatCls;

/**
 *	@brief	Import Google+ classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note：You not use the Google+ platform when not in call
 *
 *  @since  ver2.4.0
 *
 *	@param 	signInClass 	GPPSignIn class，You should import GooglePlus.framework，Then passed [GPPSignIn class] this parameter.
 *	@param 	shareClass 	GPPShare class，You should import GooglePlush.framework，Then passed [GPPShare class] this parameter.
 */
+ (void)importGooglePlusClass:(Class)signInClass
                   shareClass:(Class)shareClass;

/**
 *	@brief	Import Pinterest classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note：You not use the Pinterest platform when not in call
 *
 *  @since  ver2.4.1
 *
 *	@param 	pinterestClass 	Pinterest classes。You should import Pinterest.framework，Then passed [Pinterest class] this parameter.
 */
+ (void)importPinterestClass:(Class)pinterestClass;

/**
 *	@brief	Import YiXin classes，For application information hosting (ie registerApp in useAppTrusteeship is YES) need to call this method. Note：You not use the YiXin platform when not in call
 *
 *	@param 	yixinClass 	YXApi class。You should import libYixinSDK.a，Then passed [YXApi class] this parameter.
 */
+ (void)importYiXinClass:(Class)yixinClass;


#pragma mark 辅助

/**
 *	@brief	Get platform name.
 *
 *  @since  ver1.2.4
 *
 *	@param 	type 	Platform type.
 *
 *	@return	Platform name.
 */
+ (NSString *)getClientNameWithType:(ShareType)type;

/**
 *	@brief	Get platform icon.
 *
 *  @since  ver1.2.4
 *
 *	@param 	type 	Platform type.
 *
 *	@return	Platform icon.
 */
+ (UIImage *)getClientIconWithType:(ShareType)type;

/**
 *	@brief	Get platform object.
 *
 *	@param 	type 	Platform type.
 *
 *	@return	Platform object.
 */
+ (id<ISSPlatformApp>)getClientWithType:(ShareType)type;

/**
 *	@brief	Create a list of platform type.
 *
 *	@param 	shareType 	Platform type.
 *
 *	@return	Platform type list array.
 */
+ (NSArray *)getShareListWithType:(ShareType)shareType, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *	@brief	Add notification listen.
 *
 *	@param 	name 	Notification name.
 *	@param 	target 	Target object.
 *	@param 	action 	Notification handler.
 */
+ (void)addNotificationWithName:(NSString *)name
                         target:(id)target
                         action:(SEL)action;

/**
 *	@brief	Remove notification listen.
 *
 *	@param 	name 	Notification name.
 *	@param 	target 	Target object.
 */
+ (void)removeNotificationWithName:(NSString *)name
                            target:(id)target;

/**
 *	@brief	Remove all notification listen.
 *
 *	@param 	target 	Target object.
 */
+ (void)removeAllNotificationWithTarget:(id)target;

/**
 *	@brief	Create paging object. Construction method to get the user list page parameters provided.
 *
 *	@param 	cursor 	Cursor. This method only for Twitter,please pass -1 to get the start page
 *
 *	@return Paging object.
 */
+ (id<ISSPage>)pageWithCursor:(long long)cursor;

/**
 *	@brief	Create paging object. Construction method to get the user list page parameters provided.
 *
 *	@param 	pageNo 	Page No.
 *	@param 	pageSize 	Page size.
 *
 *	@return	Paging object.
 */
+ (id<ISSPage>)pageWithPageNo:(NSInteger)pageNo pageSize:(NSInteger)pageSize;

/**
 *	@brief	Create share content object. based on the following description of each field to fill the parameter values
 *
 *	@param 	content 	Share content string.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy）
 *	@param 	defaultContent 	Default share content string.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy）
 *	@param 	image 	Image attachment object.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、Facebook、Twitter、Mail、Print、WeChat、QQ、Copy）
 *	@param 	title 	Title string.（QZone、RenRen、WeChat、QQ）
 *	@param 	url 	Url string.（QZone、RenRen、Instapaper、WeChat、QQ）
 *	@param 	description 	Description string（RenRen）
 *	@param 	mediaType 	MediaType（QQ、WeChat）
 *
 *	@return	Share content object.
 */
+ (id<ISSContent>)content:(NSString *)content
           defaultContent:(NSString *)defaultContent
                    image:(id<ISSCAttachment>)image
                    title:(NSString *)title
                      url:(NSString *)url
              description:(NSString *)description
                mediaType:(SSPublishContentMediaType)mediaType;

/**
 *	@brief	Create share content object. based on the following description of each field to fill the parameter values
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	Share content string.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy）
 *	@param 	defaultContent 	Default share content string.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy）
 *	@param 	image 	Image attachment object.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、Facebook、Twitter、Mail、Print、WeChat、QQ、Copy）
 *	@param 	title 	Title string.（QZone、RenRen、WeChat、QQ）
 *	@param 	url 	Url string.（QZone、RenRen、Instapaper、WeChat、QQ）
 *	@param 	description 	Description string（RenRen）
 *	@param 	mediaType 	MediaType（QQ、WeChat）
 *	@param 	locationCoordinate 	Location information. (Sina Weibo、Tencent Weibo、Twitter)
 *
 *	@return	Share content object.
 */
+ (id<ISSContent>)content:(NSString *)content
           defaultContent:(NSString *)defaultContent
                    image:(id<ISSCAttachment>)image
                    title:(NSString *)title
                      url:(NSString *)url
              description:(NSString *)description
                mediaType:(SSPublishContentMediaType)mediaType
       locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate;

/**
 *	@brief	Create share content object. based on the following description of each field to fill the parameter values
 *
 *  @since  ver2.6.0
 *
 *	@param 	content 	Share content string.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy）
 *	@param 	defaultContent 	Default share content string.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、YouDaoNote、Facebook、Twitter、Mail、Print、SMS、WeChat、QQ、Copy）
 *	@param 	image 	Image attachment object.（Sina Weibo、Tencent Weibo、NetEase Weibo、Sohu Weibo、Douban、RenRen、KaiXin、Facebook、Twitter、Mail、Print、WeChat、QQ、Copy）
 *	@param 	title 	Title string.（QZone、RenRen、WeChat、QQ）
 *	@param 	url 	Url string.（QZone、RenRen、Instapaper、WeChat、QQ）
 *	@param 	description 	Description string（RenRen）
 *	@param 	mediaType 	MediaType（QQ、WeChat）
 *	@param 	locationCoordinate 	Location information. (Sina Weibo、Tencent Weibo、Twitter)
 *  @param  groupId     Group id (VK)
 *
 *	@return	Share content object.
 */
+ (id<ISSContent>)content:(NSString *)content
           defaultContent:(NSString *)defaultContent
                    image:(id<ISSCAttachment>)image
                    title:(NSString *)title
                      url:(NSString *)url
              description:(NSString *)description
                mediaType:(SSPublishContentMediaType)mediaType
       locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  groupId:(NSString *)groupId;

/**
 *	@brief	Create image attachment object.
 *
 *	@param 	path 	Image path.
 *
 *	@return Attachment object.
 */
+ (id<ISSCAttachment>)imageWithPath:(NSString *)path;

/**
 *	@brief	Create image attachment object.
 *
 *	@param 	url 	Image url.
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)imageWithUrl:(NSString *)url;

/**
 *	@brief	Create jpeg image attachment object.
 *
 *	@param 	image 	UIImage object.
 *  @param  quality Image quality(0 ~ 1)
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)jpegImageWithImage:(UIImage *)image quality:(CGFloat)quality;

/**
 *	@brief	Create png image attachment object.
 *
 *	@param 	image 	UIImage object.
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)pngImageWithImage:(UIImage *)image;

/**
 *	@brief	Create image attachment object.
 *
 *	@param 	data 	Image data.
 *	@param 	fileName 	File name.
 *	@param 	mimeType 	MIME type.
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)imageWithData:(NSData *)data
                           fileName:(NSString *)fileName
                           mimeType:(NSString *)mimeType;
/**
 *	@brief	Create container.
 *
 *	@return	Container object.
 */
+ (id<ISSContainer>)container;

/**
 *	@brief	Create custom share menu item.
 *
 *  @since  ver1.2.3
 *
 *	@param 	title 	Title string.
 *	@param 	icon 	Icon image.
 *	@param 	clickHandler 	Click event handler.
 *
 *	@return	Share menu item.
 */
+ (id<ISSShareActionSheetItem>)shareActionSheetItemWithTitle:(NSString *)title
                                                        icon:(UIImage *)icon
                                                clickHandler:(SSShareActionSheetItemClickHandler)clickHandler;

/**
 *	@brief	Create attachment object.
 *
 *	@param 	data 	Attachment data.
 *	@param 	mimeType 	MIME type.
 *  @param  fileName    File name.
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)attachmentWithData:(NSData *)data mimeType:(NSString *)mimeType fileName:(NSString *)fileName;

/**
 *	@brief	Create custom share list.
 *
 *	@param 	item Share menu item object，Can contain ShareType of NSNumber type, You can also call shareActionSheetItemWithTitle method create ISSShareActionSheetItem objects.
 *
 *	@return	Share list array.
 */
+ (NSArray *)customShareListWithType:(id)item, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *	@brief	Set interface orientation. Default SSInterfaceOrientationMaskAll
 *
 *	@param 	interfaceOrientationMask 	Interface orientation.
 */
+ (void)setInterfaceOrientationMask:(SSInterfaceOrientationMask)interfaceOrientationMask;

/**
 *	@brief	Serialization authorization credential.
 *
 *  @since  ver2.6.0    Fix return type
 *
 *	@param 	credential 	Credential object.
 *
 *	@return	Serialized data.
 */
+ (NSData *)dataWithCredential:(id<ISSPlatformCredential>)credential;

/**
 *	@brief	Create user object
 *
 *  @since  ver2.0.1
 *  @since  ver2.6.0    Fix return type.
 *
 *	@param 	localUser 	Platform user info.
 *	@param 	type 	Platform type.
 *
 *	@return	User object.
 */
+ (id<ISSPlatformUser>)userWithLocalUser:(id)localUser type:(ShareType)type;

/**
 *	@brief	Create share info object.
 *
 *  @since  ver2.0.1
 *  @since  ver2.6.0    Fix return type.
 *
 *	@param 	localStatus 	Platform share information.
 *	@param 	type 	Platform type.
 *
 *	@return	Share information object.
 */
+ (id<ISSPlatformShareInfo>)statusWithLocalStatus:(id)localStatus type:(ShareType)type;

/**
 *	@brief	Create user field object.
 *
 *  @since  ver2.1.1
 *
 *	@param 	type 	Field type.
 *	@param 	value 	Field value.
 *
 *	@return	Field object.
 */
+ (id<ISSUserField>)userFieldWithType:(SSUserFieldType)type value:(NSString *)value;

/**
 *	@brief	at the status bar displays the message, this message will be displayed until call hideStatusbarMessage method
 *
 *  @since  ver2.2.0
 *
 *	@param 	message 	Message content.
 */
+ (void)showStatusbarMessage:(NSString *)message;

/**
 *	@brief	hide status bar message.
 *
 *  @since  ver2.2.0
 *
 */
+ (void)hideStatusbarMessage;

/**
 *	@brief	Show temporary message. This message is erased in a certain time. This message content is not hideStatusbarMessage control.
 *
 *  @since  ver2.2.0
 *
 *	@param 	message 	Message content.
 */
+ (void)showStatusbarImmediMessage:(NSString *)message;

/**
 *	@brief	Wait for get the application configuration information completed. This method is used for the application information Hosting。Because the information issued from the server takes time, So before calling platform api call this method accordingly to wait after the completion of the operation.
 *
 *  @since  ver2.2.6
 *
 *  @param  completeHandler     Completed event handler.
 */
+ (void)waitAppSettingComplete:(void(^)())completeHandler;

/**
 *	@brief	Get initialize platform type list.
 *
 *  @since  ver2.6.0
 *
 *	@return	Platform type list array. Its elements of NSNumber object containing ShareType
 */
+ (NSArray *)connectedPlatformTypes;

/**
 *	@brief	Get current version.
 *
 *  @since  ver2.6.0
 *
 *	@return	Version string.
 */
+ (NSString *)version;

/**
 *	@brief	Set UI style, Default is iOS7 Style.
 *
 *  @since  ver2.9.0
 *
 *	@param 	style 	UI style.
 */
+ (void)setUIStyle:(SSUIStyle)style;


#pragma mark 授权

/**
 *	@brief	Deserialize data to credential object
 *
 *  @since  ver2.6.0    Fix return type.
 *
 *	@param 	data 	credential data.
 *	@param 	type 	Platform type.
 *
 *	@return	Credential object.
 */
+ (id<ISSPlatformCredential>)credentialWithData:(NSData *)data type:(ShareType)type;

/**
 *	@brief	Create credentail object. Authorization data obtained by other methods incoming SDK convert credentials through this interface
 *
 *  @since  ver2.6.0
 *
 *  @param  type    Platform type.
 *	@param 	uid 	User id.
 *	@param 	token 	Token string，In OAuth is oauth_token，In OAuth2 is access_token
 *	@param 	secret 	Secret string. Only for OAuth，is oauth_token_secret attribute。
 *	@param 	expired 	Expires，Only for OAuth2，Need to return to a time in seconds.
 *	@param 	extInfo 	Extended information. Used to store other information in addition to the above information away.
 *
 *	@return	Credential object.
 */
+ (id<ISSPlatformCredential>)credentialWithType:(ShareType)type
                                            uid:(NSString *)uid
                                          token:(NSString *)token
                                         secret:(NSString *)secret
                                        expired:(NSDate *)expired
                                        extInfo:(NSDictionary *)extInfo;

/**
 *	@brief	Get credential object, Certificate contains accessToken or oauthToken, expiration date and other information
 *
 *  @since  ver2.6.0    Fix return type
 *
 *	@param 	type 	Platform type.
 *
 *	@return	Credential object.
 */
+ (id<ISSPlatformCredential>)getCredentialWithType:(ShareType)type;

/**
 *	@brief	Set credential object.
 *
 *  @since  ver2.6.0    Fix return type.
 *
 *	@param 	credential 	Credential object.
 *	@param 	type 	Platform type.
 */
+ (void)setCredential:(id<ISSPlatformCredential>)credential type:(ShareType)type;

/**
 *	@brief	Create authorized options.
 *
 *	@param 	autoAuth 	Automatic authorization flag, When authorized expired, Whether SDK has automatic show authorized view let user to completed authorized.
 *  @param  allowCallback   Whether to allow authorized after the callback to the server, the default is YES, for there is no server or application server does not require a callback can be set to NO
 *	@param 	authViewStyle 	Authorized view style，Please see SSAuthViewStyle.
 *  @param  viewDelegate    Authorized view delegate，Can adjustment the view details of the UI.
 *  @param  authManagerViewDelegate     Authorized manager view delegate。Can adjustment the view details of the UI.
 *
 *	@return	Authorized options.
 */
+ (id<ISSAuthOptions>)authOptionsWithAutoAuth:(BOOL)autoAuth
                                allowCallback:(BOOL)allowCallback
                                authViewStyle:(SSAuthViewStyle)authViewStyle
                                 viewDelegate:(id<ISSViewDelegate>)viewDelegate
                      authManagerViewDelegate:(id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	Create an authorize options.
 *
 *  @since  ver2.1.1    Add authorize scopes list.
 *
 *	@param 	autoAuth 	Automatic authorization flag,When authorized expired, Whether SDK has automatic show authorized view let user to completed authorized.
 *  @param  allowCallback   Whether to allow authorized after the callback to the server, the default is YES, for there is no server or application server does not require a callback can be set to NO
 *  @param  scopes     Get authorized scopes. If the default request scopes can be set to nil, otherwise the need to refer to the relevant authority content of each platform to fill. key is platform type number. value is contain scope string's array.
 *  @param  powerByHidden   powered by hidden flag. If NO in the navigation bar displays the word copyright information, YES, said hidden. The default is NO.
 *  @param  followAccounts      follower accounts dictionary object，key is platform type number. value is ISSUserField's protocol object.(This property is used only for Modal view style, and is only valid on Sina Weibo and Tencent Weibo)。
 *	@param 	authViewStyle 	View style，Please see SSAuthViewStyle.
 *  @param  viewDelegate    Authorized view delegate. Can adjustment the view details of the UI.
 *  @param  authManagerViewDelegate     Authorized manager view delegate。Can adjustment the view details of the UI.
 *
 *	@return	Authorized options.
 */
+ (id<ISSAuthOptions>)authOptionsWithAutoAuth:(BOOL)autoAuth
                                allowCallback:(BOOL)allowCallback
                                       scopes:(NSDictionary *)scopes
                                powerByHidden:(BOOL)powerByHidden
                               followAccounts:(NSDictionary *)followAccounts
                                authViewStyle:(SSAuthViewStyle)authViewStyle
                                 viewDelegate:(id<ISSViewDelegate>)viewDelegate
                      authManagerViewDelegate:(id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	Create an authorize controller，This method is used when the custom authorization page, you can freely control the authorization UI and process. (Note: WeChat, QQ, Mail, SMS, Print, Copy does not support authorization feature.)
 *
 *  @since  ver2.6.0    Fix return type.
 *
 *	@param 	type 	Platform type.
 *
 *	@return	Authorize session.
 */
+ (id<ISSPlatformAuthSession>)authorizeController:(ShareType)type;

/**
 *	@brief	Show authorize view，(Note: WeChat, QQ, Mail, SMS, Print, Copy does not support authorization feature.)
 *
 *	@param 	type    Platform type.
 *  @param  options Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  result    Result handler.
 */
+ (void)authWithType:(ShareType)type
             options:(id<ISSAuthOptions>)options
              result:(SSAuthEventHandler)result;

/**
 *	@brief	Determine whether to authorize flag. WeChat, QQ, Mail, SMS, Print, Copy does not support authorization feature.
 *
 *	@param 	type 	Platform type.
 *
 *	@return	YES authorized; NO unauthorized
 */
+ (BOOL)hasAuthorizedWithType:(ShareType)type;

/**
 *	@brief	Cancel authorized. WeChat、QQ, Mail, SMS, Print, Copy dose not support authorized feature.
 *
 *	@param 	type 	Platform type.
 */
+ (void)cancelAuthWithType:(ShareType)type;

/**
 *	@brief	Get current authorization user.
 *
 *  @since  ver2.6.0
 *
 *	@param 	type 	Platform type.
 *
 *	@return	User object.
 */
+ (id<ISSPlatformUser>)currentAuthUserWithType:(ShareType)type;

/**
 *	@brief	Set current authorization user. When there are multiple authorized users when you can use this method to switch.
 *
 *  @since  ver2.6.0
 *
 *	@param 	user 	User object，Note: This information must already contain user authorization credential, or can not be related to functional interface called after setting will require re-authorization.
 *	@param 	type 	Platform type.
 *
 */
+ (void)setCurrentAuthUser:(id<ISSPlatformUser>)user type:(ShareType)type;

/**
 *	@brief	Get a list of authorization user.
 *
 *  @since  ver2.6.0
 *
 *	@param 	type 	Platform type.
 *
 *	@return	Users list array.
 */
+ (NSArray *)authorizedUsersWithType:(ShareType)type;



#pragma mark 用户信息

/**
 *	@brief	Get current authorization user information.
 *
 *	@param 	shareType 	Platform type.
 *  @param  authOptions Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  result  Result handler.
 */
+ (void)getUserInfoWithType:(ShareType)shareType
                authOptions:(id<ISSAuthOptions>)authOptions
                     result:(SSGetUserInfoEventHandler)result;

/**
 *	@brief	Get user information.
 *
 *	@param 	type 	Platform type.
 *	@param 	field 	User Information field value. is used to specify the user identification field.
 *	@param 	fieldType 	Field type, identifies a user ID, ​​user name
 *  @param  authOptions Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  result  Result handler.
 */
+ (void)getUserInfoWithType:(ShareType)type
                      field:(NSString *)field
                  fieldType:(SSUserFieldType)fieldType
                authOptions:(id<ISSAuthOptions>)authOptions
                     result:(SSGetUserInfoEventHandler)result;

#pragma mark 关系

/**
 *	@brief	Concern user.
 *
 *	@param 	type 	Platform type.
 *	@param 	field 	User Information field value. is used to specify the user identification field.
 *	@param 	fieldType 	Field type, identifies a user ID, ​​user name
 *	@param 	authOptions 	Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  viewDelegate    View delegate object，Concern for Facebook users will pop-up view, the delegate is used to distribute the view related behaviors notification. Non-Facebook platform can pass nil
 *	@param 	result 	Result handler.
 */
+ (void)followUserWithType:(ShareType)type
                     field:(NSString *)field
                 fieldType:(SSUserFieldType)fieldType
               authOptions:(id<ISSAuthOptions>)authOptions
              viewDelegate:(id<ISSViewDelegate>)viewDelegate
                    result:(SSFollowUserEventHandler)result;

/**
 *	@brief	Get friends list.
 *
 *	@param 	type 	Platform type.
 *	@param 	page 	Paging object.
 *  @param  authOptions Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *	@param 	result 	Result handler.
 */
+ (void)getFriendsWithType:(ShareType)type
                      page:(id<ISSPage>)page
               authOptions:(id<ISSAuthOptions>)authOptions
                    result:(SSFriendsResultEvent)result;


#pragma mark 分享

/**
 *	@brief	Create a share opitons for default share view.
 *
 *	@param 	title 	Title string.
 *	@param 	oneKeyShareList 	One key share list，Incoming [NSArray defaultOneKeyShareList] indicates the default sharing list. Is nil, said is not required to one key share
 *	@param 	qqButtonHidden 	QQ share button hidden flag. If you do not hide, Then display on the share view toolbar by the right side, the default display.
 *	@param 	wxSessionButtonHidden 	WeChat Session button hidden flag，If you do not hide, Then display on the share view toolbar by the right side, the default display.
 *	@param 	wxTimelineButtonHidden 	WeChat Timeline button hidden flag，If you do not hide, Then display on the share view toolbar by the right side, the default display.
 *	@param 	showKeyboardOnAppear 	Whether in view of the display when the keyboard is displayed, the default NO. When on key share list is nil, this value is invalid.
 *	@param 	shareViewDelegate 	Share view delegate，If you do not control the view of the incoming nil
 *	@param 	friendsViewDelegate 	Friends view delegate，If you do not control the view of the incoming nil
 *	@param 	picViewerViewDelegate 	Picture viewer delegate，If you do not control the view of the incoming nil
 *
 *	@return	分享选项
 */
+ (id<ISSShareOptions>)defaultShareOptionsWithTitle:(NSString *)title
                                    oneKeyShareList:(NSArray *)oneKeyShareList
                                     qqButtonHidden:(BOOL)qqButtonHidden
                              wxSessionButtonHidden:(BOOL)wxSessionButtonHidden
                             wxTimelineButtonHidden:(BOOL)wxTimelineButtonHidden
                               showKeyboardOnAppear:(BOOL)showKeyboardOnAppear
                                  shareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate
                                friendsViewDelegate:(id<ISSViewDelegate>)friendsViewDelegate
                              picViewerViewDelegate:(id<ISSViewDelegate>)picViewerViewDelegate;

/**
 *	@brief	Create a share opitons for default share view.
 *
 *  @since  ver2.2.0
 *
 *	@param 	title 	Title string.
 *	@param 	oneKeyShareList 	One key share list，Incoming [NSArray defaultOneKeyShareList] indicates the default sharing list. Is nil, said is not required to one key share
 *	@param 	cameraButtonHidden 	Camera button hidden flag. If you do not hide, Then display on the share view toolbar by the left side, the default display.
 *	@param 	mentionButtonHidden 	Mention button hidden flag. If you do not hide, Then display on the share view toolbar by the left side, the default display.
 *	@param 	topicButtonHidden 	Topic button hidden flag. If you do not hide, Then display on the share view toolbar by the left side, the default display.
 *	@param 	qqButtonHidden 	QQ share button hidden flag. If you do not hide, Then display on the share view toolbar by the right side, the default display.
 *	@param 	wxSessionButtonHidden 	WeChat Session button hidden flag，If you do not hide, Then display on the share view toolbar by the right side, the default display.
 *	@param 	wxTimelineButtonHidden 	WeChat Timeline button hidden flag，If you do not hide, Then display on the share view toolbar by the right side, the default display.
 *	@param 	showKeyboardOnAppear 	Whether in view of the display when the keyboard is displayed, the default NO. When on key share list is nil, this value is invalid.
 *	@param 	shareViewDelegate 	Share view delegate，If you do not control the view of the incoming nil
 *	@param 	friendsViewDelegate 	Friends view delegate，If you do not control the view of the incoming nil
 *	@param 	picViewerViewDelegate 	Picture viewer delegate，If you do not control the view of the incoming nil
 *
 *	@return	分享选项
 */
+ (id<ISSShareOptions>)defaultShareOptionsWithTitle:(NSString *)title
                                    oneKeyShareList:(NSArray *)oneKeyShareList
                                 cameraButtonHidden:(BOOL)cameraButtonHidden
                                mentionButtonHidden:(BOOL)mentionButtonHidden
                                  topicButtonHidden:(BOOL)topicButtonHidden
                                     qqButtonHidden:(BOOL)qqButtonHidden
                              wxSessionButtonHidden:(BOOL)wxSessionButtonHidden
                             wxTimelineButtonHidden:(BOOL)wxTimelineButtonHidden
                               showKeyboardOnAppear:(BOOL)showKeyboardOnAppear
                                  shareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate
                                friendsViewDelegate:(id<ISSViewDelegate>)friendsViewDelegate
                              picViewerViewDelegate:(id<ISSViewDelegate>)picViewerViewDelegate;


/**
 *	@brief	Create a share options for simple share view.
 *
 *	@param 	title 	Title string.
 *	@param 	shareViewDelegate 	Share view delegate，If you do not control the view of the incoming nil
 *
 *	@return	Share options object.
 */
+ (id<ISSShareOptions>)simpleShareOptionsWithTitle:(NSString *)title
                                 shareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	Create a share options for app recommend.
 *
 *	@param 	title 	Title string.
 *	@param 	shareViewDelegate 	Share view delegate，If you do not control the view of the incoming nil
 *
 *	@return	Share options object.
 */
+ (id<ISSShareOptions>)appRecommendShareOptionsWithTile:(NSString *)title
                                      shareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	hare content to platform, This method does not pop up share view. (except WeChat, QQ, Pinterest platforms that will call the client to share).
 *
 *	@param 	content 	Share content object.
 *	@param 	type 	Platform type.
 *	@param 	authOptions 	Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  statusBarTips   The status bar Tip flag. YES indicates display. NO indicates hidden.
 *	@param 	result 	Result handler.
 */
+ (void)shareContent:(id<ISSContent>)content
                type:(ShareType)type
         authOptions:(id<ISSAuthOptions>)authOptions
       statusBarTips:(BOOL)statusBarTips
              result:(SSPublishContentEventHandler)result;

/**
 *	@brief	Share content to platform, This method does not pop up share view. (except WeChat, QQ, Pinterest platforms that will call the client to share).
 *
 *  @since  ver2.2.5
 *
 *	@param 	content 	Share content object.
 *	@param 	type 	Platform type.
 *	@param 	authOptions 	Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  shareOptions    Share options，Used to share for custom configuration（Such as: title, one key sharing, function buttons, etc.）Default nil.
 *  @param  statusBarTips   The status bar Tip flag. YES indicates display. NO indicates hidden.
 *	@param 	result 	Result handler.
 */
+ (void)shareContent:(id<ISSContent>)content
                type:(ShareType)type
         authOptions:(id<ISSAuthOptions>)authOptions
        shareOptions:(id<ISSShareOptions>)shareOptions
       statusBarTips:(BOOL)statusBarTips
              result:(SSPublishContentEventHandler)result;

/**
 *	@brief	Share content to multiple platforms
 *
 *	@param 	content 	Share content object.
 *	@param 	shareList 	Platform type list（exclude E-mail, SMS, WeChat, QQ, print, copy）
 *	@param 	authOptions 	Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  statusBarTips   The status bar Tip flag. YES indicates display. NO indicates hidden.
 *	@param 	result 	Result handler.
 */
+ (void)oneKeyShareContent:(id<ISSContent>)content
                 shareList:(NSArray *)shareList
               authOptions:(id<ISSAuthOptions>)authOptions
             statusBarTips:(BOOL)statusBarTips
                    result:(SSPublishContentEventHandler)result;

/**
 *	@brief	Share content to multiple platforms.
 *
 *  @since  ver2.2.5
 *
 *	@param 	content 	Share content object.
 *	@param 	shareList 	Platform type list（exclude E-mail, SMS, WeChat, QQ, print, copy）
 *	@param 	authOptions 	Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  statusBarTips   The status bar Tip flag. YES indicates display. NO indicates hidden.
 *	@param 	result 	Result handler.
 */
+ (void)oneKeyShareContent:(id<ISSContent>)content
                 shareList:(NSArray *)shareList
               authOptions:(id<ISSAuthOptions>)authOptions
              shareOptions:(id<ISSShareOptions>)shareOptions
             statusBarTips:(BOOL)statusBarTips
                    result:(SSPublishContentEventHandler)result;

/**
 *	@brief	Show share view.
 *
 *	@param 	type 	Platform type.
 *  @param  container   A container for the share view, if only displayed in the iPhone can pass nil. If you want to display on the iPad needs to be specified container.
 *	@param 	content 	Share content object.
 *	@param 	statusBarTips 	The status bar Tip flag. YES indicates display. NO indicates hidden.
 *	@param 	authOptions 	Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *	@param 	shareOptions 	Share options，Used to share for custom configuration（Such as: title, one key sharing, function buttons, etc.）Default nil.
 *	@param 	result 	Result handler.
 */
+ (void)showShareViewWithType:(ShareType)type
                    container:(id<ISSContainer>)container
                      content:(id<ISSContent>)content
                statusBarTips:(BOOL)statusBarTips
                  authOptions:(id<ISSAuthOptions>)authOptions
                 shareOptions:(id<ISSShareOptions>)shareOptions
                       result:(SSPublishContentEventHandler)result;

/**
 *	@brief	Show share menu.
 *
 *	@param 	container 	A container for the share view, if only displayed in the iPhone can pass nil. If you want to display on the iPad needs to be specified container.
 *	@param 	shareList 	Platform type list.
 *	@param 	content 	Share content object.
 *  @param  statusBarTips   The status bar Tip flag. YES indicates display. NO indicates hidden.
 *  @param  authOptions Authorized options，Used to authorization for custom configuration（Such as: whether the automatic authorization, authorization view style, etc.）Default nil.
 *  @param  shareOptions    Share options，Used to share for custom configuration（Such as: title, one key sharing, function buttons, etc.）Default nil.
 *  @param  result  Result handler.
 */
+ (id<ISSShareActionSheet>)showShareActionSheet:(id<ISSContainer>)container
                                      shareList:(NSArray *)shareList
                                        content:(id<ISSContent>)content
                                  statusBarTips:(BOOL)statusBarTips
                                    authOptions:(id<ISSAuthOptions>)authOptions
                                   shareOptions:(id<ISSShareOptions>)shareOptions
                                         result:(SSPublishContentEventHandler)result;

/**
 *	@brief	Content sharing using a client (only for Sina Weibo, WeChat, QQ, Pinterest, Google+)
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	Content string.
 *	@param 	type 	Platform type
 *  @param  statusBarTips   The status bar Tip flag
 *	@param 	result 	Result handler.
 */
+ (void)clientShareContent:(id<ISSContent>)content
                      type:(ShareType)type
             statusBarTips:(BOOL)statusBarTips
                    result:(SSPublishContentEventHandler)result;

#pragma mark - 分享有奖

/**
 *	@brief	Create a share awards view controller.
 *
 *	@return	Awrads view controller.
 */
+ (SSAwardViewController *)awardViewController;

/**
 *	@brief	Set obtain conins notification handler.
 *
 *	@param 	handler 	Handler object.
 */
+ (void)setObtainCoinsHandler:(SSAwardObtainCoinsHandler)handler;

/**
 *	@brief	Set buy item notification handler.
 *
 *	@param 	handler 	Handler object.
 */
+ (void)setBuyItemHandler:(SSAwardBuyItemHandler)handler;


@end
