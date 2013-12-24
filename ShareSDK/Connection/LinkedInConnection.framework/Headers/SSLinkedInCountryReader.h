//
//  SSLinkedInCountryReader.h
//  LinkedInConnection
//
//  Created by vimfung on 13-10-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	国家信息读取器
 */
@interface SSLinkedInCountryReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	国家代码
 */
@property (nonatomic,readonly) NSString *code;

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
+ (SSLinkedInCountryReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
