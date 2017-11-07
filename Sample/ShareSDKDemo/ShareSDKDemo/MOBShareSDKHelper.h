//
//  MOBShareSDKHelper.h
//  ShareSDKDemo
//
//  Created by youzu on 2017/6/1.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 配置开启平台
/**
 ShareSDK 
 设置平台 通过开启关闭平台的宏控制平台 是否注册此平台
 */

//国内平台
#define IMPORT_SINA_WEIBO //注释此行则 不开启【 新浪微博 】平台
#define IMPORT_SUB_QQFriend //注释此行则 不开启【 QQ好友 】平台
#define IMPORT_SUB_QZone //注释此行则 不开启【 QQ空间 】平台
#define IMPORT_SUB_WechatSession //注释此行则 不开启【 微信好友 】平台
#define IMPORT_SUB_WechatTimeline //注释此行则 不开启【 微信朋友圈 】平台
#define IMPORT_SUB_WechatFav //注释此行则 不开启【 微信收藏 】平台
#define IMPORT_AliPaySocial  //注释此行则 不开启【 支付宝好友 】平台
#define IMPORT_AliPaySocialTimeline  //注释此行则 不开启【 支付宝朋友圈 】平台
#define IMPORT_DingTalk //注释此行则 不开启【 钉钉 】平台
#define IMPORT_TencentWeibo //注释此行则 不开启【 腾讯微博 】平台
#define IMPORT_DouBan //注释此行则 不开启【 豆瓣 】平台
#define IMPORT_MeiPai //注释此行则 不开启【 美拍 】平台
#define IMPORT_YinXiang //注释此行则 不开启【 印象笔记 】平台
#define IMPORT_YouDaoNote //注释此行则 不开启【 有道云笔记 】平台
#define IMPORT_Mingdao //注释此行则 不开启【 明道 】平台
#define IMPORT_Kaixin //注释此行则 不开启【 开心网 】平台
#define IMPORT_Renren //注释此行则 不开启【 人人网 】平台
#define IMPORT_SUB_YiXinSession //注释此行则 不开启【 易信好友 】平台
#define IMPORT_SUB_YiXinTimeline //注释此行则 不开启【 易信朋友圈 】平台
#define IMPORT_SUB_YiXinFav //注释此行则 不开启【 易信收藏 】平台
//海外平台
#define IMPORT_Facebook //注释此行则 不开启【 Facebook 】平台
#define IMPORT_FacebookMessenger //注释此行则 不开启【 FacebookMessenger 】平台
#define IMPORT_Instagram //注释此行则 不开启【 Instagram 】平台
#define IMPORT_Twitter //注释此行则 不开启【 Twitter 】平台
#define IMPORT_Line //注释此行则 不开启【 Line 】平台
#define IMPORT_GooglePlus //注释此行则 不开启【 GooglePlus 】平台
#define IMPORT_WhatsApp //注释此行则 不开启【 WhatsApp 】平台
#define IMPORT_SUB_KakaoTalk //注释此行则 不开启【 KakaoTalk 】平台
#define IMPORT_SUB_KakaoStory //注释此行则 不开启【 KakaoStory 】平台
#define IMPORT_YouTube //注释此行则 不开启【 YouTube 】平台
#define IMPORT_Flickr //注释此行则 不开启【 Flickr 】平台
#define IMPORT_Dropbox //注释此行则 不开启【 Dropbox 】平台
#define IMPORT_Evernote //注释此行则 不开启【 Evernote 】平台
#define IMPORT_Pinterest //注释此行则 不开启【 Pinterest 】平台
#define IMPORT_Pocket //注释此行则 不开启【 Pocket 】平台
#define IMPORT_LinkedIn //注释此行则 不开启【 LinkedIn 】平台
#define IMPORT_VKontakte //注释此行则 不开启【 VKontakte 】平台
#define IMPORT_Instapaper //注释此行则 不开启【 Instapaper 】平台
#define IMPORT_Tumblr //注释此行则 不开启【 Tumblr 】平台
//系统平台
#define IMPORT_SMS //注释此行则 不开启【 SMS 】平台
#define IMPORT_Mail //注释此行则 不开启【 Mail 】平台
#define IMPORT_Copy //注释此行则 不开启【 Copy 】平台
#define IMPORT_Print //注释此行则 不开启【 Print 】平台

