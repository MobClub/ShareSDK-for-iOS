//
//  SSInstapaperUserReader.h
//  InstapaperConnection
//
//  Created by 冯 鸿杰 on 13-10-28.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	用户信息读取器
 */
@interface SSInstapaperUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;


/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) long long userId;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *userName;

/**
 *	@brief	是否为订阅用户
 */
@property (nonatomic,readonly) BOOL subscriptionIsActive;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSInstapaperUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
