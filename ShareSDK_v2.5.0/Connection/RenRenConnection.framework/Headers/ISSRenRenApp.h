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
#import "ISSRenRenAuthSession.h"
#import "SSRenRenUser.h"
#import "SSRenRenErrorInfo.h"
#import "SSRenRenPhoto.h"
#import "SSRenRenPost.h"

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
@protocol ISSRenRenApp <ISSCOpenApp>

/**
 *	@brief	获取授权帐号
 *
 *	@return	授权帐号
 */
- (id<ISSCAccount>)account;

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
 *	@brief	SSO登录使能状态
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	设置SSO登录使能状态
 */
- (void)setSsoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	获取是否转换链接标识
 *
 *	@return	YES 表示转换链接，NO 表示不转换链接
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	设置是否转换链接标识
 *
 *	@param 	enabled 	YES 表示转换链接，NO 表示不转换链接
 */
- (void)setConvertUrlEnabled:(BOOL)enabled;

/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
- (BOOL)handleOpenURL:(NSURL *)url;


/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

/**
 *	@brief	授权应用
 *
 *	@return	授权会话
 */
- (id<ISSRenRenAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSRenRenUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSRenRenUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSRenRenUser *)getUser:(long long)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSRenRenUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSRenRenUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSRenRenErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSRenRenCredential *)credential;

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
       user:(SSRenRenUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSRenRenErrorInfo *error))fault;


/**
 *	@brief	显示授权用户信息
 *
 *	@param 	user 	授权用户,为nil则为默认用户
 *  @param  result  返回回调
 */
- (void)showMe:(void(^)(BOOL result, SSRenRenUser *userInfo, SSRenRenErrorInfo *error))result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	uid 	用户ID
 *  @param  result  返回回调
 */
- (void)getUserInfoWithUid:(long long)uid
                    result:(void(^)(BOOL result, SSRenRenUser *userInfo, SSRenRenErrorInfo *error))result;

/**
 *	@brief	上传照片
 *
 *	@param 	file 	文件
 *	@param 	description 	照片描述。不能超过200个字符
 *	@param 	albumId 	相册ID,albumId省略时会上传到应用相册
 */
- (void)uploadPhoto:(id<ISSCAttachment>)file
        description:(NSString *)description
            albumId:(long)albumId
             result:(void(^)(BOOL result, SSRenRenPhoto *photo, SSRenRenErrorInfo *error))result;

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
                     result:(void(^)(SSCShareSessionState state, SSRenRenPost *post, SSRenRenErrorInfo *error))result;

@end
