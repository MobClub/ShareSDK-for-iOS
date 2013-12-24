//
//  ISSPlatformApp.h
//  ShareSDK
//
//  Created by vimfung on 13-10-14.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSContent.h"

@protocol ISSPlatform;
@protocol ISSPlatformUser;
@protocol ISSPlatformCredential;
@protocol ISSPlatformShareInfo;
@protocol ISSPlatformShareContentEntity;
@protocol ISSPlatformAuthSession;

/**
 *	@brief	获取用户信息返回事件
 */
typedef void(^SSGetUserInfoResultEvent) (SSResponseState state, id<ISSPlatformUser> user, CMErrorInfo *error);

/**
 *	@brief	添加好友返回事件
 */
typedef void(^SSAddFriendResultEvent) (SSResponseState state, id<ISSPlatformUser> user, CMErrorInfo *error);

/**
 *	@brief	获取好友列表返回事件
 */
typedef void(^SSFriendsResultEvent) (SSResponseState state, NSArray *users, long long curr, long long prev, long long next, BOOL hasNext, NSDictionary *extInfo, id<ICMErrorInfo> error);

/**
 *	@brief	分享返回事件
 */
typedef void(^SSShareResultEvent) (SSResponseState state, id<ISSPlatformShareInfo> status, CMErrorInfo *error);


/**
 *	@brief	平台应用信息协议
 */
@protocol ISSPlatformApp <NSObject>

@required

/**
 *	@brief	获取ShareSDK注册账户信息
 *
 *	@return	ShareSDK注册账户信息
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	获取应用所属平台
 *
 *	@return	平台信息对象
 */
- (id<ISSPlatform>)platform;

/**
 *	@brief	获取应用标识
 *
 *	@return	应用标识
 */
- (NSString *)key;

/**
 *	@brief	获取应用所属平台类型
 *
 *	@return	平台类型
 */
- (ShareType)type;

/**
 *	@brief	获取是否支持一键分享功能标识,如果为YES则表示可以打开内容编辑界面并与其他平台一起进行分享。
 *
 *	@return	YES 表示支持，NO 表示不支持
 */
- (BOOL)isSupportOneKeyShare;

/**
 *	@brief	获取分享时是否需要进行授权，如果为YES则在分享时需要检测用户是否已经授权，尚未授权则需要进行授权。
 *          对于使用客户端进行分享的平台此属性一般返回NO
 *
 *  @param  clientShare 客户端分享标识，为YES表示优先使用客户端进行分享。
 *
 *	@return	YES 表示需要， NO 表示不需要
 */
- (BOOL)isSharingNeedAuthWithClientShare:(BOOL)clientShare;


/**
 *	@brief	获取当前用户
 *
 *	@return	用户信息
 */
- (id<ISSPlatformUser>)currentUser;

/**
 *	@brief	设置当前用户
 *
 *	@param 	currentUser 	用户信息
 */
- (void)setCurrentUser:(id<ISSPlatformUser>)currentUser;

/**
 *	@brief	获取是否转换链接使能状态
 *
 *	@return	使能状态，YES 表示在分享前需要转换链接，NO 表示不转换链接
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	获取SSO授权使能状态
 *
 *	@return	YES 表示允许优先使用SSO进行授权，NO 表示不允许SSO授权
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	设置SSO授权使能状态
 *
 *	@param 	enabled 	YES 表示允许优先使用SSO进行授权，NO 表示不允许SSO授权
 */
- (void)setSsoEnabled:(BOOL)enabled;


/**
 *	@brief	创建授权凭证
 *
 *	@param 	uid 	授权用户标识
 *	@param 	token 	访问令牌，在OAuth中为oauth_token，在OAuth2中为access_token
 *	@param 	secret 	访问令牌密钥，仅用于OAuth授权中，为oauth_token_secret。
 *	@param 	expired 	过期时间，仅用于OAuth2授权中，需要将返回的秒数转换为时间。
 *	@param 	extInfo 	扩展信息。用于存放除上述信息外的其它信息。
 *
 *	@return	授权凭证
 */
- (id<ISSPlatformCredential>)credentialWithUid:(NSString *)uid
                                         token:(NSString *)token
                                        secret:(NSString *)secret
                                       expired:(NSDate *)expired
                                       extInfo:(NSDictionary *)extInfo;

/**
 *	@brief	通过授权凭证来创建用户
 *
 *	@param 	credential 	授权凭证
 *
 *	@return	用户信息对象
 */
- (id<ISSPlatformUser>)userWithCredential:(id<ISSPlatformCredential>)credential;