/**
 以下为各平台的相关参数设置
 */

#pragma mark - 新浪微博配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>sinaweibosso</string>
     <string>weibo</string>
     <string>weibosdk</string>
     <string>weibosdk2.5</string>
     <string>sinaweibo</string>
     <string>sinaweibohd</string>
     
     info.plist 中需要设置 URL Schemes
     规则 wb+AppKey 例：wb568898243
     
     Other Linker Flags 需设置 -ObjC
     
     授权：应用内web 客户端SSO
     
     可以通过以下方法进行权限添加
     - (void)SSDKSetAuthSettings:(NSArray *)authSettings
     
     v4.0.1 默认不再区分客户端或web分享  有客户端则优先使用客户端进行分享 无客户端则调用微博SDK内置分享页面进行分享
     SDK：文字 文字+图片 链接 注：为安装客户端
     api：文字 文字+图片 注：文字中需要附安全域链接 安全域需要在微博开放平台设置 并不能分享话题 通过设置参数时设置 SSDKEnableSinaWeiboAPIShare 启动
 
     v4.0.4
     1、视频分享只支持本地视频分享
     2、多张图片分享并开启story分享的话，默认取第一张图

     分享详例：MOBSinaWeiboViewController
 
     开放平台地址： http://open.weibo.com
*/
#ifdef IMPORT_SINA_WEIBO
    //AppKey
    #define MOBSSDKSinaWeiboAppKey @"568898243"
    //AppSecret
    #define MOBSSDKSinaWeiboAppSecret @"38a4f8204cc784f81f9f0daaf31e02e3"
    //RedirectUri
    #define MOBSSDKSinaWeiboRedirectUri @"http://www.sharesdk.cn"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKSinaWeiboAuthType SSDKAuthTypeBoth
#endif


#pragma mark - QQ平台的配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>mqq</string>
     <string>mqqapi</string>
     <string>mqqwpa</string>
     <string>mqqbrowser</string>
     <string>mttbrowser</string>
     <string>mqqOpensdkSSoLogin</string>
     <string>mqqopensdkapiV2</string>
     <string>mqqopensdkapiV3</string>
     <string>mqqopensdkapiV4</string>
     <string>wtloginmqq2</string>
     <string>mqzone</string>
     <string>mqzoneopensdk</string>
     <string>mqzoneopensdkapi</string>
     <string>mqzoneopensdkapi19</string>
     <string>mqzoneopensdkapiV2</string>
     <string>mqqapiwallet</string>
     <string>mqqopensdkfriend</string>
     <string>mqqopensdkdataline</string>
     <string>mqqgamebindinggroup</string>
     <string>mqqopensdkgrouptribeshare</string>
     <string>tencentapi.qq.reqContent</string>
     <string>tencentapi.qzone.reqContent</string>
     <string>tim</string>
     <string>timapi</string>
     <string>timopensdkfriend</string>
     <string>timwpa</string>
     <string>timgamebindinggroup</string>
     <string>timapiwallet</string>
     <string>timOpensdkSSoLogin</string>
     <string>wtlogintim</string>
     <string>timopensdkgrouptribeshare</string>
     <string>timopensdkapiV4</string>
     <string>timgamebindinggroup</string>
     <string>timopensdkdataline</string>
     <string>wtlogintimV1</string>
     <string>timapiV1</string>
     
     info.plist 中需要设置 URL Schemes
     规则 tencent+AppKey 例：tencent100371282
     
     授权：客户端SSO 未安装客户端则会使用应用内web
     
     分享：仅客户端 QQ好友 文字 图片 链接 音乐链接 视频链接
     QQ空间 文字 图片 链接 相册视频
     
     分享详例：MOBQQViewController MOBQZoneViewController
 
     开放平台地址： http://open.qq.com
