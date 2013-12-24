//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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

/**
 *	@brief	ShareSDK类，为整个SDK的顶层接口类，所有功能都由此类进行提供（包括分享、授权等等）
 */
@interface ShareSDK : NSObject

/**
 *	@brief	注册应用,此方法在应用启动时调用一次并且只能在主线程中调用。
 *
 *	@param 	appKey 	应用Key,在ShareSDK官网中注册的应用Key
 */
+ (void)registerApp:(NSString *)appKey;

/**
 *	@brief	注册应用。
 *
 *  @since  ver2.2.6
 *
 *	@param 	appKey 	应用Key,在ShareSDK官网中注册的应用Key
 *	@param 	useAppTrusteeship 	是否使用平台信息托管，如果为YES则获取在服务器中配置的平台信息，NO表示获取本地配置信息。
 */
+ (void)registerApp:(NSString *)appKey useAppTrusteeship:(BOOL)useAppTrusteeship;


#pragma mark 设置

/**
 *	@brief	SSO登录方式使能
 *
 *	@param 	ssoEnabled 	YES表示使用SSO方式登录，NO表示不使用SSO方式登录，默认为YES
 */
+ (void)ssoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	设置统计策略,在3G环境以下可以通过设置该策略来减少网络请求的流量。
 *
 *	@param 	policy 	统计策略
 */
+ (void)setStatPolicy:(SSCStatPolicy)policy;

/**
 *	@brief	设置统计的使能状态
 *
 *  @since  ver2.2.0
 *  @deprecated 已过期，请使用allowExchangeDataEnabled方法代替
 *
 *	@param 	statEnabled 	YES表示使用统计功能，NO表示不使用统计功能
 */
+ (void)statEnabled:(BOOL)statEnabled;

/**
 *	@brief	设置是否允许与服务器交换数据。此为一个开关属性，如果设置为NO则包括统计数据、获取在线App配置信息等一切与服务器交互的操作都不允许调用。
 *
 *  @since  ver2.2.6
 *
 *	@param 	enabled 	YES表示允许与服务器进行通讯，NO表示不允许进行通讯
 */
+ (void)allowExchangeDataEnabled:(BOOL)enabled;

/**
 *	@brief	设置应用托管模式，当设置为YES时，将使用服务器中配置的App信息来初始化SDK中的分享平台。
 *          注：当allowExchangeDataEnabled设置为NO时，此项无效。
 *
 *  @since  ver2.2.6
 *
 *	@param 	enabled 	YES表示使用托管应用模式，NO表示不使用托管应用模式。
 */
+ (void)useAppTrusteeship:(BOOL)enabled;


#pragma mark 初始化

/**
 *	@brief	链接平台应用以使用相关功能
 *
 *  @since  ver2.6.0
 *
 *	@param 	type 	平台类型
 *	@param 	appInfo 	应用信息
 */
+ (void)connectPlatformWithType:(ShareType)type
                       platform:(id<ISSPlatform>)platform
                        appInfo:(NSDictionary *)appInfo;


/**
 *	@brief	连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
 *          http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址,无回调页面或者不需要返回回调时可以填写新浪默认回调页面：https://api.weibo.com/oauth2/default.html
 *                          但新浪开放平台中应用的回调地址必须填写此值
 */
+ (void)connectSinaWeiboWithAppKey:(NSString *)appKey
                         appSecret:(NSString *)appSecret
                       redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
 *          http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
 *
 *  @since  ver 2.4.0
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址,无回调页面或者不需要返回回调时可以填写新浪默认回调页面：https://api.weibo.com/oauth2/default.html
 *                          但新浪开放平台中应用的回调地址必须填写此值
 *  @param  weiboSDKCls     新浪微博SDK类型，应先导入libWeiboSDK.a,再传入[WeiboSDK class]到此参数.
 */
+ (void)connectSinaWeiboWithAppKey:(NSString *)appKey
                         appSecret:(NSString *)appSecret
                       redirectUri:(NSString *)redirectUri
                       weiboSDKCls:(Class)weiboSDKCls;

/**
 *	@brief	连接腾讯微博开放平台应用以使用相关功能，此应用需要引用TencentWeiboConnection.framework
 *          http://dev.t.qq.com上注册腾讯微博开放平台应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址，此地址则为应用地址。
 */
+ (void)connectTencentWeiboWithAppKey:(NSString *)appKey
                            appSecret:(NSString *)appSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接腾讯微博开放平台应用以使用相关功能，此应用需要引用TencentWeiboConnection.framework
 *          http://dev.t.qq.com上注册腾讯微博开放平台应用，并将相关信息填写到以下字段
 *
 *  @since  ver2.2.0
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址，此地址则为应用地址。
 *  @param  wbApiCls    腾讯微博Api类型，引入WBApi.h，并将[WBApi class]传入参数，注：不使用SSO时可以传入nil
 */
+ (void)connectTencentWeiboWithAppKey:(NSString *)appKey
                            appSecret:(NSString *)appSecret
                          redirectUri:(NSString *)redirectUri
                             wbApiCls:(Class)wbApiCls;


/**
 *	@brief	连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
 *          http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 */
+ (void)connectQZoneWithAppKey:(NSString *)appKey
                     appSecret:(NSString *)appSecret;

/**
 *	@brief	连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
 *          http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *  @param  qqApiInterfaceCls   QQApi接口类型,如果不需要SSO登录可设置为nil
 *  @param  tencentOAuthCls     腾讯授权接口类型,如果不需要SSO登录可设置为nil
 */
+ (void)connectQZoneWithAppKey:(NSString *)appKey
                     appSecret:(NSString *)appSecret
             qqApiInterfaceCls:(Class)qqApiInterfaceCls
               tencentOAuthCls:(Class)tencentOAuthCls;


/**
 *	@brief	连接网易微博应用以使用相关功能，此应用需要引用T163WeiboConnection.framework
 *          http://open.t.163.com上注册网易微博开放平台应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connect163WeiboWithAppKey:(NSString *)appKey
                        appSecret:(NSString *)appSecret
                      redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接搜狐微博应用以使用相关功能，此应用需要引用SohuWeiboConnection.framework
 *          http://open.t.sohu.com上注册搜狐微博开放平台应用，并将相关信息填写到以下字段
 *
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 *  @param  redirectUri     回调地址
 */
