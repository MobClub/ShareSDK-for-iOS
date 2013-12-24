//
//  SSFacebookEducationReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSFacebookSchoolReader.h"
#import "SSFacebookYearReader.h"
#import "SSFacebookDegreeReader.h"

/**
 *	@brief	教育信息读取器
 */
@interface SSFacebookEducationReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	学校信息
 */
@property (nonatomic,readonly) SSFacebookSchoolReader *school;

/**
 *	@brief	年份信息
 */
@property (nonatomic,readonly) SSFacebookYearReader *year;

/**
 *	@brief	学历
 */
@property (nonatomic,readonly) SSFacebookDegreeReader *degree;

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
 *	@brief	创建教育信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookEducationReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