*/
#if (defined IMPORT_SUB_QQFriend) || (defined IMPORT_SUB_QZone)
    //AppID
    #define MOBSSDKQQAppID @"100371282"
    //AppKey
    #define MOBSSDKQQAppKey @"aed9b0303e3ed1e27bae87c33761161d"
    //AuthType
    #define MOBSSDKQQAuthType SSDKAuthTypeBoth
    //useTIM 是否优先使用TIM客户端
    #define MOBSSDKQQUseTIM NO
    //是否默认返回 UnionID v4.0.2增加
    #define MOBSSDKQQBackUnionID NO
#endif



#pragma mark - 微信平台的配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>weixin</string>
     
     info.plist 中需要设置 URL Schemes
     规则 appID 例：wx4868b35061f87885
     
     Other Linker Flags 需设置 -ObjC
     
     授权：客户端SSO 未安装客户端则会使用应用内web
     
     分享：仅客户端 微信好友 文字 图片 链接 音乐链接 视频链接 应用消息 表情 文件[本地视频] 小程序
     微信朋友圈 文字 图片 链接 音乐链接 视频链接
     微信收藏 文字 图片 链接 音乐链接 视频链接 文件[本地视频]
     
     分享详例：MOBWechatcontactsViewController MOBWechatmomentsViewController MOBWechatfavoritesViewController
 
     开放平台地址： https://open.weixin.qq.com
*/
#if (defined IMPORT_SUB_WechatSession) || (defined IMPORT_SUB_WechatTimeline) || (defined IMPORT_SUB_WechatFav)
    //AppID
    #define MOBSSDKWeChatAppID @"wx4868b35061f87885"
    //AppSecret
    #define MOBSSDKWeChatAppSecret @"64020361b8ec4c99936c0e3999a9f249"
    //是否默认返回 UnionID v4.0.2增加
    #define MOBSSDKWeChatBackUnionID NO
// 如需测试小程序 需要修改 bundleID 为  com.tencent.wc.xin.SDKSample
// MOBSSDKWeChatAppID @"wxd930ea5d5a258f4f"
#endif


#pragma mark - 支付宝的配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>alipay</string>
     <string>alipayshare</string>
     
     info.plist 中需要设置 URL Schemes
     规则 ap+APPID 例：ap2015072400185895
     注意 设置 URL Scheme的 URL identifier 必须是alipayShare
     
     授权：暂无
     
     分享：仅客户端 支付宝好友 文字 图片 链接
     支付宝朋友圈 图片 链接
     
     分享详例：MOBAlipayViewController MOBAlipaymomentsViewController
 
     开放平台地址： https://open.alipay.com
 */
#if (defined IMPORT_AliPaySocial) || (defined IMPORT_AliPaySocialTimeline)
    //AppID
    #define MOBSSDKAliPayAppID @"2017062107540437"
#endif


#pragma mark - 美拍平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>mtmv</string>
     <string>mpsharesdk10</string>
     <string>mpsharesdk11</string>
     
     info.plist 中需要设置 URL Schemes
     规则 mp+APPID 例：mp1089867596
     
     info.plist 中需要设置 相册权限
     <key>NSPhotoLibraryUsageDescription</key>
     <string>从手机相册中选择</string>
     
     授权：无
     
     分享：仅客户端 本地图片 相册图片 本地视频 相册视频
     
     分享详例：MOBMeipaiViewController
 
     开放平台地址： http://open.meipai.com
 */
#ifdef IMPORT_MeiPai
    //AppKey
    #define MOBSSDKMeiPaiAppKey @"1089867639"
#endif


#pragma mark - 钉钉平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>dingtalk</string>
     <string>dingtalk-open</string>
     
     info.plist 中需要设置 URL Schemes
     规则 APPID 例：dingoak5hqhuvmpfhpnjvt
     
     授权：无
     
     分享：仅客户端 文字 图片 链接
     
     分享详例：MOBDingTalkViewController
 
     开放平台地址： https://open.dingtalk.com