+ (void)connectSohuWeiboWithConsumerKey:(NSString *)consumerKey
                         consumerSecret:(NSString *)consumerSecret
                            redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接豆瓣应用以使用相关功能，此应用需要引用DouBanConnection.framework
 *          http://developers.douban.com上注册豆瓣社区应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectDoubanWithAppKey:(NSString *)appKey
                      appSecret:(NSString *)appSecret
                    redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接人人网应用以使用相关功能，此应用需要引用RenRenConnection.framework
 *          http://dev.renren.com上注册人人网开放平台应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 */
+ (void)connectRenRenWithAppKey:(NSString *)appKey
                      appSecret:(NSString *)appSecret;

/**
 *	@brief	连接人人网应用，此应用需要引用RenRenConnection.framework
 *
 *  @since  ver2.2.6
 *
 *  @param  appId   应用ID
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *  @param  renrenClientClass   人人客户端类型,SSO时需要传入此参数。应该先引入RennSDK.framework，然后在此参数中传入[RennClient class]
 */
+ (void)connectRenRenWithAppId:(NSString *)appId
                        appKey:(NSString *)appKey
                     appSecret:(NSString *)appSecret
             renrenClientClass:(Class)renrenClientClass;

/**
 *	@brief	连接开心网应用以使用相关功能，此应用需要引用KaiXinConnection.framework
 *          http://open.kaixin001.com上注册开心网开放平台应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectKaiXinWithAppKey:(NSString *)appKey
                      appSecret:(NSString *)appSecret
                    redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接Instapaper应用以使用相关功能，此应用需要引用InstapaperConnection.framework
 *          http://www.instapaper.com/main/request_oauth_consumer_token上注册Instapaper应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 */
+ (void)connectInstapaperWithAppKey:(NSString *)appKey
                          appSecret:(NSString *)appSecret;

/**
 *	@brief	连接有道云笔记应用以使用相关功能，此应用需要引用YouDaoNoteConnection.framework
 *          http://note.youdao.com/open/developguide.html#app上注册应用，并将相关信息填写到以下字段
 *
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectYouDaoNoteWithConsumerKey:(NSString *)consumerKey
                          consumerSecret:(NSString *)consumerSecret
                             redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接Facebook应用以使用相关功能，此应用需要引用FacebookConnection.framework
 *          https://developers.facebook.com上注册应用，并将相关信息填写到以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 */
+ (void)connectFacebookWithAppKey:(NSString *)appKey
                        appSecret:(NSString *)appSecret;

/**
 *	@brief	连接Twitter应用以使用相关功能，此应用需要引用TwitterConnection.framework
 *          https://dev.twitter.com上注册应用，并将相关信息填写到以下字段
 *
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectTwitterWithConsumerKey:(NSString *)consumerKey
                       consumerSecret:(NSString *)consumerSecret
                          redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接QQ应用以使用相关功能，此应用需要引用QQConnection.framework和QQApi.framework库
 *          http://mobile.qq.com/api/上注册应用，并将相关信息填写到以下字段
 *
 *	@param 	appId 	应用ID
 *	@param 	qqApiCls 	QQApi类型,引入QQApi.h后，将[QQApi class]传入此参数
 */
+ (void)connectQQWithAppId:(NSString *)appId
                  qqApiCls:(Class)qqApiCls;

/**
 *	@brief	连接QQ应用以使用相关功能，此应用需要引用QQConnection.framework和TencentOAuthAPI.framework库
 *          http://connect.qq.com上注册应用，并将相关信息填写到以下字段,
 *          可以调用此接口来使QQ空间中申请的AppKey用于QQ好友分享
 *
 *  @since  ver2.2.4
 *
 *	@param 	qzoneAppKey 	QQ空间App标识
 *	@param 	qqApiInterfaceCls 	QQAPI接口类型
 *	@param 	tencentOAuthCls 	腾讯OAuth类型
 */
+ (void)connectQQWithQZoneAppKey:(NSString *)qzoneAppKey
               qqApiInterfaceCls:(Class)qqApiInterfaceCls
                 tencentOAuthCls:(Class)tencentOAuthCls;


/**
 *	@brief	连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
 *          http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
 *
 *	@param 	appId 	应用ID
 *	@param 	wechatCls 	微信Api类型，引入WXApi.h后，将[WXApi class]传入此参数
 */
+ (void)connectWeChatWithAppId:(NSString *)appId
                     wechatCls:(Class)wechatCls;

/**
 *	@brief	链接搜狐随身看应用以使用相关功能，此应用需要引用SohuConnection.framework
 *          http://open.sohu.com/上注册应用，并将相关信息填写以下字段
 *
 *  @since  ver2.1.0
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectSohuKanWithAppKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret
                     redirectUri:(NSString *)redirectUri;

/**
 *	@brief	链接Pocket以使用相关功能，此应用需要引用PocketConnection.framework
 *          http://getpocket.com/developer/上注册应用，并将相关信息填写以下字段
 *
 *  @since  ver2.2.0
 *
 *	@param 	consumerKey 	消费者Key
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectPocketWithConsumerKey:(NSString *)consumerKey
                         redirectUri:(NSString *)redirectUri;

/**
 *	@brief	连接印象笔记以使用相关功能，此应用需要引用EverNoteConnection.framework
 *          http://dev.yinxiang.com上注册应用，并将相关信息填写以下字段
 *
 *	@param 	type 	应用类型，可以指定是沙箱、印象笔记中国还是Evernote International,注：如果设置了沙箱类型，则需要在发布应用之前把类型改为其他的，否则会导致用户无法正常使用。
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 */
+ (void)connectEvernoteWithType:(SSEverNoteType)type
                    consumerKey:(NSString *)consumerKey
                 consumerSecret:(NSString *)consumerSecret;


