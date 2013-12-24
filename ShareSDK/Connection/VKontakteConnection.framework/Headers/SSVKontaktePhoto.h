//
//  SSVKontaktePhoto.h
//  VKontakteConnection
//
//  Created by 冯 鸿杰 on 13-10-12.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	照片信息
 */
@interface SSVKontaktePhoto : SSCDataObject

/**
 *	@brief	相册ID
 */
@property (nonatomic,readonly) NSInteger aid;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) long long created;

/**
 *	@brief	高度
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	标识
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	所属用户ID
 */
@property (nonatomic,readonly) NSInteger ownerId;

/**
 *	@brief	照片标识
 */
@property (nonatomic,readonly) NSInteger pid;

/**
 *	@brief	路径
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	大图路径
 */
@property (nonatomic,readonly) NSString *srcBig;

/**
 *	@brief	小图路径
 */
@property (nonatomic,readonly) NSString *srcSmall;

/**
 *	@brief	描述
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	宽度
 */
@property (nonatomic,readonly) NSInteger width;


/**
 *	@brief	创建照片信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	照片信息实例
 */
+ (SSVKontaktePhoto *)photoWithResponse:(NSDictionary *)response;


@end
