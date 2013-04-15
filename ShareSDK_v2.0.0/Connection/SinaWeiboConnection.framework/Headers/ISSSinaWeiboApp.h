//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSSinaWeiboAuthSession.h"
#import "SSSinaWeiboUser.h"
#import "SSSinaWeiboErrorInfo.h"

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSSinaWeiboRequestMethodGet = 0, /**< GET方式 */
	SSSinaWeiboRequestMethodPost = 1, /**< POST方式 */
	SSSinaWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSSinaWeiboRequestMethod;

/**
 *	@brief	新浪微博应用协议
 */
@protocol ISSSinaWeiboApp <ISSCOpenApp>

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
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	SSO登录使能状态
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	设置SSO登录使能状态
 */
- (void)setSsoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	授权应用
 *
 *	@return	授权会话
 */
- (id<ISSSinaWeiboAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSSinaWeiboUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSSinaWeiboUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSSinaWeiboUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSSinaWeiboUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSSinaWeiboUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSSinaWeiboErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSSinaWeiboCredential *)credential;

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
     method:(SSSinaWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(SSSinaWeiboUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSSinaWeiboErrorInfo *error))fault;

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
 *	@brief	显示默认授权用户信息
 *
 *  @param  result  回调方法
 */
- (void)showMe:(void(^)(BOOL result, SSSinaWeiboUser *userInfo, SSSinaWeiboErrorInfo *error))result;

/**
 *	@brief	根据ID获取用户信息
 *
 *	@param 	uid 	用户ID
 *  @param  result  回调方法
 */
- (void)showUserWithUid:(NSString *)uid
                 result:(void(^)(BOOL result, SSSinaWeiboUser *userInfo, SSSinaWeiboErrorInfo *error))result;


/**
 *	@brief	根据昵称获取用户信息
 *
 *	@param 	screenName 	昵称
 *  @param  result  回调方法
 */
- (void)showUserWithScreenName:(NSString *)screenName
                        result:(void(^)(BOOL result, SSSinaWeiboUser *userInfo, SSSinaWeiboErrorInfo *error))result;

/**
 *	@brief	发布一条新微博
 *
 *	@param 	status 	微博内容
 *  @param  result  回调方法
 */
- (void)updateWithStatus:(NSString *)status
                  result:(void(^)(SSCShareSessionState result, SSSinaWeiboStatus *status, SSSinaWeiboErrorInfo *error))result;

/**
 *	@brief	上传图片并发布一条新微博
 *
 *	@param 	status 	微博内容
 *	@param 	pic 	图片数据
 *  @param  result  回调方法
 */
- (void)uploadWithStatus:(NSString *)status
                     pic:(id<ISSCAttachment>)pic
                  result:(void(^)(SSCShareSessionState result, SSSinaWeiboStatus *status, SSSinaWeiboErrorInfo *error))result;

/**
 *	@brief	获取默认授权用户的关注列表
 *
 *	@param 	cursor 	返回结果的游标，下一页用返回值里的next_cursor，上一页用previous_cursor，默认为0。
 *	@param 	count 	单页返回的记录条数，默认为50，最大不超过200。
 *	@param 	trimStatus 	返回值中user字段中的status字段开关，0：返回完整status字段、1：status字段仅返回status_id，默认为1。
 *  @param  result  回调方法
 */
- (void)myFriendsWithCursor:(NSInteger)cursor
                      count:(NSInteger)count
                 trimStatus:(NSInteger)trimStatus
                     result:(void(^)(BOOL result, NSArray *users, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, SSSinaWeiboErrorInfo *error))result;

/**
 *	@brief	关注某用户
 *
 *	@param 	uid 	用户ID
 *  @param  result  回调方法
 */
- (void)createFriendshipsWithUid:(NSString *)uid
                          result:(void(^)(BOOL result, SSSinaWeiboUser *userInfo, SSSinaWeiboErrorInfo *error))result;

/**
 *	@brief	关注某用户
 *
 *	@param 	screenName 	用户昵称
 *  @param  result  回调方法
 */
- (void)createFriendshipsWithScreenName:(NSString *)screenName
                                 result:(void(^)(BOOL result, SSSinaWeiboUser *userInfo, SSSinaWeiboErrorInfo *error))result;


@end