/**
 *	@brief	连接LinkedIn以使用相关功能，此平台需要引用LinkedInConnection.framework
 *          https://www.linkedin.com/secure/developer上注册应用，并将相关信息填写以下字段
 *
 *  @since  ver2.4.0
 *
 *	@param 	apiKey 	应用Key
 *	@param 	secretKey 	应用密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectLinkedInWithApiKey:(NSString *)apiKey
                        secretKey:(NSString *)secretKey
                      redirectUri:(NSString *)redirectUri;

/**
 *	@brief	链接Google+,此平台需要引用GooglePlusConnection.framework、GoogleOpenSource.frramework、GooglePlus.framework框架
 *          https://code.google.com/apis/console上注册应用，并将相关信息填写以下字段
 *
 *  @since  ver2.4.0
 *
 *	@param 	clientId 	应用Key
 *	@param 	clientSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *  @param  signInCls       登录授权类型，应先导入GooglePlus.framework,然后在此参数中传入[GPPSignIn class]
 *  @param  shareCls        分享类型，应先导入GooglePlus.framework,然后在此参数中传入[GPPShare class]
 */
+ (void)connectGooglePlusWithClientId:(NSString *)clientId
                         clientSecret:(NSString *)clientSecret
                          redirectUri:(NSString *)redirectUri
                            signInCls:(Class)signInCls
                             shareCls:(Class)shareCls;

/**
 *	@brief	链接Pinterest,此平台需要引用PinterestConnection.framework、Pinterest.framework框架。
 *          http://developers.pinterest.com/上注册应用，并将相关信息填写以下字段。
 *
 *	@param 	clientId 	应用Key
 *	@param 	pinterestCls 	Pinterest类型，应先导入Pinterest.framework，然后在此参数中传入
 */
+ (void)connectPinterestWithClientId:(NSString *)clientId
                        pinterestCls:(Class)pinterestCls;

/**
 *	@brief	链接Flickr,此平台需要引用FlickrConnection.framework框架。
 *          http://www.flickr.com/services/apps/create/上注册应用，并将相关信息填写以下字段。
 *
 *	@param 	apiKey 	应用Key
 *	@param 	apiSecret 	应用密钥
 */
+ (void)connectFlickrWithApiKey:(NSString *)apiKey
                      apiSecret:(NSString *)apiSecret;

/**
 *	@brief	链接Tumblr,此平台需要引用TumblrConnection.framework框架
 *          http://www.tumblr.com/oauth/apps上注册应用，并将相关信息填写以下字段。
 *
 *	@param 	consumerKey 	应用Key
 *	@param 	consumerSecret 	应用密钥
 *	@param 	callbackUrl 	回调地址
 */
+ (void)connectTumblrWithConsumerKey:(NSString *)consumerKey
                      consumerSecret:(NSString *)consumerSecret
                         callbackUrl:(NSString *)callbackUrl;

/**
 *	@brief	连接Dropbox，此平台需要引用DropboxConnection.framework框架
 *          https://www.dropbox.com/developers/apps上注册应用，并将相关信息填写以下字段。
 *
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 */
+ (void)connectDropboxWithAppKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret;

/**
 *	@brief	连接Instagram,此平台需要引用InstagramConnection.framework框架
 *          http://instagram.com/developer/clients/register/上注册应用，并将相关信息填写以下字段
 *
 *	@param 	clientId 	应用Key
 *	@param 	clientSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 */
+ (void)connectInstagramWithClientId:(NSString *)clientId
                        clientSecret:(NSString *)clientSecret
                         redirectUri:(NSString *)redirectUri;

/**
 *	@brief	链接VKontakte，此平台需要引用VKontakteConnection.framework框架
 *          http://vk.com/editapp?act=create上注册应用，并将相关信息填写以下字段
 *
 *	@param 	appKey 	应用Key
 *	@param 	secretKey 	应用密钥
 */
+ (void)connectVKontakteWithAppKey:(NSString *)appKey
                         secretKey:(NSString *)secretKey;

/**
 *	@brief	连接邮件分享
 *  
 *  @since  ver2.6.0
 */
+ (void)connectMail;

/**
 *	@brief	连接短信分享
 *  
 *  @since  ver2.6.0
 */
+ (void)connectSMS;

/**
 *	@brief	连接打印
 *
 *  @since  ver2.6.0
 */
+ (void)connectAirPrint;

/**
 *	@brief	连接拷贝
 *
 *  @since  ver2.6.0
 */
+ (void)connectCopy;

/**
 *	@brief	连接微信好友
 *
 *  @since  ver2.6.0
 *
 *	@param 	appId 	应用ID，必须要和朋友圈传入ID一致
 *	@param 	wechatCls 	微信Api类型，引入WXApi.h后，将[WXApi class]传入此参数
 */
+ (void)connectWeChatSessionWithAppId:(NSString *)appId
                            wechatCls:(Class)wechatCls;


/**
 *	@brief	连接微信朋友圈
 *
 *  @since  ver2.6.0
 *
 *	@param 	appId 	应用ID，必须要和好友传入ID一致
 *	@param 	wechatCls 	微信Api类型，引入WXApi.h后，将[WXApi class]传入此参数
 */
+ (void)connectWeChatTimelineWithAppId:(NSString *)appId
                             wechatCls:(Class)wechatCls;

/**
 *	@brief	连接微信收藏
 *
 *	@param 	appId 	应用ID，必须要和好友、朋友圈传入ID一致。
 *	@param 	wechatCls 	微信Api类型，引入WXApi.h后，将[WXApi class]传入此参数
 */
+ (void)connectWeChatFavWithAppId:(NSString *)appId
                        wechatCls:(Class)wechatCls;

/**
 *	@brief	链接易信好友
 *
 *  @since  ver2.7.0
 *
 *	@param 	appId 	应用ID，必须要和朋友圈传入ID一致
 *	@param 	yixinCls 	易信Api类型，引入YXApi.h后，将[YXApi class]传入此参数
 */
+ (void)connectYiXinSessionWithAppId:(NSString *)appId
                            yixinCls:(Class)yixinCls;

/**
 *	@brief	链接易信好友
 *
 *  @since  ver2.7.0
 *
 *	@param 	appId 	应用ID，必须和易信好友传入ID一致
 *	@param 	yixinCls 	易信Api类型，引入YXApi.h后，将[YXApi class]传入此参数
 */
+ (void)connectYiXinTimelineWithAppId:(NSString *)appId
                             yixinCls:(Class)yixinCls;


