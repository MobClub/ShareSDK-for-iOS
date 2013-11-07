//
//  SSTencentWeiboCareerReader.h
//  TencentWeiboConnection
//
//  Created by vimfung on 13-10-20.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	职业信息读取器
 */
@interface SSTencentWeiboCareerReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	开始年
 */
@property (nonatomic,readonly) NSInteger beginYear;

/**
 *	@brief	公司名称
 */
@property (nonatomic,readonly) NSString *companyName;

/**
 *	@brief	部门名称
 */
@property (nonatomic,readonly) NSString *departmentName;

/**
 *	@brief	结束年
 */
@property (nonatomic,readonly) NSInteger endYear;

/**
 *	@brief	公司id
 */
@property (nonatomic,readonly) NSInteger Id;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建职业信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTencentWeiboCareerReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
