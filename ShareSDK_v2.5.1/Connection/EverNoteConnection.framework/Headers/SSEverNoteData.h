//
//  SSEverNoteData.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-5-23.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <ShareSDKCoreService/SSCDataObject.h>
#import "ISSEverNoteDataOutput.h"
#import "ISSEverNoteDataInput.h"

/**
 *	@brief	数据对象
 */
@interface SSEverNoteData : SSCDataObject

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
 *	@brief	解析数据
 *
 *	@param 	reader 	数据读取器
 */
- (void)parse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	放入数据
 *
 *	@param 	writer 	数据写入器
 */
- (void)putData:(id<ISSEverNoteDataInput>)writer;

/**
 *	@brief	创建数据对象
 *
 *	@param 	reader 	数据读取器
 *
 *	@return	数据对象
 */
+ (SSEverNoteData *)dataWithResponse:(id<ISSEverNoteDataOutput>)reader;

/**
 *	@brief	创建数据对象
 *
 *	@param 	bodyHash 	内容的哈希值
 *	@param 	size 	内容长度
 *	@param 	body 	内容数据
 *
 *	@return	数据对象
 */
+ (SSEverNoteData *)dataWithBodyHash:(NSData *)bodyHash size:(NSInteger)size body:(NSData *)body;


@end