/**
 *	@brief	通过用户的原始数据来创建用户
 *
 *	@param 	data 	原始数据，与各个平台中的用户结构定义相同
 *
 *	@return	用户信息对象
 */
- (id<ISSPlatformUser>)userWithData:(NSDictionary *)data;


/**
 *	@brief	通过原始数据来创建分享信息
 *
 *	@param 	data 	原始数据，与各个平台中的分享信息结构一致
 *
 *	@return	分享信息对象
 */
- (id<ISSPlatformShareInfo>)shareInfoWithData:(NSDictionary *)data;

/**
 *	@brief	对用户进行授权。
 *
 *	@return	授权会话，返回nil则表示该平台不支持授权功能
 */
- (id<ISSPlatformAuthSession>)authorize;

/**
 *	@brief	注册用户
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(id<ISSPlatformUser>)user;

/**
 *	@brief	注销用户
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(id<ISSPlatformUser>)user;

/**
 *	@brief	获取已注册的用户列表
 *
 *	@return	用户列表数组，其元素为id<ISSPlatformUser>对象
 */
- (NSArray *)registeredUsers;

/**
 *	@brief	获取注册用户
 *
 *	@param 	uid 	用户标识
 *
 *	@return	用户信息
 */
- (id<ISSPlatformUser>)registeredUserForUid:(NSString *)uid;

/**
 *	@brief	检测用户是否需要重新授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示需要重新授权，NO 表示不需要重新授权
 */
- (BOOL)checkNeedReAuth:(id<ICMErrorInfo>)error;

/**
 *	@brief	判断是否为用户级别错误，此级别错误可以显示给操作用户查看
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示是用户级别错误，NO 表示不是。
 */
- (BOOL)isUserError:(id<ICMErrorInfo>)error;

/**
 *	@brief	获取授权用户信息
 *
 *  @param  resultHandler   返回回调处理
 */
- (void)getAuthUserInfo:(SSGetUserInfoResultEvent)resultHandler;

/**
 *	@brief	获取授权用户信息
 *
 *	@param 	uid 	用户标识, 根据用户标识来查找用户信息，参数优先级别最高
 *	@param 	name 	用户名称，根据用户名称来查找用户信息，参数优先级别仅次于用户标识
 *	@param 	url 	用户主页路径，根据用户主页路径查找用户信息，参数优先级别最低
 *  @param  resultHandler   返回回调处理
 */
- (void)getUserInfoWithUid:(NSString *)uid
                    orName:(NSString *)name
                     orUrl:(NSString *)url
             resultHandler:(SSGetUserInfoResultEvent)resultHandler;

/**
 *	@brief	添加好友/关注用户
 *
 *	@param 	uid 	用户标识
 *	@param 	name 	用户名称
 *  @param  url     用户路径(仅用于微信关注)
 *  @param  resultHandler   返回回调处理
 */
- (void)addFriendWithUid:(NSString *)uid
                  orName:(NSString *)name
                   orUrl:(NSString *)url
           resultHandler:(SSAddFriendResultEvent)resultHandler;

/**
 *	@brief	获取好友列表
 *
 *	@param 	cursor 	游标位置
 *	@param 	count 	数量
 *	@param 	resultHandler 	返回回调处理
 */
- (void)friendsWithCursor:(long long)cursor
                  count:(NSInteger)count
          resultHandler:(SSFriendsResultEvent)resultHandler;

/**
 *	@brief	分享内容
 *
 *	@param 	contentEntity 	分享内容实体
 *  @param  clientShare     客户端分享标识，YES 表示使用客户端进行内容分享。否则直接应用内分享。
 *	@param 	resultHandler 	返回回调处理
 */
- (void)shareContent:(id<ISSPlatformShareContentEntity>)contentEntity
         clientShare:(BOOL)clientShare
       resultHandler:(SSShareResultEvent)resultHandler;

/**
 *	@brief	通过一个字典类型来构造一个分享内容实体对象
 *
 *	@param 	dictonary 	字典结构数据
 *
 *	@return	分享内容实体对象
 */
- (id<ISSPlatformShareContentEntity>)shareContentEntityWithDictonary:(NSDictionary *)dictonary;


/**
 *	@brief	将分享内容转换为平台的分享内容实体，在此方法中需要对分享实体中的描述值对象进行转换。
 *
 *	@param 	content 	分享内容
 *
 *	@return	分享内容实体对象
 */
- (id<ISSPlatformShareContentEntity>)convertShareContentEntityByContent:(id<ISSContent>)content;

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

@end