/**
 *	@brief	连接易信应用以使用相关功能，此应用需要引用YiXinConnection.framework和易信官方SDK
 *          http://open.yixin.im/上注册应用，并将相关信息填写以下字段
 *
 *	@param 	appId 	应用ID
 *	@param 	yixinCls 	易信Api类型，引入YXApi.h后，将[YXApi class]传入此参数
 */
+ (void)connectYiXinWithAppId:(NSString *)appId
                     yixinCls:(Class)yixinCls;

/**
 *	@brief	处理请求打开链接,如果集成新浪微博(SSO)、Facebook(SSO)、微信、QQ分享功能需要加入此方法
 *
 *	@param 	url 	链接
 *  @param  wxDelegate  微信委托,如果没有集成微信SDK，可以传入nil
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
+ (BOOL)handleOpenURL:(NSURL *)url wxDelegate:(id)wxDelegate;


/**
 *	@brief	处理请求打开链接,如果集成新浪微博(SSO)、Facebook(SSO)、微信、QQ分享功能需要加入此方法
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *  @param  wxDelegate  微信委托,如果没有集成微信SDK，可以传入nil
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
+ (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation
           wxDelegate:(id)wxDelegate;

/**
 *	@brief	导入腾讯微博类型，对于使用应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法。注：不使用SSO时可以不调用
 *
 *	@param 	wbApiCls 	腾讯微博Api类型，引入WBApi.h，并将[WBApi class]传入参数
 */
+ (void)importTencentWeiboClass:(Class)wbApiCls;

/**
 *	@brief	导入QQ好友和QQ空间所需要类型，对于使用应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法。注：不使用QQ空间SSO或者不调用QQ好友分享时可以不调用
 *
 *	@param 	qqApiInterfaceCls 	QQApi接口类型
 *	@param 	tencentOAuthCls 	腾讯授权接口类型
 */
+ (void)importQQClass:(Class)qqApiInterfaceCls
      tencentOAuthCls:(Class)tencentOAuthCls;

/**
 *	@brief	导入人人所需要类型，对于使用应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法。注：不使用SSO时可以不调用
 *
 *	@param 	renrenClientClass 	人人客户端类型,应该先引入RennSDK.framework，然后在此参数中传入[RennClient class]
 */
+ (void)importRenRenClass:(Class)renrenClientClass;

/**
 *	@brief	导入微信所需要类型，对于使用应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法。注：如果不使用微信可以不调用
 *
 *	@param 	wechatCls 	微信Api类型，引入WXApi.h后，将[WXApi class]传入此参数
 */
+ (void)importWeChatClass:(Class)wechatCls;

/**
 *	@brief	导入Google+所需要的类型，对于使用应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法。注：如果不使用Google＋可以不调用
 *
 *  @since  ver2.4.0
 *
 *	@param 	signInClass 	登录类型，引入GooglePlus.framework后，将[GPPSignIn class]传入此参数
 *	@param 	shareClass 	分享类型，引入GooglePlush.framework后，将[GPPShare class]传入此参数
 */
+ (void)importGooglePlusClass:(Class)signInClass
                   shareClass:(Class)shareClass;

/**
 *	@brief	导入Pinterest所需要的类型，对于使用应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法，注：如果不使用Pinterest可以不调用
 *
 *  @since  ver2.4.1
 *
 *	@param 	pinterestClass 	Pinterest接口类型。引入Pinterest.framework后，将[Pinterest class]传入此参数
 */
+ (void)importPinterestClass:(Class)pinterestClass;

/**
 *	@brief	导入易信所需要的类型，对于应用信息托管方式下（即registerApp中的useAppTrusteeship为YES）需要调用此方法，注：如果不使用易信可以不调用
 *
 *	@param 	yixinClass 	易信接口类型。引入libYixinSDK.a后，将[YXApi class]传入此参数
 */
+ (void)importYiXinClass:(Class)yixinClass;


#pragma mark 辅助

/**
 *	@brief	获取平台客户端名称
 *
 *  @since  ver1.2.4
 *
 *	@param 	type 	分享类型
 *
 *	@return	名称
 */
+ (NSString *)getClientNameWithType:(ShareType)type;

/**
 *	@brief	获取平台客户端图标
 *
 *  @since  ver1.2.4
 *
 *	@param 	type 	分享类型
 *
 *	@return	图标
 */
+ (UIImage *)getClientIconWithType:(ShareType)type;

/**
 *	@brief	获取平台客户端
 *
 *	@param 	type 	分享类型
 *
 *	@return	平台客户端
 */
+ (id<ISSPlatformApp>)getClientWithType:(ShareType)type;

/**
 *	@brief	获取分享列表
 *
 *	@param 	shareType 	社会化平台类型
 *
 *	@return	分享列表
 */
+ (NSArray *)getShareListWithType:(ShareType)shareType, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *	@brief	添加通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	目标对象
 *	@param 	action 	处理方法
 */
+ (void)addNotificationWithName:(NSString *)name
                         target:(id)target
                         action:(SEL)action;

/**
 *	@brief	移除通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	目标对象
 */
+ (void)removeNotificationWithName:(NSString *)name
                            target:(id)target;

/**
 *	@brief	移除全部通知监听
 *
 *	@param 	target 	目标对象
 */
+ (void)removeAllNotificationWithTarget:(id)target;

/**
 *	@brief	创建分页对象,为提供获取关注用户列表中的page参数提供的构造方法
 *
 *	@param 	cursor 	分页游标，目前此方法仅用于Twitter，获取起始页请传入-1
 *
 *	@return 分页对象
 */
+ (id<ISSPage>)pageWithCursor:(long long)cursor;

/**
 *	@brief	创建分页对象,为提供获取关注用户列表中的page参数提供的构造方法
 *
 *	@param 	pageNo 	页码
 *	@param 	pageSize 	分页尺寸
 *
 *	@return	分页对象
 */
+ (id<ISSPage>)pageWithPageNo:(NSInteger)pageNo pageSize:(NSInteger)pageSize;

/**
 *	@brief	创建分享内容对象，根据以下每个字段适用平台说明来填充参数值
 *
 *	@param 	content 	分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	defaultContent 	默认分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	image 	分享图片（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、facebook、twitter、邮件、打印、微信、QQ、拷贝）
 *	@param 	title 	标题（QQ空间、人人、微信、QQ）
 *	@param 	url 	链接（QQ空间、人人、instapaper、微信、QQ）
 *	@param 	description 	主体内容（人人）
 *	@param 	mediaType 	分享类型（QQ、微信）
 *
 *	@return	分享内容对象
 */
