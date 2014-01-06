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
#import "ShareSDKTypeDef.h"

@protocol ISSPlatformApp;

/**
 *	@brief	平台协议
 */
@protocol ISSPlatform <NSObject>

@required

/**
 *	@brief	初始化平台
 *
 *	@param 	type 	平台类型
 *
 *	@return	平台对象
 */
- (id)initWithType:(ShareType)type;

/**
 *	@brief	获取平台名称
 *
 *	@return	名称
 */
- (NSString *)name;

/**
 *	@brief	获取平台类型
 *
 *	@return	平台类型
 */
- (ShareType)type;

/**
 *	@brief	获取当前应用
 *
 *	@return	当前应用
 */
- (id<ISSPlatformApp>)currentApp;

/**
 *	@brief	设置当前应用
 *
 *	@param 	app 	当前应用
 */
- (void)setCurrentApp:(id<ISSPlatformApp>)app;

/**
 *	@brief	注册应用
 *
 *	@param 	account     ShareSDK注册账户信息
 *	@param 	appInfo 	应用信息，需要到各个平台中进行注册应用得到
 *
 *	@return	应用对象
 */
- (id<ISSPlatformApp>)registerAppWithAccount:(id<ISSCAccount>)account
                                     appInfo:(NSDictionary *)appInfo;

/**
 *	@brief	注销应用
 *
 *	@param 	app 	应用对象
 *
 */
- (void)unregisterApp:(id<ISSPlatformApp>)app;

/**
 *	@brief	获取已注册应用
 *
 *	@param 	key 	应用Key
 *
 *	@return	应用对象，返回nil则表示应用尚未注册
 */
- (id<ISSPlatformApp>)appForKey:(NSString *)key;

/**
 *	@brief	获取已注册的应用列表
 *
 *	@return	应用列表数组，其元素为id<ISSPlatformApp>对象
 */
- (NSArray *)registeredApps;


@end
