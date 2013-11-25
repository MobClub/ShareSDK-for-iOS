//
//  SSEverNoteResourceDataReader.h
//  EverNoteConnection
//
//  Created by vimfung on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	资源数据读取器
 */
@interface SSEverNoteResourceDataReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	This field carries a one-way hash of the contents of the data body, in binary form. The hash function is MD5
 */
@property (nonatomic,readonly) NSData *bodyHash;

/**
 *	@brief	The length, in bytes, of the data body.
 */
@property (nonatomic,readonly) NSInteger size;

/**
 *	@brief	This field is set to contain the binary contents of the data whenever the resource is being transferred.
 *          If only metadata is being exchanged, this field will be empty.
 *          For example, a client could notify the service about the change to an attribute for
 *          a resource without transmitting the binary resource contents.
 */
@property (nonatomic,readonly) NSData *body;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建资源信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSEverNoteResourceDataReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
