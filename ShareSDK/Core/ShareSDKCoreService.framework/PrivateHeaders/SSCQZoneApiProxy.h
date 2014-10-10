
//
//  QZoneApiProxy.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-8-6.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	QQ空间API代理
 */
@interface SSCQZoneApiProxy : NSObject
{
@private
    id _apiObject;          //QQ空间接口对象
    id _apiDelegate;        //QQ空间接口委托
}

/**
 *	@brief	接口委托
 */
@property (nonatomic, assign) id apiDelegate;


/**
 *	@brief	根据AppID初始化
 *
 *	@param 	appId 	应用ID
 *
 *	@return	代理对象
 */
- (id)initWithAppId:(NSString *)appId;

/**
 *	@brief	授权
 *
 *	@param 	scopes 	权限列表
 */
- (BOOL)authorize:(NSArray *)scopes;

/**
 *	@brief	QZone定向分享，可以@到具体好友，完成后将触发responseDidReceived:forMessage:回调，message：“SendStory”
 *
 *	@param 	params 	参数字典
 *	@param 	fopenIdArray 	第三方应用预传人好友列表，好友以openid标识
 *
 *	@return	处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
 */
- (BOOL)sendStory:(NSMutableDictionary *)params friendList:(NSArray *)fopenIdArray;

/**
 *	@brief	分享到QZone
 *
 *	@param 	params 	参数字典,字典的关键字参见TencentOAuthObject.h中的\ref TCAddShareDic
 *
 *	@return	处理结果，YES表示API调用成功，NO表示API调用失败，登录态失败，重新登录
 */
- (BOOL)addShareWithParams:(NSMutableDictionary *)params;

/**
 *	@brief	获取AccessToken
 *
 *	@return	AccessToken
 */
- (NSString *)accessToken;

/**
 *	@brief	设置AccessToken
 *
 *	@param 	accessToken 	AccessToken
 */
- (void)setAccessToken:(NSString *)accessToken;


/**
 *	@brief	获取过期时间
 *
 *	@return	过期时间
 */
- (NSDate *)expirationDate;

/**
 *	@brief	设置过期时间
 *
 *	@param 	date 	过期时间
 */
- (void)setExpirationDate:(NSDate *)date;

/**
 *	@brief	获取用户唯一标识
 *
 *	@return	标识值
 */
- (NSString *)openId;

/**
 *	@brief	设置用户唯一标识
 *
 *	@param 	openId 	标识值
 */
- (void)setOpenId:(NSString *)openId;


@end
