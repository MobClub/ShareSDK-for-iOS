//
//  ISSGooglePlusApp.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-12.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSGooglePlusUser.h"
#import "SSGooglePlusErrorInfo.h"
#import "SSGooglePlusCredential.h"
#import "SSGooglePlusMoment.h"
#import "SSGooglePlusShareInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSGooglePlusRequestMethodGet = 0, /**< GET方式 */
	SSGooglePlusRequestMethodPost = 1, /**< POST方式 */
	SSGooglePlusRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSGooglePlusRequestMethod;

/**
 *	@brief	Google+应用协议
 */
@protocol ISSGooglePlusApp <ISSPlatformApp>

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)clientId;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)clientSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	获取SSO回调地址列表
 *
 *	@return	回调地址列表
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数，可以为ISSParameter或者NSDictionary，(NSDictionary仅用于POST提交方式）
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSGooglePlusRequestMethod)method
     params:(id)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	分享内容
 *
 *	@param 	url 	链接
 *	@param 	text        分享内容
 *  @param  result  分享返回回调
 */
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
              result:(SSShareResultEvent)result;


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
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
               image:(id<ISSCAttachment>)image
          deepLinkId:(NSString *)deepLinkId
               title:(NSString *)title
         description:(NSString *)description
           thumbnail:(NSString *)thumbnail
              result:(SSShareResultEvent)result;

@end
