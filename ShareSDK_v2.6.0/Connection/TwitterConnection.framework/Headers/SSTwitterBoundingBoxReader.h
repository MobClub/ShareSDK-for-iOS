//
//  SSTwitterBoundingBoxReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	地方边界信息
 */
@interface SSTwitterBoundingBoxReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	经纬度集合
 */
@property (nonatomic,readonly) NSArray *coordinates;

/**
 *	@brief	类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建地方边界信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterBoundingBoxReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