+ (id<ISSContent>)content:(NSString *)content
           defaultContent:(NSString *)defaultContent
                    image:(id<ISSCAttachment>)image
                    title:(NSString *)title
                      url:(NSString *)url
              description:(NSString *)description
                mediaType:(SSPublishContentMediaType)mediaType;

/**
 *	@brief	创建分享内容对象，根据一下每个字段适用平台说明来填充参数值
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	defaultContent 	默认分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	image 	分享图片（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、facebook、twitter、邮件、打印、微信、QQ、拷贝）
 *	@param 	title 	标题（QQ空间、人人、微信、QQ）
 *	@param 	url 	链接（QQ空间、人人、instapaper、微信、QQ）
 *	@param 	description 	主体内容（人人）
 *	@param 	mediaType 	分享类型（QQ、微信）
 *	@param 	locationCoordinate 	地理位置 (新浪、腾讯、Twitter)
 *
 *	@return	分享内容对象
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
 *	@brief	创建分享内容对象，根据一下每个字段适用平台说明来填充参数值
 *
 *  @since  ver2.6.0
 *
 *	@param 	content 	分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	defaultContent 	默认分享内容（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、有道云笔记、facebook、twitter、邮件、打印、短信、微信、QQ、拷贝）
 *	@param 	image 	分享图片（新浪、腾讯、网易、搜狐、豆瓣、人人、开心、facebook、twitter、邮件、打印、微信、QQ、拷贝）
 *	@param 	title 	标题（QQ空间、人人、微信、QQ）
 *	@param 	url 	链接（QQ空间、人人、instapaper、微信、QQ）
 *	@param 	description 	主体内容（人人）
 *	@param 	mediaType 	分享类型（QQ、微信）
 *	@param 	locationCoordinate 	地理位置 (新浪、腾讯、Twitter)
 *  @param  groupId     分组标识
 *
 *	@return	分享内容对象
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
 *	@brief	获取图片信息
 *
 *	@param 	path 	图片路径
 *
 *	@return 图片信息
 */
+ (id<ISSCAttachment>)imageWithPath:(NSString *)path;

/**
 *	@brief	获取图片信息
 *
 *	@param 	url 	图片网址
 *
 *	@return	图片信息
 */
+ (id<ISSCAttachment>)imageWithUrl:(NSString *)url;

/**
 *	@brief	创建JPEG图片信息
 *
 *	@param 	image 	图片对象
 *  @param  quality 图片质量
 *
 *	@return	图片信息
 */
+ (id<ISSCAttachment>)jpegImageWithImage:(UIImage *)image quality:(CGFloat)quality;

/**
 *	@brief	创建PNG图片信息
 *
 *	@param 	image 	图片对象
 *
 *	@return	图片信息
 */
+ (id<ISSCAttachment>)pngImageWithImage:(UIImage *)image;

/**
 *	@brief	获取图片信息
 *
 *	@param 	data 	图片数据
 *	@param 	fileName 	文件名称
 *	@param 	mimeType 	MIME类型
 *
 *	@return	图片信息
 */
+ (id<ISSCAttachment>)imageWithData:(NSData *)data
                           fileName:(NSString *)fileName
                           mimeType:(NSString *)mimeType;

/**
 *	@brief	创建容器对象
 *
 *	@return	容器对象
 */
+ (id<ISSContainer>)container;

/**
 *	@brief	创建自定义分享菜单项
 *
 *  @since  ver1.2.3
 *
 *	@param 	title 	标题
 *	@param 	icon 	图标
 *	@param 	clickHandler 	点击事件处理器
 *
 *	@return	分享菜单项
 */
+ (id<ISSShareActionSheetItem>)shareActionSheetItemWithTitle:(NSString *)title
                                                        icon:(UIImage *)icon
                                                clickHandler:(SSShareActionSheetItemClickHandler)clickHandler;

/**
 *	@brief	创建附件信息,用于设置有道云笔记平台的附件信息。
 *
 *	@param 	data 	附件数据
 *	@param 	mimeType 	附件类型
 *  @param  fileName    附件名称
 *
 *	@return	附件信息
 */
+ (id<ISSCAttachment>)attachmentWithData:(NSData *)data mimeType:(NSString *)mimeType fileName:(NSString *)fileName;

/**
 *	@brief	创建自定义分享列表
 *
 *	@param 	item 分享列表项，可以为包含ShareType的NSNumber类型，也可以为由shareActionSheetItemWithTitle创建的ISSShareActionSheetItem类型对象。
 *
 *	@return	分享列表
 */
+ (NSArray *)customShareListWithType:(id)item, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *	@brief	设置屏幕方向,默认是所有方向
 *
 *	@param 	interfaceOrientationMask 	屏幕方向掩码
 */
+ (void)setInterfaceOrientationMask:(SSInterfaceOrientationMask)interfaceOrientationMask;

/**
 *	@brief	将授权凭证进行序列化
 *
 *  @since  ver2.6.0    修复返回的类型
 *
 *	@param 	credential 	序列化凭证
 *
 *	@return	序列化后的数据
 */
+ (NSData *)dataWithCredential:(id<ISSPlatformCredential>)credential;

/**
 *	@brief	创建用户信息
 *
 *  @since  ver2.0.1
 *  @since  ver2.6.0    修复返回类型
 *
 *	@param 	localUser 	平台相关用户信息
 *	@param 	type 	平台类型
 *
 *	@return	用户信息
 */
+ (id<ISSPlatformUser>)userWithLocalUser:(id)localUser type:(ShareType)type;

/**
 *	@brief	创建状态信息
 *
 *  @since  ver2.0.1
 *  @since  ver2.6.0    修复返回类型
 *
 *	@param 	localStatus 	平台相关的状态信息
 *	@param 	type 	平台类型
 *
 *	@return	状态信息
 */
+ (id<ISSPlatformShareInfo>)statusWithLocalStatus:(id)localStatus type:(ShareType)type;

/**
 *	@brief	创建用户信息字段
 *
 *  @since  ver2.1.1
 *
 *	@param 	type 	用户字段类型
 *	@param 	value 	用户字段值
 *
 *	@return	用户信息字段
 */
