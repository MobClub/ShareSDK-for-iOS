//
//  SSCRunLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCLogInfo.h"

/**
 *	@brief	启动日志信息
 */
@interface SSCRunLogInfo : SSCLogInfo

/**
 *	@brief	创建启动日志信息
 *
 *	@param 	account 	授权帐户
 *
 *	@return	日志信息
 */
+ (SSCRunLogInfo *)runLogInfoWithAccount:(id<ISSCAccount>)account;


@end