*/
#ifdef IMPORT_DingTalk
    //AppId
    #define MOBSSDKDingTalkAppId @"dingoabcwtuab76wy0kyzo"
#endif

#pragma mark - 腾讯微博配置信息
/*
     授权：应用内web
     
     分享：应用内 文字 图片
     
     分享详例：MOBTencentWeiboViewController
 */
#ifdef IMPORT_TencentWeibo
    //AppKey
    #define MOBSSDKTencentWeiboAppKey @"801307650"
    //AppSecret
    #define MOBSSDKTencentWeiboAppSecret @"ae36f4ee3946e1cbb98d6965b0b2ff5c"
    //RedirectUri
    #define MOBSSDKTencentWeiboRedirectUri @"http://www.sharesdk.cn"
#endif

#pragma mark - 豆瓣配置信息
/*
 授权：应用内web
 
 分享：应用内 文字 图片
 
 分享详例：MOBDoubanViewController
 */
#ifdef IMPORT_DouBan
    //AppKey
    #define MOBSSDKDouBanApiKey @"02e2cbe5ca06de5908a863b15e149b0b"
    //AppSecret
    #define MOBSSDKDouBanSecret @"9f1e7b4f71304f2f"
    //RedirectUri
    #define MOBSSDKDouBanRedirectUri @"http://www.sharesdk.cn"
#endif


#pragma mark - 印象笔记 Evernote[海外版] 平台配置信息
/*
     授权：应用内web
     
     分享：仅客户端 文字 图片 视频
     
     分享详例：MOBYinxiangViewController MOBEvernoteViewController
     
     注意 印象笔记 正式环境 分为 国内版本 海外版 数据不能互通 ConsumerKey也不能通用
     测试环境即Sandbox 两个版本公用
     
     ConsumerKey 申请地址
     国内版 https://dev.yinxiang.com
     
     国际版 https://dev.evernote.com
*/
#if (defined IMPORT_YinXiang) || (defined IMPORT_Evernote)
    //ConsumerKey
    #define MOBSSDKEvernoteConsumerKey @"46131514-6903"
    //ConsumerSecret
    #define MOBSSDKEvernoteConsumerSecret @"08d7a6f3afcc888a"
    //Sandbox
    #define MOBSSDKEvernoteSandbox YES
#endif

#pragma mark - 有道云笔记 平台配置信息
/*
     授权：应用内web
     
     分享：应用内 文字 图文
     
     分享详例：MOBYouDaoNotesViewController
 
     开放平台地址： http://note.youdao.com/open
*/
#ifdef IMPORT_YouDaoNote
    //ConsumerKey
    #define MOBSSDKYouDaoNoteConsumerKey @"dcde25dca105bcc36884ed4534dab940"
    //ConsumerSecret
    #define MOBSSDKYouDaoNoteConsumerSecret @"d98217b4020e7f1874263795f44838fe"
    //OauthCallback
    #define MOBSSDKYouDaoNoteOauthCallback @"http://www.sharesdk.cn/"
#endif

#pragma mark - 明道 平台配置信息
/*
     授权：应用内web

     分享：链接
     
     分享详例：MOBMingdaoViewController
 
     开放平台地址： https://open.mingdao.com
 */
#ifdef IMPORT_Mingdao
    //AppKey
    #define MOBSSDKMingdaoAppKey @"97230F25CA5C"
    //AppSecret
    #define MOBSSDKMingdaoAppSecret @"A5DC29AF7C5A5851F28E903AE9EAC0"
    //RedirectUri
    #define MOBSSDKMingdaoRedirectUri @"http://mob.com"
#endif


#pragma mark - 开心网 平台配置信息
/*
     授权：应用内web
     
     分享：应用内 文字 图片[文字]
     
     分享详例：MOBKaixinViewController
 
     开放平台地址： http://open.kaixin001.com
 */
