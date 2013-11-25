//
//  SSLinkedInApiStandardProfileRequestHeadersValue.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	请求头键值对
 */
@interface SSLinkedInApiStandardProfileRequestHeadersValue : SSCDataObject

@property (nonatomic,readonly) NSString *name;
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	创建键值对实例
 *
 *	@param 	response 	回复数据
 *
 *	@return	对象实例
 */
+ (SSLinkedInApiStandardProfileRequestHeadersValue *)valueWithResponse:(NSDictionary *)response;


@end
