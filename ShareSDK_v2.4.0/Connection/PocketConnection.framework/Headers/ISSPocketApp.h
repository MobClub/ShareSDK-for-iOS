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
#import "ISSPocketAuthSession.h"
#import "SSPocketUser.h"
#import "SSPocketErrorInfo.h"
#import "SSPocketCredential.h"
#import "SSPocketItem.h"

/**
 *	@brief	Pocket应用协议
 */
@protocol ISSPocketApp <ISSCOpenApp>

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
- (NSString *)consumerKey;

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
- (id<ISSPocketAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSPocketUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSPocketUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSPocketUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSPocketUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSPocketUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSPocketErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSPocketCredential *)credential;

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
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     params:(id<ISSCParameters>)params
       user:(SSPocketUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSPocketErrorInfo *error))fault;

/**
 *	@brief	获取当前授权用户
 *
 *  @param  result  返回回调
 */
- (void)showMe:(void(^)(BOOL result,
                        SSPocketUser *userInfo,
                        SSPocketErrorInfo *error))result;


/**
 *	@brief	添加一个项目
 *
 *	@param 	url 	你要保存的链接
 *	@param 	title 	链接标题，如果指定的url参数链接中无法取得标题，则使用此参数。
 *	@param 	tags 	一个以逗号分享的标签列表
 *	@param 	tweetId 	如果你支持Twitter登录，那么你可以指定一个tweet的ID，时加入的文字中显示原始的tweet内容。
 *  @param  result  返回回调
 */
- (void)addItemWithUrl:(NSString *)url
                 title:(NSString *)title
                  tags:(NSString *)tags
               tweetId:(NSString *)tweetId
                result:(void(^)(SSCShareSessionState state, SSPocketItem *item, SSPocketErrorInfo *error))result;


@end
