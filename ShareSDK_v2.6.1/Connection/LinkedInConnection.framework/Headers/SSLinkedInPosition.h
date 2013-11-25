//
//  SSLinkedInPosition.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSLinkedInCompany.h"
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	职位信息
 */
@interface SSLinkedInPosition : SSCDataObject

/**
 *	@brief	公司信息
 */
@property (nonatomic,readonly) SSLinkedInCompany *company;

/**
 *	@brief	标识
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	是否在职
 */
@property (nonatomic,readonly) BOOL isCurrent;

/**
 *	@brief	头衔
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	创建职位信息
 *
 *	@param 	response 	回复信息
 *
 *	@return	职位信息
 */
+ (SSLinkedInPosition *)positionWithResponse:(NSDictionary *)response;


@end
