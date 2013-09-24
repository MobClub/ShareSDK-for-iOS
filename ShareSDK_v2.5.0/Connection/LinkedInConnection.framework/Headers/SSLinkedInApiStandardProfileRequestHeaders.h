//
//  SSLinkedInApiStandardProfileRequestHeaders.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	请求头信息
 */
@interface SSLinkedInApiStandardProfileRequestHeaders : SSCDataObject


@property (nonatomic, readonly) NSInteger _total;

@property (nonatomic, readonly) NSArray *values;

/**
 *	@brief	创建头信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	头信息
 */
+ (SSLinkedInApiStandardProfileRequestHeaders *)headersWithResponse:(NSDictionary *)response;


@end
