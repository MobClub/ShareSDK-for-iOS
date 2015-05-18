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
#import "SSRenRenUser.h"
#import "SSRenRenErrorInfo.h"
#import "SSRenRenPost.h"
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
	SSRenRenRequestMethodGet = 0, /**< GET方式 */
	SSRenRenRequestMethodPost = 1, /**< POST方式 */
	SSRenRenRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSRenRenRequestMethod;

///#begin zh-cn
/**
 *	@brief	人人网应用协议
 */
///#end
///#begin en
/**
 *	@brief	RenRen App
 */
///#end
@protocol ISSRenRenApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
///#end
///#begin en
/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
///#end
- (NSString *)appId;

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
///#end
- (NSString *)appKey;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get app secret.
 *
 *	@return	App secret.
 */
///#end
- (NSString *)appSecret;

///#begin zh-cn
/**
 *	@brief	获取SSO回调地址
 *
 *	@return	SSO回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get SSO callback URL.
 *
 *	@return	SSO callback URL.
 */
///#end
- (NSString *)ssoCallbackUrl;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	方法
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
     method:(SSRenRenRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	上传照片
 *
 *	@param 	file 	文件
 *	@param 	description 	照片描述。不能超过200个字符
 *	@param 	albumId 	相册ID,albumId省略时会上传到应用相册
 */
///#end
///#begin en
/**
 *	@brief	Upload image
 *
 *	@param 	file 	File attachment.
 *	@param 	description 	image description。Can not exceed 200 characters
 *	@param 	albumId 	Album ID, albumId omitted when the meeting reached the application album
 */
///#end
- (void)uploadPhoto:(id<ISSCAttachment>)file
        description:(NSString *)description
            albumId:(NSNumber *)albumId
             result:(void(^)(BOOL result, id photo, CMErrorInfo *error))result;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Publish feed.
 *
 *	@param 	name 	Title. Up to 30 characters
 *	@param 	description 	New to main content。 Note: Up to 200 characters.
 *	@param 	url 	新鲜事标题和图片指向的链接。
 *	@param 	message 	用户输入的自定义内容。注意：最多200个字符。
 *	@param 	image 	新鲜事图片地址
 *	@param 	caption 	新鲜事副标题 注意：最多20个字符
 */
///#end
- (void)publishFeedWithName:(NSString *)name
                description:(NSString *)description
                        url:(NSString *)url
                    message:(NSString *)message
                      image:(NSString *)image
                    caption:(NSString *)caption
                     result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享外部资源
 *
 *	@param 	comment 	分享时用户的评论，评论字数不能超过500个字
 *	@param 	url 	分享资源的url。
 */
///#end
///#begin en
/**
 *	@brief	Share feed.
 *
 *	@param 	Comment 	Comment. Up to 500 characters
 *	@param 	url 	分享资源的url
 */
///#end
- (void)shareFeedWithComment:(NSString *)comment
                       image:(NSString *)image
                         url:(NSString *)url
                      result:(SSShareResultEvent)result;
@end
