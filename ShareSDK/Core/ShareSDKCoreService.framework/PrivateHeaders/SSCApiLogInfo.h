//
//  SSCApiLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCLogInfo.h"

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "SSCTypeDef.h"
#else
#import "../Headers/SSCTypeDef.h"
#endif

/**
 *	@brief	API日志信息
 */
@interface SSCApiLogInfo : SSCLogInfo
{
@private
    SSCShareType _shareType;
    NSString *_api;
}

/**
 *	@brief	初始化API日志信息
 *
 *	@param 	type 	平台类型
 *	@param 	api 	API信息
 *	@param 	account 	登录帐号
 *
 *	@return	日志信息
 */
- (id)initWithType:(SSCShareType)type
               api:(NSString *)api
           account:(id<ISSCAccount>)account;

/**
 *	@brief	创建API日志信息
 *
 *	@param 	type 	平台类型
 *	@param 	api 	API信息
 *	@param 	account 	登录帐号
 *
 *	@return	日志信息
 */
+ (SSCApiLogInfo *)apiLogWithType:(SSCShareType)type
                              api:(NSString *)api
                          account:(id<ISSCAccount>)account;


@end
