//
//  SSInstagramCounts.h
//  InstagramConnection
//
//  Created by 冯 鸿杰 on 13-10-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	数量
 */
@interface SSInstagramCounts : SSCDataObject

/**
 *	@brief	媒体数量
 */
@property (nonatomic,readonly) NSInteger media;

/**
 *	@brief	关注数量
 */
@property (nonatomic,readonly) NSInteger follows;

/**
 *	@brief	粉丝数量
 */
@property (nonatomic,readonly) NSInteger followedBy;

/**
 *	@brief	创建数量对象实例
 *
 *	@param 	data 	回复数据
 *
 *	@return	数量对象
 */
+ (SSInstagramCounts *)countsWithResponse:(NSDictionary *)data;


@end
