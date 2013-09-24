//
//  SSGooglePlusAgeRange.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	年龄范围
 */
@interface SSGooglePlusAgeRange : SSCDataObject

/**
 *	@brief	The age range's lower bound, if any.
 */
@property (nonatomic,readonly) NSInteger max;

/**
 *	@brief	The age range's upper bound, if any.
 */
@property (nonatomic,readonly) NSInteger min;

/**
 *	@brief	创建年龄范围
 *
 *	@param 	response 	回复数据
 *
 *	@return	年龄范围
 */
+ (SSGooglePlusAgeRange *)ageRangeWithResponse:(NSDictionary *)response;


@end