+ (id<ISSUserField>)userFieldWithType:(SSUserFieldType)type value:(NSString *)value;

/**
 *	@brief	显示顶部状态栏显示消息,此消息会一直显示，直到调用hideStatusbarMessage为止
 *
 *  @since  ver2.2.0
 *
 *	@param 	message 	消息内容
 */
+ (void)showStatusbarMessage:(NSString *)message;

/**
 *	@brief	隐藏顶部状态消息。
 *
 *  @since  ver2.2.0
 *
 */
+ (void)hideStatusbarMessage;

/**
 *	@brief	显示临时消息，此消息再一定时间内容消失，此消息内容不受hideStatusbarMessage控制。
 *
 *  @since  ver2.2.0
 *
 *	@param 	message 	消息内容
 */
+ (void)showStatusbarImmediMessage:(NSString *)message;

/**
 *	@brief	等待应用配置信息完成,此方法专门针对使用应用信息托管时使用，由于从服务器下发信息需要时间，
 *          因此在调用平台api之前先调用此方法等待完成后做相应操作。
 *  
 *  @since  ver2.2.6
 *
 *  @param  completeHandler     完成处理事件
 */
+ (void)waitAppSettingComplete:(void(^)())completeHandler;

/**
 *	@brief	获取已连接的平台类型列表
 *
 *  @since  ver2.6.0
 *
 *	@return	已连接平台列表，其元素为包含ShareType的NSNumber对象
 */
+ (NSArray *)connectedPlatformTypes;


/**
 *	@brief	获取当前SDK版本号
 *
 *  @since  ver2.6.0
 *
 *	@return	版本号
 */
+ (NSString *)version;



#pragma mark 授权

/**
 *	@brief	反序列化数据为授权凭证
 *
 *  @since  ver2.6.0    调整返回的类型
 *
 *	@param 	data 	授权凭证序列化后的数据
 *	@param 	type 	类型
 *
 *	@return	授权凭证
 */
+ (id<ISSPlatformCredential>)credentialWithData:(NSData *)data type:(ShareType)type;

/**
 *	@brief	创建授权凭证,通过其他途径获取到的授权数据通过此接口转换为凭证对象传入SDK
 *
 *  @since  ver2.6.0
 *
 *  @param  type    平台类型
 *	@param 	uid 	授权用户标识
 *	@param 	token 	访问令牌，在OAuth中为oauth_token，在OAuth2中为access_token
 *	@param 	secret 	访问令牌密钥，仅用于OAuth授权中，为oauth_token_secret。
 *	@param 	expired 	过期时间，仅用于OAuth2授权中，需要将返回的秒数转换为时间。
 *	@param 	extInfo 	扩展信息。用于存放除上述信息外的其它信息。
 *
 *	@return	授权凭证
 */
+ (id<ISSPlatformCredential>)credentialWithType:(ShareType)type
                                            uid:(NSString *)uid
                                          token:(NSString *)token
                                         secret:(NSString *)secret
                                        expired:(NSDate *)expired
                                        extInfo:(NSDictionary *)extInfo;

/**
 *	@brief	获取授权凭证,凭证中包含accessToken或oauthToken、过期时间等信息
 *
 *  @since  ver2.6.0    修改返回类型
 *
 *	@param 	type 	平台类型
 *
 *	@return	授权凭证
 */
+ (id<ISSPlatformCredential>)getCredentialWithType:(ShareType)type;

/**
 *	@brief	设置授权凭证
 *
 *  @since  ver2.6.0    修复凭证类型
 *
 *	@param 	credential 	授权凭证
 *	@param 	type 	平台类型
 */
+ (void)setCredential:(id<ISSPlatformCredential>)credential type:(ShareType)type;

/**
 *	@brief	创建授权选项
 *
 *	@param 	autoAuth 	自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  allowCallback   是否允许授权后回调到服务器，默认为YES，对于没有服务器或者不需要回调服务器的应用可以设置为NO
 *	@param 	authViewStyle 	授权视图样式，参考SSAuthViewStyle枚举类型
 *  @param  viewDelegate    授权视图协议委托，可通过视图委托来实现UI细节调整等。
 *  @param  authManagerViewDelegate     授权管理器视图协议委托。可通过委托实现UI细节调整等。
 *
 *	@return	授权选项
 */
