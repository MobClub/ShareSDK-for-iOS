//
//  SSFacebookSignficantOtherReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	SignficantOther class
 */
@interface SSFacebookSignficantOtherReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookSignficantOtherReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
