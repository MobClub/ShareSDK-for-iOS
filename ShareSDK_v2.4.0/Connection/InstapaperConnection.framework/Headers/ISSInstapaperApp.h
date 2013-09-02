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
#import "ISSInstapaperAuthSession.h"
#import "SSInstapaperUser.h"
#import "SSInstapaperErrorInfo.h"
#import "SSInstapaperBookmark.h"

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSInstapaperRequestMethodGet = 0, /**< GET方式 */
	SSInstapaperRequestMethodPost = 1, /**< POST方式 */
	SSInstapaperRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSInstapaperRequestMethod;

/**
 *	@brief	Instapaper应用
 */
@protocol ISSInstapaperApp <ISSCOpenApp>

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
 *	@return	授权视图，此视图是用于让用户进行登录,如果返回nil则表示使用SSO登录
 */
- (id<ISSInstapaperAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSInstapaperUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSInstapaperUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSInstapaperUser *)getUser:(long long)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSInstapaperUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSInstapaperUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSInstapaperErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSInstapaperCredential *)credential;

/**
 *	@brief	以GET方式调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSInstapaperRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(SSInstapaperUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSInstapaperErrorInfo *error))fault;

/**
 *	@brief	显示授权用户信息
 *
 *  @param  result  返回回调
 */
- (void)showMe:(void(^)(BOOL result, SSInstapaperUser *userInfo, SSInstapaperErrorInfo *error))result;

/**
 *	@brief	添加书签
 *
 *	@param 	url 	URL地址
 *	@param 	title 	标题
 *	@param 	description 	描述
 *	@param 	folderId 	文件夹ID
 *	@param 	resolveFinalUrl 	解决最终URL问题标识，默认开启，用于解决跳转页面问题，设置为NO则表示不进行跳转
 *	@param 	isPrivateFromSource 	私有源标签
 *	@param 	content 	对应于URL指定的完整内容，允许带HTML标识，用于在Instapaper无法爬取服务器内容时显示。
 *  @param  result      返回回调
 */
- (void)addBookmark:(NSString *)url
              title:(NSString *)title
        description:(NSString *)description
           folderId:(NSInteger)folderId
    resolveFinalUrl:(NSInteger)resolveFinalUrl
isPrivateFromSource:(NSString *)isPrivateFromSource
            content:(NSString *)content
             result:(void(^)(SSCShareSessionState state, SSInstapaperBookmark *bookmark, SSInstapaperErrorInfo *error))result;


@end
