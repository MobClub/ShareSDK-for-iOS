//
//  SSLinkedInApiStandardProfileRequestHeadersReader.h
//  LinkedInConnection
//
//  Created by vimfung on 13-10-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	请求头信息读取器
 */
@interface SSLinkedInApiStandardProfileRequestHeadersReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

@property (nonatomic, readonly) NSInteger _total;

@property (nonatomic, readonly) NSArray *values;

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
+ (SSLinkedInApiStandardProfileRequestHeadersReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
