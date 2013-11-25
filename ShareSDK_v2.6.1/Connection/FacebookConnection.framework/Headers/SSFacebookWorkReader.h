//
//  SSFacebookWorkReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSFacebookEmployerReader.h"
#import "SSFacebookPositionReader.h"

/**
 *	@brief	工作信息读取器
 */
@interface SSFacebookWorkReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	公司名称
 */
@property (nonatomic,readonly) SSFacebookEmployerReader *employer;

/**
 *	@brief	公司所在地
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	职务
 */
@property (nonatomic,readonly) SSFacebookPositionReader *position;

/**
 *	@brief	开始时间
 */
@property (nonatomic,readonly) NSString *startDate;

/**
 *	@brief	结束时间
 */
@property (nonatomic,readonly) NSString *endDate;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建工作信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookWorkReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