+ (id<ISSAuthOptions>)authOptionsWithAutoAuth:(BOOL)autoAuth
                                allowCallback:(BOOL)allowCallback
                                authViewStyle:(SSAuthViewStyle)authViewStyle
                                 viewDelegate:(id<ISSViewDelegate>)viewDelegate
                      authManagerViewDelegate:(id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	创建授权选项
 *
 *  @since  ver2.1.1    增加授权权限列表
 *
 *	@param 	autoAuth 	自动授权标志，当分享内容时发现授权过期是否委托SDK处理授权问题，YES：表示委托授权， NO：表示不委托授权，需要自己根据返回值进行判断和处理
 *  @param  allowCallback   是否允许授权后回调到服务器，默认为YES，对于没有服务器或者不需要回调服务器的应用可以设置为NO
 *  @param  scopes      授权权限列表，如果默认请求权限可以设置为nil，否则需要参考各个平台的权限相关内容进行填写, value是权限列表， key为分享平台ID
 *  @param  powerByHidden   版权信息隐藏标识，如果为NO则在导航栏右边显示版权信息字样，YES 表示隐藏。默认为NO。
 *  @param  followAccounts      关注的微博账号信息，为字典结构，key为分享类型，value为ISSUserField对象(此属性仅用于Modal视图样式，并且仅在新浪微博和腾讯微博中有效)。
 *	@param 	authViewStyle 	授权视图样式，参考SSAuthViewStyle枚举类型
 *  @param  viewDelegate    授权视图协议委托，可通过视图委托来实现UI细节调整等。
 *  @param  authManagerViewDelegate     授权管理器视图协议委托。可通过委托实现UI细节调整等。
 *
 *	@return	授权选项
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
 *	@brief	创建授权控制器，此方法用于自定义授权页面时使用,可以自由控制授权UI及过程。(注：微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。)
 *
 *  @since  ver2.6.0    修改返回类型
 *
 *	@param 	type 	平台类型
 *
 *	@return	授权会话
 */
+ (id<ISSPlatformAuthSession>)authorizeController:(ShareType)type;

/**
 *	@brief	显示授权界面，(注：微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。)
 *
 *	@param 	type    社会化平台类型
 *  @param  options 授权选项，如果为nil则表示使用默认设置
 *  @param  result    授权返回事件处理
 */
+ (void)authWithType:(ShareType)type
             options:(id<ISSAuthOptions>)options
              result:(SSAuthEventHandler)result;

/**
 *	@brief	判断是否授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *	@param 	type 	社会化平台类型
 *
 *	@return	YES 已授权； NO 未授权
 */
+ (BOOL)hasAuthorizedWithType:(ShareType)type;

/**
 *	@brief	取消授权,微信、QQ、邮件、短信、打印、拷贝类型不支持授权功能。
 *
 *	@param 	type 	社会化平台类型
 */
+ (void)cancelAuthWithType:(ShareType)type;

/**
 *	@brief	获取当前授权用户
 *
 *  @since  ver2.6.0
 *
 *	@param 	type 	平台类型
 *
 *	@return	用户信息
 */
+ (id<ISSPlatformUser>)currentAuthUserWithType:(ShareType)type;

/**
 *	@brief	设置当前授权用户，当有多个授权用户的时候可以使用此方法进行切换。
 *
 *  @since  ver2.6.0
 *
 *	@param 	user 	用户信息，注：此用户信息必须已经包含授权凭证，否则设置后无法进行相关功能接口调用，会要求重新进行授权。
 *	@param 	type 	平台类型
 *
 */
+ (void)setCurrentAuthUser:(id<ISSPlatformUser>)user type:(ShareType)type;


/**
 *	@brief	获取授权用户列表
 *
 *  @since  ver2.6.0
 *
 *	@param 	type 	平台类型
 *
 *	@return	用户信息列表
 */
+ (NSArray *)authorizedUsersWithType:(ShareType)type;



#pragma mark 用户信息

/**
 *	@brief	获取当前授权用户信息
 *
 *	@param 	shareType 	平台类型
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,传入nil表示使用默认选项
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)shareType
                authOptions:(id<ISSAuthOptions>)authOptions
                     result:(SSGetUserInfoEventHandler)result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	type 	平台类型
 *	@param 	field 	用户信息字段值，用于指定对应用户的标识字段。
 *	@param 	fieldType 	字段类型，标识是用户ID、用户名称
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  result  获取用户信息返回事件
 */
+ (void)getUserInfoWithType:(ShareType)type
                      field:(NSString *)field
                  fieldType:(SSUserFieldType)fieldType
                authOptions:(id<ISSAuthOptions>)authOptions
                     result:(SSGetUserInfoEventHandler)result;

#pragma mark 关系

/**
 *	@brief	关注用户
 *
 *	@param 	type 	平台类型
 *	@param 	field 	用户信息字段值，用于指定对应用户的标识字段。
 *	@param 	fieldType 	字段类型，标识是用户ID、用户名称
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  viewDelegate    视图委托对象，对于Facebook的关注用户会弹出视图，该委托则用于派发视图的相关行为通知。非Facebook平台可以传入nil
 *	@param 	result 	关注用户返回事件
 */
+ (void)followUserWithType:(ShareType)type
                     field:(NSString *)field
                 fieldType:(SSUserFieldType)fieldType
               authOptions:(id<ISSAuthOptions>)authOptions
              viewDelegate:(id<ISSViewDelegate>)viewDelegate
                    result:(SSFollowUserEventHandler)result;

/**
 *	@brief	获取授权用户的关注用户列表
 *
 *	@param 	type 	社会化平台类型
 *	@param 	page 	分页对象
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *	@param 	result 	获取好友列表返回事件
 */
+ (void)getFriendsWithType:(ShareType)type
                      page:(id<ISSPage>)page
               authOptions:(id<ISSAuthOptions>)authOptions
                    result:(SSFriendsResultEvent)result;


#pragma mark 分享

/**
 *	@brief	创建默认分享选项
 *
 *	@param 	title 	分享视图标题
 *	@param 	oneKeyShareList 	一键分享列表，传入[NSArray defaultOneKeyShareList]表示使用默认分享列表，为nil则表示不需要一键分享
 *	@param 	qqButtonHidden 	QQ分享按钮是否隐藏,如果不隐藏则显示在分享视图的工具栏右侧，默认显示
 *	@param 	wxSessionButtonHidden 	微信好友分享按钮是否隐藏，如果不隐藏则显示在分享视图的工具栏右侧，默认显示
 *	@param 	wxTimelineButtonHidden 	微信朋友圈分享按钮是否隐藏，如果不隐藏则显示在分享视图的工具栏右侧，默认显示
 *	@param 	showKeyboardOnAppear 	分享视图显示时是否同时显示键盘，如果不显示键盘则显示一键分享列表，默认不显示
 *	@param 	shareViewDelegate 	分享视图委托，如果不需要控制视图则传入nil
 *	@param 	friendsViewDelegate 	好友视图委托，如果不需要控制视图则传入nil
 *	@param 	picViewerViewDelegate 	图片查看器视图委托，如果不需要控制视图则传入nil
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
 *	@brief	创建默认分享选项
 *
 *  @since  ver2.2.0
 *
 *	@param 	title 	分享视图标题
 *	@param 	oneKeyShareList 	一键分享列表，传入[NSArray defaultOneKeyShareList]表示使用默认分享列表，为nil则表示不需要一键分享
 *	@param 	cameraButtonHidden 	拍照按钮是否隐藏,如果不隐藏则显示再分享视图的工具栏左侧，默认显示
 *	@param 	mentionButtonHidden 	@按钮是否隐藏,如果不隐藏则显示再分享视图的工具栏左侧，默认显示
 *	@param 	topicButtonHidden 	话题按钮是否隐藏,如果不隐藏则显示再分享视图的工具栏左侧，默认显示
 *	@param 	qqButtonHidden 	QQ分享按钮是否隐藏,如果不隐藏则显示在分享视图的工具栏右侧，默认显示
 *	@param 	wxSessionButtonHidden 	微信好友分享按钮是否隐藏，如果不隐藏则显示在分享视图的工具栏右侧，默认显示
 *	@param 	wxTimelineButtonHidden 	微信朋友圈分享按钮是否隐藏，如果不隐藏则显示在分享视图的工具栏右侧，默认显示
 *	@param 	showKeyboardOnAppear 	分享视图显示时是否同时显示键盘，如果不显示键盘则显示一键分享列表，默认不显示
 *	@param 	shareViewDelegate 	分享视图委托，如果不需要控制视图则传入nil
 *	@param 	friendsViewDelegate 	好友视图委托，如果不需要控制视图则传入nil
 *	@param 	picViewerViewDelegate 	图片查看器视图委托，如果不需要控制视图则传入nil
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
 *	@brief	创建简单分享选项
 *
 *	@param 	title 	分享视图标题
 *	@param 	shareViewDelegate 	分享视图委托，如果不需要控制视图则传入nil
 *
 *	@return	分享选项
 */
+ (id<ISSShareOptions>)simpleShareOptionsWithTitle:(NSString *)title
                                 shareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	创建应用推荐分享选项
 *
 *	@param 	title 	分享视图标题
 *	@param 	shareViewDelegate 	分享视图委托，如果不需要控制视图则传入nil
 *
 *	@return	分享选项
 */
+ (id<ISSShareOptions>)appRecommendShareOptionsWithTile:(NSString *)title
                                      shareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	分享内容,此接口不需要弹出分享界面直接进行分享（除微信、QQ、Pinterest平台外，这些平台会调用客户端进行分享）。
 *
 *	@param 	content 	内容对象
 *	@param 	type 	平台类型
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  statusBarTips   状态栏提示
 *	@param 	result 	返回事件
 */
+ (void)shareContent:(id<ISSContent>)content
                type:(ShareType)type
         authOptions:(id<ISSAuthOptions>)authOptions
       statusBarTips:(BOOL)statusBarTips
              result:(SSPublishContentEventHandler)result;

/**
 *	@brief	分享内容,此接口不需要弹出分享界面直接进行分享（除微信、QQ、Pinterest平台外，这些平台会调用客户端进行分享）。
 *
 *  @since  ver2.2.5
 *
 *	@param 	content 	内容对象
 *	@param 	type 	平台类型
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  shareOptions    分享选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）,默认可传入nil
 *  @param  statusBarTips   状态栏提示
 *	@param 	result 	返回事件
 */
+ (void)shareContent:(id<ISSContent>)content
                type:(ShareType)type
         authOptions:(id<ISSAuthOptions>)authOptions
        shareOptions:(id<ISSShareOptions>)shareOptions
       statusBarTips:(BOOL)statusBarTips
              result:(SSPublishContentEventHandler)result;

/**
 *	@brief	一键分享内容
 *
 *	@param 	content 	内容对象
 *	@param 	shareList 	平台类型列表（邮件、短信、微信、QQ、打印、拷贝除外）
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  statusBarTips   状态栏提示
 *	@param 	result 	返回事件
 */
+ (void)oneKeyShareContent:(id<ISSContent>)content
                 shareList:(NSArray *)shareList
               authOptions:(id<ISSAuthOptions>)authOptions
             statusBarTips:(BOOL)statusBarTips
                    result:(SSPublishContentEventHandler)result;

/**
 *	@brief	一键分享内容
 *
 *  @since  ver2.2.5
 *
 *	@param 	content 	内容对象
 *	@param 	shareList 	平台类型列表（邮件、短信、微信、QQ、打印、拷贝除外）
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  statusBarTips   状态栏提示
 *	@param 	result 	返回事件
 */
+ (void)oneKeyShareContent:(id<ISSContent>)content
                 shareList:(NSArray *)shareList
               authOptions:(id<ISSAuthOptions>)authOptions
              shareOptions:(id<ISSShareOptions>)shareOptions
             statusBarTips:(BOOL)statusBarTips
                    result:(SSPublishContentEventHandler)result;

/**
 *	@brief	显示分享视图
 *
 *	@param 	type 	平台类型
 *  @param  container   用于显示分享界面的容器，如果只显示在iPhone客户端可以传入nil。如果需要在iPad上显示需要指定容器。
 *	@param 	content 	分享内容
 *	@param 	statusBarTips 	状态栏提示标识：YES：显示； NO：隐藏
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等），默认可传入nil
 *	@param 	shareOptions 	分享选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）,默认可传入nil
 *	@param 	result 	分享返回事件处理
 */
+ (void)showShareViewWithType:(ShareType)type
                    container:(id<ISSContainer>)container
                      content:(id<ISSContent>)content
                statusBarTips:(BOOL)statusBarTips
                  authOptions:(id<ISSAuthOptions>)authOptions
                 shareOptions:(id<ISSShareOptions>)shareOptions
                       result:(SSPublishContentEventHandler)result;

/**
 *	@brief	显示分享菜单
 *
 *	@param 	container 	用于显示分享界面的容器，如果只显示在iPhone客户端可以传入nil。如果需要在iPad上显示需要指定容器。
 *	@param 	shareList 	平台类型列表
 *	@param 	content 	分享内容
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等），默认可传入nil
 *  @param  shareOptions    分享选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）,默认可传入nil
 *  @param  result  分享返回事件处理
 */
+ (id<ISSShareActionSheet>)showShareActionSheet:(id<ISSContainer>)container
                                      shareList:(NSArray *)shareList
                                        content:(id<ISSContent>)content
                                  statusBarTips:(BOOL)statusBarTips
                                    authOptions:(id<ISSAuthOptions>)authOptions
                                   shareOptions:(id<ISSShareOptions>)shareOptions
                                         result:(SSPublishContentEventHandler)result;

/**
 *	@brief	使用客户端进行内容分享（仅支持新浪微博、微信、QQ、Pinterest、Google+）
 *
 *  @since  ver2.4.1
 *
 *	@param 	content 	内容对象
 *	@param 	type 	平台类型
 *  @param  statusBarTips   状态栏提示
 *	@param 	result 	返回事件
 */
+ (void)clientShareContent:(id<ISSContent>)content
                      type:(ShareType)type
             statusBarTips:(BOOL)statusBarTips
                    result:(SSPublishContentEventHandler)result;

@end
