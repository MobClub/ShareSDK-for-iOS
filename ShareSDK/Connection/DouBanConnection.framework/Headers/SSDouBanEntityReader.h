//
//  SSDouBanEntityReader.h
//  DouBanConnection
//
//  Created by 冯 鸿杰 on 13-10-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	实体信息读取器
 */
@interface SSDouBanEntityReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSArray *topics;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSArray *urls;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSArray *userMentions;

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
+ (SSDouBanEntityReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