#ifdef IMPORT_Kaixin
    //ApiKey
    #define MOBSSDKKaiXinApiKey @"358443394194887cee81ff5890870c7c"
    //SecretKey
    #define MOBSSDKKaiXinSecretKey @"da32179d859c016169f66d90b6db2a23"
    //RedirectUri
    #define MOBSSDKKaiXinRedirectUri @"http://www.sharesdk.cn/"
#endif


#pragma mark - 人人网 平台配置信息
/*
     授权：应用内web
     
     分享：链接
     
     分享详例：MOBRenrenViewController
 
     开放平台地址： http://dev.renren.com
 */
#ifdef IMPORT_Renren
    //appId
    #define MOBSSDKRenrenAppId @"226427"
    //appKey
    #define MOBSSDKRenrenAppKey @"fc5b8aed373c4c27a05b712acba0f8c3"
    //secretKey
    #define MOBSSDKRenrenSecretKey @"f29df781abdd4f49beca5a2194676ca4"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKRenrenAuthType SSDKAuthTypeBoth
#endif

#pragma mark - 易信平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>yixin</string>
     <string>yixinopenapi</string>
     <string>yixinoauth</string>
     <string>yixinfav</string>
 
     info.plist 中需要设置 URL Schemes
     规则 appID 例：yx0d9a9f9088ea44d78680f3274da1765f
     
     授权：客户端SSO 应用内web
     
     分享：客户端 易信好友 文字 图片 链接 音乐链接 视频链接 应用消息
                微信朋友圈 文字 图片 链接 音乐链接 视频链接 应用消息
                微信收藏 文字 图片 链接 音乐链接 视频链接 应用消息
 
    分享详例：MOBYixincontactsViewController MOBYixinmomentsViewController MOBYixinfavoritesViewController
 
    开放平台地址：http://open.yixin.im
 */
#if (defined IMPORT_SUB_YiXinSession) || (defined IMPORT_SUB_YiXinTimeline) || (defined IMPORT_SUB_YiXinFav)
    //AppId
    #define MOBSSDKYiXinAppId @"yx0d9a9f9088ea44d78680f3274da1765f"
    //AppSecret
    #define MOBSSDKYiXinAppSecret @"1a5bd421ae089c3"
    //RedirectUri
    #define MOBSSDKYiXinRedirectUri @"https://open.yixin.im/resource/oauth2_callback.html"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKYiXinAuthType SSDKAuthTypeBoth
#endif



#pragma mark - Facebook平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>fbauth</string>
     <string>fbauth2</string>
     
     info.plist 中需要设置 URL Schemes
     规则 fb+APPID 例：fb107704292745179
     
     授权：应用内web 客户端SSO
     
     可以通过以下方法进行权限设置
     - (void)SSDKSetAuthSettings:(NSArray *)authSettings
     
     分享：应用内 文字 图片[文字] 视频 链接 应用邀请
          注：其中 文字 图片 视频 需要使用 publish_action权限 需要进行facebook审核
             链接 不需要publish_action权限 不需要审核
             应用邀请功能目前支持在web分享邀请：链接申请地址（https://developers.facebook.com/quickstarts/?platform=app-links-host）
 
         客户端 图片[可多张] 链接 相册视频
         注：分享链接 时 图片必须为网络图片
     
     分享详例：MOBFacebookViewController
 
     开放平台地址： https://developers.facebook.com
*/
#ifdef IMPORT_Facebook
    //AppID
    #define MOBSSDKFacebookAppID @"1412473428822331"
    //AppSecret
    #define MOBSSDKFacebookAppSecret @"a42f4f3f867dc947b9ed6020c2e93558"
    //displayName facebook客户端分享必须
    #define MOBSSDKFacebookDisplayName @"shareSDK"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKFacebookAuthType SSDKAuthTypeBoth
#endif

