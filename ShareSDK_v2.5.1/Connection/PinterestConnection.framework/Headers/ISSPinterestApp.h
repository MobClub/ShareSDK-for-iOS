//
//  ISSPinterestApp.h
//  PinterestConnection
//
//  Created by 冯 鸿杰 on 13-8-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSPinterestErrorInfo.h"

/**
 *	@brief	Pinterest应用协议
 */
@protocol ISSPinterestApp <NSObject>

/**
 *	@brief	登录帐户
 *
 *	@return	帐户信息
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)clientId;

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
 *	@brief	分享内容
 *
 *	@param 	image 	图片，只允许网络图片路径
 *	@param 	url 	网址
 *	@param 	description 	描述
 *  @param  result  回调方法
 */
- (void)createPinWithImage:(id<ISSCAttachment>)image
                       url:(NSString *)url
               description:(NSString *)description
                    result:(void(^)(SSCShareSessionState state, SSPinterestErrorInfo *error))result;


@end
