//
//  SSCAuthLogInfo.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCLogInfo.h"

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "SSCTypeDef.h"
#import "ISSCUserDescriptor.h"
#else
#import "../Headers/SSCTypeDef.h"
#import "../Headers/ISSCUserDescriptor.h"
#endif

/**
 *	@brief	授权日志信息
 */
@interface SSCAuthLogInfo : SSCLogInfo
{
@private
    id<ISSCUserDescriptor> _user;
}

/**
 *	@brief	初始化授权日志
 *
 *	@param 	user 	用户信息
 *	@param 	account 	帐户
 *
 *	@return	授权日志
 */
- (id)initwithUser:(id<ISSCUserDescriptor>)user
           account:(id<ISSCAccount>)account;


/**
 *	@brief	创建授权日志
 *
 *	@param 	type 	平台类型
 *	@param 	user 	用户信息
 *	@param 	account 	帐户
 *
 *	@return	授权日志
 */
+ (SSCAuthLogInfo *)authLogInfoWithUser:(id<ISSCUserDescriptor>)user
                                account:(id<ISSCAccount>)account;


@end