#pragma mark - FacebookMessager平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>fb-messenger-platform-20150714</string>
     <string>fb-messenger</string>
 
     info.plist 中需要设置 URL Schemes
     规则 fb+APPID 例：fb107704292745179
 
     info.plist 中设置 FacebookAppID
     <key>FacebookAppID</key>
     <string>107704292745179</string>
     
     授权：无
     
     分享：仅客户端 图片 GIF 本地视频 本地音频 链接 多图 相册视频
     注：分享链接 时 图片必须为网络图片
     
     分享详例：MOBMessengerViewController
*/

#pragma mark - Instagram平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>instagram</string>
 
     info.plist 中需要设置 相册权限
     <key>NSPhotoLibraryUsageDescription</key>
     <string>从手机相册中选择</string>
     
     授权：应用内web
     
     分享：仅客户端 图片 视频[本地 或 相册视频]
     
     分享详例：MOBInstagramViewController
 
     开放平台地址： https://www.instagram.com/developer
 */
#ifdef IMPORT_Instagram
    //ClientID
    #define MOBSSDKInstagramClientID @"ff68e3216b4f4f989121aa1c2962d058"
    //ClientSecret
    #define MOBSSDKInstagramClientSecret @"1b2e82f110264869b3505c3fe34e31a1"
    //redirectUri
    #define MOBSSDKInstagramRedirectUri @"http://sharesdk.cn"
#endif


#pragma mark - Twitter平台配置信息
/*
     授权：应用内web
     
     分享：仅应用内 文字 文字+图片 文字+视频
     
     分享详例：MOBTwitterViewController
 
     开放平台地址： https://dev.twitter.com
 */
#ifdef IMPORT_Twitter
    //ConsumerKey
    #define MOBSSDKTwitterConsumerKey @"LRBM0H75rWrU9gNHvlEAA2aOy"
    //ConsumerSecret
    #define MOBSSDKTwitterConsumerSecret @"gbeWsZvA9ELJSdoBzJ5oLKX0TU09UOwrzdGfo9Tg7DjyGuMe8G"
    //RedirectUri
    #define MOBSSDKTwitterRedirectUri @"http://mob.com"
#endif

#pragma mark - Line平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>lineauth</string>
     <string>line</string>
     <string>line3rdp.$(PRODUCT_BUNDLE_IDENTIFIER)</string>
 
     info.plist 中需要设置 URL Schemes
     需要与line后台设置的保持一致
     一般为 line3rdp.$(PRODUCT_BUNDLE_IDENTIFIER)
     
     info.plist中配置 LineSDKConfig ChannelID
     <key>LineSDKConfig</key>
     <dict>
     <key>ChannelID</key>
     <string>1502330683</string>
     </dict>
     
     授权：客户端SSO 应用内web
     
     分享：仅客户端 文字 图片
     
     分享详例：MOBLineViewController
 
     开放平台地址： https://developers.line.me
*/
#ifdef IMPORT_Line
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKLineAuthType SSDKAuthTypeBoth
#endif


#pragma mark - GooglePlus平台配置信息
/*
     授权：应用内web
     
     分享：应用内 文字 链接
     
     分享详例：MOBGoogleViewController
 
     开放平台地址： https://console.developers.google.com
*/
#ifdef IMPORT_GooglePlus
    //ClientID
    #define MOBSSDKGooglePlusClientID @"232554794995.apps.googleusercontent.com"
    //ClientSecret
    #define MOBSSDKGooglePlusClientSecret @"PEdFgtrMw97aCvf0joQj7EMk"
    //RedirectUri
    #define MOBSSDKGooglePlusRedirectUri @"http://localhost"
#endif


#pragma mark - WhatsApp平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>whatsapp</string>
     
     授权：无
     
     分享：客户端 文字 图片 本地音频 本地视频
     
     分享详例：MOBWhatsAppViewController
*/


