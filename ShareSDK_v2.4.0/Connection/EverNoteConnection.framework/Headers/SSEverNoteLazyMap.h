//
//  SSEverNoteLazyMap.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-5-23.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <ShareSDKCoreService/SSCDataObject.h>
#import "ISSEverNoteDataOutput.h"
#import "ISSEverNoteDataInput.h"

/**
 *	@brief	Lazy Map
 */
@interface SSEverNoteLazyMap : SSCDataObject

/**
 *	@brief	The set of keys for the map. This field is ignored by the server when set.
 */
@property (nonatomic,readonly) NSSet *keysOnly;

/**
 *	@brief	The complete map, including all keys and values.
 */
@property (nonatomic,readonly) NSDictionary *fullMap;

/**
 *	@brief	创建LazyMap对象
 *
 *	@param 	reader 	数据读取器
 *
 *	@return	LazyMap对象
 */
+ (SSEverNoteLazyMap *)lazyMapWithResponse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	解析数据
 *
 *	@param 	reader 	数据读取器
 */
- (void)parse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	放入数据
 *
 *	@param 	writer 	数据读取器
 */
- (void)putData:(id<ISSEverNoteDataInput>)writer;


@end
