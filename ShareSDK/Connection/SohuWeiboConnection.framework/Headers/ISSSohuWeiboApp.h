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
#import "SSSohuWeiboUser.h"
#import "SSSohuWeiboErrorInfo.h"
#import "SSSohuWeiboStatus.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	请求方式
 */
///#end
///#begin en
/**
 *	@brief	Request method.
 */
///#end
typedef enum
{
	SSSohuWeiboRequestMethodGet = 0, /**< GET方式 */
	SSSohuWeiboRequestMethodPost = 1, /**< POST方式 */
	SSSohuWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSSohuWeiboRequestMethod;

///#begin zh-cn
/**
 *	@brief	搜狐微博应用
 */
///#end
///#begin en
/**
 *	@brief	Sohu Weibo App.
 */
///#end
@protocol ISSSohuWeiboApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取消费者Key
 *
 *	@return	消费者Key
 */
///#end
///#begin en
/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
///#end
- (NSString *)consumerKey;

///#begin zh-cn
/**
 *	@brief	获取消费者密钥
 *
 *	@return	消费者密钥
 */
///#end
///#begin en
/**
 *	@brief	Get consumer secret.
 *
 *	@return	Consumer secret.
 */
///#end
- (NSString *)consumerSecret;

///#begin zh-cn
/**
 *	@brief	获取回调地址
 *
 *	@return	回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *  @param  method  请求方法
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
///#end
///#begin en
/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSSohuWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	发布微博信息
 *
 *	@param 	status 	微博内容
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send status.
 *
 *	@param 	status 	Content string.
 *  @param  result  Result handler.
 */
///#end
- (void)updateWithStatus:(NSString *)status
                  result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	发送微博并上传图片。
 *
 *	@param 	status 	微博内容
 *	@param 	pic 	图片
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief  Send status and upload pictures.
 *
 *	@param 	status 	Content string.
 *	@param 	pic 	Image attachment.
 *  @param  result  Result handler.
 */
///#end
- (void)uploadWithStatus:(NSString *)status
                     pic:(id<ISSCAttachment>)pic
                  result:(SSShareResultEvent)result;


@end
