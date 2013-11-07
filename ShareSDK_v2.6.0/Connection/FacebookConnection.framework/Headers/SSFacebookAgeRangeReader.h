//
//  SSFacebookAgeRangeReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	年龄范围信息读取器
 */
@interface SSFacebookAgeRangeReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	范围最小值
 */
@property (nonatomic,readonly) NSInteger min;

/**
 *	@brief	范围最大值
 */
@property (nonatomic,readonly) NSInteger max;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建年龄范围信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookAgeRangeReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
