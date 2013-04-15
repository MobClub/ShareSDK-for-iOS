//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AGCommon/CMErrorInfo.h>

/**
 *	@brief	ShareSDK帐号协议接口
 */
@protocol ISSCAccount <NSObject>

/**
 *	@brief	获取应用标识
 *
 *	@return	应用标识
 */
- (NSString *)appKey;

/**
 *	@brief	检测帐号是否过期
 *
 *	@return	YES 过期， NO 尚未过期
 */
- (BOOL)hasExpired;

/**
 *	@brief	检测帐户是否过期
 *
 *	@param 	errorInfo 	错误信息
 *
 *	@return	YES 表示已经过期并自动重新授权， NO 表示尚未过期。
 */
- (BOOL)checkExpired:(CMErrorInfo *)errorInfo;

/**
 *	@brief	获取所有权限角色
 *
 *	@return	角色列表
 */
- (NSArray *)roles;

/**
 *	@brief	检测角色权限
 *
 *	@param 	role 	角色类型
 *
 *	@return	YES 表示拥有此角色， NO 表示没有此角色权限
 */
- (BOOL)checkRole:(Class)role;

/**
 *	@brief	获取缓存路径
 *
 *	@return	缓存路径
 */
- (NSString *)cachePath;

/**
 *	@brief	获取统计设备信息使能状态
 *
 *	@return	统计设备信息使能状态
 */
- (BOOL)statDevEnabled;

/**
 *	@brief	获取统计分享信息使能状态
 *
 *	@return	统计分享信息使能状态
 */
- (BOOL)statShareEnabled;

/**
 *	@brief	获取统计用户信息使能状态
 *
 *	@return	统计用户信息使能状态
 */
- (BOOL)statUserEnabled;

/**
 *	@brief	设置统计设备信息使能状态
 *
 *	@param 	statDevEnabled 	统计设备信息使能状态
 */
- (void)setStatDevEnabled:(BOOL)statDevEnabled;

/**
 *	@brief	设置统计分享信息使能状态
 *
 *	@param 	statDevEnabled 	统计分享信息使能状态
 */
- (void)setStatShareEnabled:(BOOL)statShareEnabled;

/**
 *	@brief	设置统计用户信息使能状态
 *
 *	@param 	statDevEnabled 	统计用户信息使能状态
 */
- (void)setStatUserEnabled:(BOOL)statUserEnabled;

@end
