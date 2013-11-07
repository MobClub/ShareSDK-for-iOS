//
//  SSLinkedInApiStandardProfileRequestReader.h
//  LinkedInConnection
//
//  Created by vimfung on 13-10-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSLinkedInApiStandardProfileRequestHeadersReader.h"

/**
 *	@brief	标准个人信息请求读取器
 */
@interface SSLinkedInApiStandardProfileRequestReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;


@property (nonatomic,readonly) NSString *url;

@property (nonatomic,readonly) SSLinkedInApiStandardProfileRequestHeadersReader *headers;

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
+ (SSLinkedInApiStandardProfileRequestReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
