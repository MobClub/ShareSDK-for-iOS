//
//  ISSLinkedInApp.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSLinkedInUser.h"
#import "SSLinkedInErrorInfo.h"
#import "SSLinkedInCredential.h"
#import "SSLinkedInShare.h"
#import "ISSLinkedInAuthSession.h"

/**
 *	@brief	LinkedIn请求方式
 */
typedef enum
{
	SSLinkedInRequestMethodGet = 0, /**< GET方式 */
	SSLinkedInRequestMethodPost = 1, /**< POST方式 */
	SSLinkedInRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSLinkedInRequestMethod;

@protocol ISSLinkedInApp <ISSCOpenApp>

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
- (NSString *)apiKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)secretKey;

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
- (id<ISSLinkedInAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSLinkedInUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSLinkedInUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSLinkedInUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSLinkedInUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSLinkedInUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSLinkedInErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSLinkedInCredential *)credential;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数,可以为一个ISSCParameters协议对象，也可以为一个NSDictionary对象,为NSDicationary对象时仅在以POST方式提交时有效。
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSLinkedInRequestMethod)method
     params:(id)params
       user:(SSLinkedInUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSLinkedInErrorInfo *error))fault;

/**
 *	@brief	显示默认授权用户信息
 *
 *  @param  result  回调方法
 */
- (void)showMe:(void(^)(BOOL result, SSLinkedInUser *userInfo, SSLinkedInErrorInfo *error))result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	uid 	用户标识
 *  @param  result  回调方法
 */
- (void)showUserWithUid:(NSString *)uid
                 result:(void (^)(BOOL, SSLinkedInUser *, SSLinkedInErrorInfo *))result;

/**
 *	@brief	获取用户信息
 *
 *	@param 	publicProfileUrl 	个人主页地址
 *  @param  result  回调方法
 */
- (void)showUserWithUrl:(NSString *)publicProfileUrl
                 result:(void (^)(BOOL, SSLinkedInUser *, SSLinkedInErrorInfo *))result;

/**
 *	@brief	分享内容
 *
 *	@param 	comment 	对内容的评论
 *	@param 	title 	标题
 *	@param 	description 	内容描述
 *	@param 	url 	内容链接
 *	@param 	image 	内容图片
 *	@param 	visibility 	可见
 *  @param  result  回调方法
 */
- (void)shareWithComment:(NSString *)comment
                   title:(NSString *)title
             description:(NSString *)description
                     url:(NSString *)url
                   image:(NSString *)image
              visibility:(NSString *)visibility
                  result:(void (^)(SSCShareSessionState result, SSLinkedInShare *status, SSLinkedInErrorInfo *error))result;


@end
