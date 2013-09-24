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
#import "ISSTwitterAuthSession.h"
#import "SSTwitterUser.h"
#import "SSTwitterErrorInfo.h"
#import "SSTwitterTweets.h"

/**
 *	@brief	Twitter请求方式
 */
typedef enum
{
	SSTwitterRequestMethodGet = 0, /**< GET方式 */
	SSTwitterRequestMethodPost = 1, /**< POST方式 */
	SSTwitterRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTwitterRequestMethod;

/**
 *	@brief	Twitter应用协议
 */
@protocol ISSTwitterApp <ISSCOpenApp>

/**
 *	@brief	获取授权帐号
 *
 *	@return	授权帐号
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	获取消费者Key
 *
 *	@return	消费者Key
 */
- (NSString *)consumerKey;

/**
 *	@brief	获取消费者密钥
 *
 *	@return	消费者密钥
 */
- (NSString *)consumerSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

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
- (id<ISSTwitterAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSTwitterUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSTwitterUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSTwitterUser *)getUser:(long long)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSTwitterUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSTwitterUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSTwitterErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSTwitterCredential *)credential;

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
     method:(SSTwitterRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(SSTwitterUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSTwitterErrorInfo *error))fault;


/**
 *	@brief	显示默认的授权用户信息
 *
 *  @param  result  返回回调
 */
- (void)showMe:(void(^)(BOOL result, SSTwitterUser *user, SSTwitterErrorInfo *error))result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	uid 	用户ID
 *  @param  result  返回回调
 */
- (void)showUserInfoWithUid:(long long)uid
                     result:(void(^)(BOOL result, SSTwitterUser *user, SSTwitterErrorInfo *error))result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	screenName 	名称
 *  @param  result  返回回调
 */
- (void)showUserInfoWithScreenName:(NSString *)screenName
                            result:(void(^)(BOOL result, SSTwitterUser *user, SSTwitterErrorInfo *error))result;

/**
 *	@brief	更新状态信息
 *
 *	@param 	status 	状态信息
 *  @param  locationCoordinate  地理位置
 *  @param  result  返回回调
 */
- (void)updateWithStatus:(NSString *)status
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(void(^)(SSCShareSessionState state, SSTwitterTweets *tweets, SSTwitterErrorInfo *error))result;

/**
 *	@brief	更新带媒体的状态信息
 *
 *	@param 	status 	状态信息
 *	@param 	media 	媒体信息
 *  @param  locationCoordinate  地理位置
 *  @param  result  返回回调
 */
- (void)updateWithStatus:(NSString *)status
                   media:(id<ISSCAttachment>)media
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(void (^)(SSCShareSessionState state, SSTwitterTweets *tweets, SSTwitterErrorInfo *error))result;

/**
 *	@brief	添加好友
 *
 *	@param 	screenName 	名称
 *  @param  result  返回回调
 */
- (void)addFriendWithScreenName:(NSString *)screenName
                         result:(void (^)(BOOL result, SSTwitterUser *user, SSTwitterErrorInfo *error))result;

/**
 *	@brief	获取好友列表
 *
 *	@param 	cursor 	当前位置
 *  @param  result  返回回调
 */
- (void)friendsWithCursor:(long long)cursor
                   result:(void(^)(BOOL result, NSArray *users, long long previousCursor, long long nextCursor, SSTwitterErrorInfo *error))result;


@end
