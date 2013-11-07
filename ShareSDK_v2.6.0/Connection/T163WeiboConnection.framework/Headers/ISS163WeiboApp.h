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
#import "SS163WeiboUser.h"
#import "SS163WeiboErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SS163WeiboRequestMethodGet = 0, /**< GET方式 */
	SS163WeiboRequestMethodPost = 1, /**< POST方式 */
	SS163WeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SS163WeiboRequestMethod;

/**
 *	@brief	网易微博应用协议
 */
@protocol ISS163WeiboApp <ISSPlatformApp>

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)appKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)appSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SS163WeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	发布微博信息
 *
 *	@param 	status 	微博内容
 *  @param  result  返回回调
 */
- (void)updateWithStatus:(NSString *)status
                  result:(SSShareResultEvent)result;

/**
 *	@brief	上传图片
 *
 *	@param 	pic 	图片
 *  @param  result  返回回调
 */
- (void)uploadPic:(id<ISSCAttachment>)pic
           result:(void(^)(BOOL result, NSString *uploadImageUrl, CMErrorInfo *error))result;


@end
