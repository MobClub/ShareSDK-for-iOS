//
//  SSLinkedInApiStandardProfileRequest.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSLinkedInApiStandardProfileRequestHeaders.h"

/**
 *	@brief	标准个人信息请求
 */
@interface SSLinkedInApiStandardProfileRequest : SSCDataObject


@property (nonatomic,readonly) NSString *url;

@property (nonatomic,readonly) SSLinkedInApiStandardProfileRequestHeaders *headers;

/**
 *	@brief	创建请求实例
 *
 *	@param 	response 	回复数据
 *
 *	@return	请求实例对象
 */
+ (SSLinkedInApiStandardProfileRequest *)requestWithResponse:(NSDictionary *)response;


@end
