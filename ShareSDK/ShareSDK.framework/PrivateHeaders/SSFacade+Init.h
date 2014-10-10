//
//  SSFacade+Init.h
//  ShareSDKInterface
//
//  Created by 冯 鸿杰 on 13/3/30.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSFacade.h"
#import "ShareSDKDef.h"
#import "ShareSDKPlugin.h"

@interface SSFacade (Init)

/**
 *	@brief	注册应用
 *
 *	@param 	appKey 	应用Key
 */
- (void)registerApp:(NSString *)appKey;

/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *  @param  wxDelegate  微信委托,如果没有集成微信SDK，可以传入nil
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
- (BOOL)handleOpenURL:(NSURL *)url wxDelegate:(id)wxDelegate;


/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *  @param  wxDelegate  微信委托,如果没有集成微信SDK，可以传入nil
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
- (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation
           wxDelegate:(id)wxDelegate;

/**
 *	@brief	获取平台对象
 *
 *	@param 	type 	平台类型
 *
 *	@return	平台实例对象
 */
- (id<ISSPlatform>)platformWithType:(ShareType)type;

/**
 *	@brief	注册应用
 *
 *	@param 	type 	平台类型
 *  @param  platform    平台对象
 *	@param 	appInfo 	应用配置信息
 */
- (void)registerAppWithType:(ShareType)type
                   platform:(id<ISSPlatform>)platform
                    appInfo:(NSDictionary *)appInfo;


@end
