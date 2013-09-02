//
//  SSLinkedInCountry.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	国家信息
 */
@interface SSLinkedInCountry : SSCDataObject

/**
 *	@brief	国家代码
 */
@property (nonatomic,readonly) NSString *code;

/**
 *	@brief	创建国家信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	国家信息
 */
+ (SSLinkedInCountry *)countryWithResponse:(NSDictionary *)response;


@end
