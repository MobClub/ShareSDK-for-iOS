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
#import "SSRenRenUser.h"
#import "SSRenRenErrorInfo.h"
#import "SSRenRenPost.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSRenRenRequestMethodGet = 0, /**< GET方式 */
	SSRenRenRequestMethodPost = 1, /**< POST方式 */
	SSRenRenRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSRenRenRequestMethod;

/**
 *	@brief	人人网应用协议
 */
@protocol ISSRenRenApp <ISSPlatformApp>

/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)appId;


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
 *	@brief	获取SSO回调地址
 *
 *	@return	SSO回调地址
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	方法
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSRenRenRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	上传照片
 *
 *	@param 	file 	文件
 *	@param 	description 	照片描述。不能超过200个字符
 *	@param 	albumId 	相册ID,albumId省略时会上传到应用相册
 */
- (void)uploadPhoto:(id<ISSCAttachment>)file
        description:(NSString *)description
            albumId:(NSNumber *)albumId
             result:(void(^)(BOOL result, id photo, CMErrorInfo *error))result;

/**
 *	@brief	发布新鲜事
 *
 *	@param 	name 	标题，最多30个字符
 *	@param 	description 	新鲜事主体内容 注意：最多200个字符。
 *	@param 	url 	新鲜事标题和图片指向的链接。
 *	@param 	message 	用户输入的自定义内容。注意：最多200个字符。
 *	@param 	image 	新鲜事图片地址
 *	@param 	caption 	新鲜事副标题 注意：最多20个字符
 */
- (void)publishFeedWithName:(NSString *)name
                description:(NSString *)description
                        url:(NSString *)url
                    message:(NSString *)message
                      image:(NSString *)image
                    caption:(NSString *)caption
                     result:(SSShareResultEvent)result;

@end
