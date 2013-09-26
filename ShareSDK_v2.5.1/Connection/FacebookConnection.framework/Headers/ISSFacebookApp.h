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
#import "ISSFacebookAuthSession.h"
#import "SSFacebookUser.h"
#import "SSFacebookErrorInfo.h"
#import "SSFacebookPost.h"
#import "ISSFacebookAddFriendDialog.h"

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSFacebookRequestMethodGet = 0, /**< GET方式 */
	SSFacebookRequestMethodPost = 1, /**< POST方式 */
	SSFacebookRequestMethodMultipartPost = 2, /**< Multipart POST方式，用于上传文件的api接口 */
    SSFacebookRequestMethodDelete = 3   /**< DELETE方式 */
}
SSFacebookRequestMethod;

/**
 *	@brief	Facebook应用协议
 */
@protocol ISSFacebookApp <ISSCOpenApp>

/**
 *	@brief	获取授权帐号
 *
 *	@return	授权帐号
 */
- (id<ISSCAccount>)account;

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
 *	@brief	授权应用
 *
 *	@return	授权会话
 */
- (id<ISSFacebookAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSFacebookUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSFacebookUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSFacebookUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSFacebookUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSFacebookUser *)defaultUser;

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
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSFacebookErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSFacebookCredential *)credential;

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
     method:(SSFacebookRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(SSFacebookUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSFacebookErrorInfo *error))fault;

/**
 *	@brief	显示默认授权用户信息
 *
 *  @param  result  返回回调
 */
- (void)showMe:(void(^)(BOOL result, SSFacebookUser *user, SSFacebookErrorInfo *error))result;

/**
 *	@brief	获取其他用户信息
 *
 *	@param 	uid 	用户ID
 *  @param  result  返回回调
 */
- (void)getUserInfoWithUid:(NSString *)uid
                    result:(void(^)(BOOL result, SSFacebookUser *user, SSFacebookErrorInfo *error))result;


/**
 *	@brief	发布消息
 *
 *	@param 	message 	消息
 *  @param  result      返回回调
 */
- (void)feedWithMessage:(NSString *)message
                 result:(void(^)(SSCShareSessionState state, SSFacebookPost *post, SSFacebookErrorInfo *error))result;

/**
 *	@brief	发布消息
 *
 *	@param 	message 	消息
 *	@param 	source 	附件图片
 *  @param  result  返回回调
 */
- (void)feedWithMessage:(NSString *)message
                 source:(id<ISSCAttachment>)source
                 result:(void(^)(SSCShareSessionState state, SSFacebookPost *post, SSFacebookErrorInfo *error))result;

/**
 *	@brief	获取文章信息
 *
 *	@param 	postId 	文章ID
 */
- (void)getPostWithId:(NSString *)postId
               result:(void(^)(BOOL result, SSFacebookPost *post, SSFacebookErrorInfo *error))result;


/**
 *	@brief	添加好友
 *
 *	@param 	uid 	用户ID
 *
 *	@return	添加好友对话框对象
 */
- (id<ISSFacebookAddFriendDialog>)addFriendWithUid:(NSString *)uid;

/**
 *	@brief	获取好友列表
 *
 *	@param 	offset 	相对起始位置的偏移量
 *	@param 	limit 	最多获取的数量
 *  @param  result  返回回调
 */
- (void)friendsWithOffset:(NSInteger)offset
                    limit:(NSInteger)limit
                   result:(void(^)(BOOL result, NSArray *users, SSFacebookErrorInfo *error))result;


@end
