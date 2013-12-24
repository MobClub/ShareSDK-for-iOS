//
//  SSEverNoteLazyMapReader.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	Lazy Map 读取器
 */
@interface SSEverNoteLazyMapReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The set of keys for the map. This field is ignored by the server when set.
 */
@property (nonatomic,readonly) NSSet *keysOnly;

/**
 *	@brief	The complete map, including all keys and values.
 */
@property (nonatomic,readonly) NSDictionary *fullMap;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建笔记属性集合读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSEverNoteLazyMapReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
