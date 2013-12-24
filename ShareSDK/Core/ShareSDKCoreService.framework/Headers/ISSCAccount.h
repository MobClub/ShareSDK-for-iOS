//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AGCommon/CMErrorInfo.h>
#import "SSCTypeDef.h"

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
 *	@brief	设置统计策略
 *
 *	@param 	policy 	策略
 */
- (void)setStatPolicy:(SSCStatPolicy)policy;

/**
 *	@brief	统计策略
 *
 *	@return	策略
 */
- (SSCStatPolicy)statPolicy;

/**
 *	@brief	设置应用信息托管标识
 *
 *  @since  ver1.0.7
 *
 *	@param 	enabled 	YES 表示使用服务器上的托管信息，否则使用本地代码配置信息
 */
- (void)setUseAppTrusteeship:(BOOL)enabled;

/**
 *	@brief	获取应用信息托管标识
 *
 *  @since  ver1.0.7
 *
 *	@return	YES 表示使用服务器上的托管信息，否则使用本地代码配置信息
 */
- (BOOL)useAppTrusteeship;

/**
 *	@brief	设置SSO使能状态
 *
 *  @since  ver2.1.1
 *
 *	@param 	enabled 	使能状态
 */
- (void)setSsoEnabled:(BOOL)enabled;

/**
 *	@brief	获取SSO使能状态
 *
 *	@since  ver2.1.1
 *
 *	@return	YES 表示开启， NO 表示关闭
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	设置是否转换短链
 *
 *  @since  ver2.1.1
 *
 *	@param 	enabled 	使能状态
 */
- (void)setConvertUrlEnabled:(BOOL)enabled;

/**
 *	@brief	获取是否转换短链状态
 *
 *  @since  ver2.1.1
 *
 *	@return	YES 表示转换，NO 表示不转换
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	设置统计数据使能状态
 *
 *  @since  ver2.1.1
 *
 *  @param  enabled     使能状态
 */
- (void)setStatEnabled:(BOOL)enabled;

/**
 *	@brief	获取统计数据使能状态
 *
 *  @since  ver2.1.1
 *
 *	@return	统计数据使能状态
 */
- (BOOL)statEnabled;

/**
 *	@brief	获取统计设备信息使能状态
 *
 *  @since  ver2.1.1    设置为只读，状态由开发者后台设置
 *
 *	@return	统计设备信息使能状态
 */
- (BOOL)statDevEnabled;

/**
 *	@brief	获取统计分享信息使能状态
 *
 *  @since  ver2.1.1    设置为只读，状态由开发者后台设置
 *
 *	@return	统计分享信息使能状态
 */
- (BOOL)statShareEnabled;

/**
 *	@brief	获取统计用户信息使能状态
 *
 *  @since  ver2.1.1    设置为只读，状态由开发者后台设置
 *
 *	@return	统计用户信息使能状态
 */
- (BOOL)statUserEnabled;

/**
 *	@brief	获取当前时间（经过服务器校正）
 *
 *	@return	当前时间（单位：秒）
 */
- (NSTimeInterval)currentTimeInterval;

/**
 *	@brief	将客户端时间转换成服务器时间
 *
 *	@param 	clientTimeInterval 	客户端时间
 *
 *	@return	服务器时间
 */
- (NSTimeInterval)serverTimeIntervalWithClientTimeInterval:(NSTimeInterval)clientTimeInterval;


/**
 *	@brief	更新平台配置信息
 *
 *  @param  completeHandler     完成事件
 */
- (void)updatePlatSetting:(void(^)(NSArray *settings))completeHandler;

@end
