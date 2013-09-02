//
//  SSLinkedInLocation.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSLinkedInCountry.h"

/**
 *	@brief	位置信息
 */
@interface SSLinkedInLocation : SSCDataObject

/**
 *	@brief	名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	国家
 */
@property (nonatomic,readonly) SSLinkedInCountry *country;

/**
 *	@brief	创建位置信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	位置信息
 */
+ (SSLinkedInLocation *)locationWithResponse:(NSDictionary *)response;


@end
