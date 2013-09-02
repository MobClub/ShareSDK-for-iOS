//
//  SSLinkedInPositionsd.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	职位列表
 */
@interface SSLinkedInPositions : SSCDataObject


/**
 *	@brief	总数量
 */
@property (nonatomic,readonly) NSInteger _total;

/**
 *	@brief	列表数据
 */
@property (nonatomic,readonly) NSArray *values;

/**
 *	@brief	创建职位列表
 *
 *	@param 	response 	回复信息
 *
 *	@return	职位列表信息
 */
+ (SSLinkedInPositions *)positionsWithResponse:(NSDictionary *)response;


@end
