//
//  SSTencentWeiboEduReader.h
//  TencentWeiboConnection
//
//  Created by vimfung on 13-10-20.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	教育信息
 */
@interface SSTencentWeiboEduReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	院系id
 */
@property (nonatomic,readonly) NSInteger departmentid;

/**
 *	@brief	教育信息记录id
 */
@property (nonatomic,readonly) NSInteger Id;

/**
 *	@brief	学历级别
 */
@property (nonatomic,readonly) NSInteger level;

/**
 *	@brief	学校id
 */
@property (nonatomic,readonly) NSInteger schoolid;

/**
 *	@brief	入学年
 */
@property (nonatomic,readonly) NSInteger year;

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
+ (SSTencentWeiboEduReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
