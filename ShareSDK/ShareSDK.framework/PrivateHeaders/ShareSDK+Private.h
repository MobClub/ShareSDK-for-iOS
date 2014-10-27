//
//  ShareSDK+Private.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 13-11-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>

@protocol ISSCUserDescriptor;

/**
 *	@brief	ShareSDK私有接口提供
 */
@interface ShareSDK (Private)

/**
 *	@brief	获取设备标识，组成规则：sha1(mac+udid+model)
 *
 *	@return	设备标识
 */
+ (NSString *)deviceKey;

/**
 *	@brief	在官网中申请的应用标识
 *
 *	@return	应用标识
 */
+ (NSString *)appKey;

/**
 *	@brief	获取SDK内部使用版本号，组成规则：SERVER_VER * 10000 + CLIENT_VER
 *
 *	@return	版本号
 */
+ (NSString *)sdkVersion;

/**
 *	@brief	获取平台标识
 *
 *	@return	平台标识
 */
+ (NSString *)plat;

/**
 *	@brief	获取厂商
 *
 *	@return	厂商信息
 */
+ (NSString *)factory;

/**
 *	@brief	获取缓存路径
 *
 *	@return	路径
 */
+ (NSString *)cachePath;

/**
 *	@brief	获取当前时间（经过服务器验证）
 *
 *	@return	当前时间（秒）
 */
+ (NSTimeInterval)currentTimeInterval;

/**
 *	@brief	获取服务器时间
 *
 *	@param 	timeInterval 	客户端时间
 *
 *	@return	服务器时间
 */
+ (NSTimeInterval)serverTimeIntervalWithTimeInterval:(NSTimeInterval)timeInterval;

/**
 *	@brief	统计分享信息
 *
 *  @since  v2.9.1
 *
 *	@param 	shareInfo 	分享信息
 *  @param  userInfo    用户信息
 *	@param 	app         应用信息
 *  @param  targets     目标
 */
+ (void)statShareInfo:(id<ISSPlatformShareInfo>)shareInfo
             userInfo:(id<ISSCUserDescriptor>)userInfo
                  app:(id<ISSPlatformApp>)app
              targets:(NSArray *)targets;

/**
 *	@brief	统计分享失败
 *
 *	@param 	app 	应用信息
 */
+ (void)statShareFail:(id<ISSPlatformApp>)app;

/**
 *	@brief	转换分享信息
 *
 *	@param 	shareInfo 	分享信息
 *  @param  handler     返回处理器
 *
 */
+ (void)convertShareInfo:(id<ISSPlatformShareInfo>)shareInfo
                  result:(void(^)(NSDictionary *info))handler;


@end
