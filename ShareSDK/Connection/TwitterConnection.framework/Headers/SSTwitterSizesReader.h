//
//  SSTwitterSizesReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	规格信息读取器
 */
@interface SSTwitterSizesReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	高度
 */
@property (nonatomic,readonly) NSInteger h;

/**
 *	@brief	取得尺寸的方法
 */
@property (nonatomic,readonly) NSString *resize;

/**
 *	@brief	宽度
 */
@property (nonatomic,readonly) NSInteger w;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建规格信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterSizesReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
