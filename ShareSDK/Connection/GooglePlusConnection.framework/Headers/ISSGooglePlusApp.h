///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSGooglePlusUser.h"
#import "SSGooglePlusErrorInfo.h"
#import "SSGooglePlusCredential.h"
#import "SSGooglePlusShareInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	Google+应用协议
 */
///#end
///#begin en
/**
 *	@brief	Google+ app protocol
 */
///#end
@protocol ISSGooglePlusApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get client key.
 *
 *	@return	Client key.
 */
///#end
- (NSString *)clientId;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get client secret.
 *
 *	@return	Client secret.
 */
///#end
- (NSString *)clientSecret;

///#begin zh-cn
/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get app redirect url.
 *
 *	@return	Redirect url.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	获取SSO回调地址列表
 *
 *	@return	回调地址列表
 */
///#end
///#begin en
/**
 *	@brief	Get SSO callback URL.
 *
 *	@return	callback URL string.
 */
///#end
- (NSString *)ssoCallbackUrl;

///#begin zh-cn
/**
 *	@brief	分享内容
 *
 *	@param 	url 	链接
 *	@param 	text        分享内容
 *  @param  result  分享返回回调
 */
///#end
///#begin en
/**
 *	@brief	Share content.
 *
 *	@param 	url 	URL string.
 *	@param 	text        Content string.
 *  @param  result  Result handler.
 */
///#end
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
              result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享内容
 *
 *	@param 	url 	链接
 *	@param 	text        分享内容
 *  @param  image   分享图片
 *	@param 	deepLinkId  深链接ID
 *	@param 	title 	深链接标题
 *	@param 	description 	深链接描述
 *	@param 	thumbnail 	深链接缩略图
 *  @param  result  分享返回回调
 */
///#end
///#begin en
/**
 *	@brief	Share content.
 *
 *	@param 	url 	URL string.
 *	@param 	text        Content string.
 *  @param  image   Image attachment object.
 *	@param 	deepLinkId  Deep link id.
 *	@param 	title 	Deep link title.
 *	@param 	description 	Deep link description
 *	@param 	thumbnail 	Deep link thumbnail.
 *  @param  result  Result handler.
 */
///#end
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
               image:(id<ISSCAttachment>)image
          deepLinkId:(NSString *)deepLinkId
               title:(NSString *)title
         description:(NSString *)description
           thumbnail:(NSString *)thumbnail
              result:(SSShareResultEvent)result;

@end
