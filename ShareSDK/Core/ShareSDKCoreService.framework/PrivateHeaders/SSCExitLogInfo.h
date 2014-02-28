//
//  SSCExitLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCLogInfo.h"

/**
 *	@brief	退出日志信息
 */
@interface SSCExitLogInfo : SSCLogInfo

/**
 *	@brief	创建退出日志信息
 *
 *	@param 	account 	授权帐户
 *
 *	@return	日志信息
 */
+ (SSCExitLogInfo *)exitLogInfoWithAccount:(id<ISSCAccount>)account;

@end
