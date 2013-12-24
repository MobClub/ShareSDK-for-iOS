//
//  SSFacebookSchoolReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	学校信息读取器
 */
@interface SSFacebookSchoolReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	学校Id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	学校名称
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
 *	@brief	创建教育信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookSchoolReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