#pragma mark - KaKao平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>kakaokompassauth</string>
     <string>storykompassauth</string>
     <string>kakaolink</string>
     <string>storylink</string>
     <string>kakao+appid</string> 例：<string>kakao48d3f524e4a636b08d81b3ceb50f1003</string>
 
     info.plist 中需要设置 URL Schemes
     规则 kakao+APPID 例：kakao48d3f524e4a636b08d81b3ceb50f1003
 
     info.plist 中需要设置 KAKAO_APP_KEY
     <key>KAKAO_APP_KEY</key>
     <string>48d3f524e4a636b08d81b3ceb50f1003</string>
     
     授权：客户端SSO 应用内web
     
     分享：KakaoTalk   客户端 文字 图片 链接 App
          KakaoStory  客户端 文字
                   应用内web 文字 图片 链接
     注：KakaoTalk 分享的图片必须是网络图片
     
     分享详例：MOBKakaoTalkViewController MOBKakaoStoryViewController
     
     开放平台地址： https://developers.kakao.com
 */
#if (defined IMPORT_SUB_KakaoTalk) || (defined IMPORT_SUB_KakaoStory)
    //appKey
    #define MOBSSDKKaKaoAppKey @"9c17eb03317e0e627ec95a400f5785fb"
    //restApiKey
    #define MOBSSDKKaKaoRestApiKey @"802e551a5048c3172fc1dedaaf40fcf1"
    //redirectUri
    #define MOBSSDKKaKaoRedirectUri @"http://www.mob.com/oauth"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKKaKaoAuthType SSDKAuthTypeBoth
#endif

#pragma mark - YouTube平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>youtube</string>
     
     info.plist 中需要设置 相册权限
     <key>NSPhotoLibraryUsageDescription</key>
     <string>从手机相册中选择</string>
     
     授权：应用内web
     
     分享：应用内 视频
     
     分享详例：MOBYouTubeViewController
    
     开放平台地址： https://console.developers.google.com
*/
#ifdef IMPORT_YouTube
    //ClientId
    #define MOBSSDKYouTubeClientId @"906418427202-jinnbqal1niq4s8isbg2ofsqc5ddkcgr.apps.googleusercontent.com"
    //ClientSecret
    #define MOBSSDKYouTubeClientSecret @""
    //RedirectUri
    #define MOBSSDKYouTubeRedirectUri @"http://localhost"
#endif

#pragma mark - Flickr平台配置信息
/*
     授权：应用内web
     
     分享：应用内 图片
 
     分享详例：MOBFlickrViewController
     
     开放平台地址： http://www.flickr.com/services/
 */
#ifdef IMPORT_Flickr
    //appKey
    #define MOBSSDKFlickrApiKey @"cbed81d4a1bc7417693ab7865e354717"
    //appSecret
    #define MOBSSDKFlickrApiSecret @"4c490343869091f2"
#endif

#pragma mark - Dropbox平台配置信息
/*
     授权：应用内web
     
     分享：应用内 图片 文件
     
     分享详例：MOBDropboxViewController
 
     开放平台地址： https://www.dropbox.com/developers
 */
#ifdef IMPORT_Dropbox
    //appKey
    #define MOBSSDKDropboxAppKey @"us514wslpfojbxc"
    //appSecret
    #define MOBSSDKDropboxAppSecret @"w0nmp4os3ngo1ja"
    //oauthCallback
    #define MOBSSDKDropboxOauthCallback @"http://localhost"
#endif


#pragma mark - Pinterest平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>pinterestsdk.v1</string>
 
     info.plist 中需要设置 URL Schemes
     规则 pdk+ClientId 例：pdk4869186880492553915
 
     授权：客户端SSO 应用内web
     
     分享：应用内 图片
     
     分享详例：MOBPinterestViewController
     
     开放平台地址： https://developers.pinterest.com
 */
#ifdef IMPORT_Pinterest
    //ClientId
    #define MOBSSDKPinterestClientId @"4869186880492553915"
#endif

#pragma mark - Pocket平台配置信息
/*
     info.plist 中需要设置 白名单 LSApplicationQueriesSchemes
     <string>pocket-oauth-v1</string>
    
     授权：客户端SSO 应用内web
     
     分享：应用内 链接
     
     分享详例：MOBPocketViewController
 
     开放平台地址： https://getpocket.com/publisher
 */
