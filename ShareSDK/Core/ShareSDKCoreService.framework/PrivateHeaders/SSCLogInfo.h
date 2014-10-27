//
//  SSCLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "ISSCAccount.h"
#else
#import "../Headers/ISSCAccount.h"
#endif

@class SSCAccount;

/**
 *	@brief	日志类型
 */
typedef enum
{
	SSCLogInfoTypeRun = 1, /**< 运行 */
	SSCLogInfoTypeExit = 2, /**< 退出 */
	SSCLogInfoTypeEvent = 3, /**< 事件 */
	SSCLogInfoTypeAuth = 4, /**< 授权 */
	SSCLogInfoTypeShare = 5, /**< 分享 */
	SSCLogInfoTypeAPI = 6 /**< API */
}
SSCLogInfoType;


/**
 *	@brief	日志信息
 */
@interface SSCLogInfo : NSObject
{
@protected
    NSTimeInterval _datetime;
    SSCAccount *_account;
    SSCLogInfoType _type;
}

/**
 *	@brief	日志类型
 */
@property (nonatomic,readonly) SSCLogInfoType type;

/**
 *	@brief	初始化日志信息
 *
 *	@param 	type 	类型
 *  @param  account 授权帐户
 *
 *	@return	日志信息
 */
- (id)initWithType:(SSCLogInfoType)type account:(id<ISSCAccount>)account;

/**
 *	@brief	获取数据字符串
 *
 *	@return	字符串描述
 */
- (NSString *)stringValue;


@end