#ifdef IMPORT_Pocket
    //ConsumerKey
    #define MOBSSDKPocketConsumerKey @"11496-de7c8c5eb25b2c9fcdc2b627"
    //RedirectUri
    #define MOBSSDKPocketRedirectUri @"pocketapp1234"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKPocketAuthType SSDKAuthTypeBoth
#endif


#pragma mark - LinkedIn平台配置信息
/*
     授权：应用内web
     
     分享：应用内 Text 链接
     
     分享详例：MOBLinkedInViewController
 
     开放平台地址： https://www.linkedin.com/secure/developer
 */
#ifdef IMPORT_LinkedIn
    //ApiKey
    #define MOBSSDKLinkedInApiKey @"46kic3zr7s4n"
    //SecretKey
    #define MOBSSDKLinkedInSecretKey @"RWw6WRl9YJOcdWsj"
    //RedirectUrl
    #define MOBSSDKLinkedInRedirectUrl @"http://baidu.com"
#endif

#pragma mark - VKontakte平台配置信息
/*
     info.plist 中需要设置 URL Schemes
     规则 vk+ApplicationId 例：vk5312801
 
     授权：应用内web
     
     分享：应用内 文字 链接
     
     分享详例：MOBVKontakteViewController

     开放平台地址： https://vk.com/dev
 */
#ifdef IMPORT_VKontakte
    //ApplicationId
    #define MOBSSDKVKontakteApplicationId @"5312801"
    //SecretKey
    #define MOBSSDKVKontakteSecretKey @"ZHG2wGymmNUCRLG2r6CY"
    //AuthType 授权优先类型 web sso both
    #define MOBSSDKVKontakteAuthType SSDKAuthTypeBoth
#endif

#pragma mark - Instapaper平台配置信息
/*
     授权：应用内web
     
     分享：应用内 链接
     
     分享详例：MOBInstapaperViewController
 
     开放平台地址： https://vk.com/dev
 */
#ifdef IMPORT_Instapaper
    //ConsumerKey
    #define MOBSSDKInstapaperConsumerKey @"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
    //ConsumerSecret
    #define MOBSSDKInstapaperConsumerSecret @"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"
#endif

#pragma mark - Tumblr平台配置信息
/*
 info.plist 中需要设置 URL Schemes
 规则 tb+ConsumerKey 例：tb2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM
 
 授权：web
 
 分享：应用内 文字 图片
 
 分享详例：MOBTumblrViewController
 
 开放平台地址： https://www.tumblr.com/developers
 */
#ifdef IMPORT_Tumblr
    //ConsumerKey
    #define MOBSSDKTumblrConsumerKey @"2QUXqO9fcgGdtGG1FcvML6ZunIQzAEL8xY6hIaxdJnDti2DYwM"
    //ConsumerSecret
    #define MOBSSDKTumblrConsumerSecret @"3Rt0sPFj7u2g39mEVB3IBpOzKnM3JnTtxX2bao2JKk4VV1gtNo"
    //CallbackUrl
    #define MOBSSDKTumblrCallbackUrl @"http://sharesdk.cn"
#endif

#pragma mark - SMS平台配置信息
/*
    分享详例：MOBSMSViewController
*/
#ifdef IMPORT_SMS
    #define MOBSSDKSMSOpenCountryList NO
#endif

#pragma mark - Mail平台配置信息
/*
    分享详例：MOBMailViewController
*/

#pragma mark - Copy平台配置信息
/*
    分享详例：MOBCopyViewController
*/

#pragma mark - Print平台配置信息
/*
    分享详例：MOBPrintViewController
*/

@interface MOBShareSDKHelper : NSObject
{
    
}
+ (MOBShareSDKHelper *)shareInstance;
//保存选择的平台 可用于UI排序
@property (nonatomic,strong)NSArray *platforems;
@end
