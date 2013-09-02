//
//  ISSEverNoteDataOutput.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-11.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	数据读取协议
 */
@protocol ISSEverNoteDataOutput <NSObject>

/**
 *	@brief	读取一个字符串
 *
 *	@return	字符串
 */
- (NSString *)readString;

/**
 *	@brief	读取一个布尔值
 *
 *	@return	布尔值
 */
- (BOOL)readBool;

/**
 *	@brief	读取一个字节
 *
 *	@return	字节
 */
- (unsigned char)readByte;

/**
 *	@brief	读取一个短整型
 *
 *	@return	短整型值
 */
- (short)readShort;

/**
 *	@brief	读取一个32位整型值
 *
 *	@return	整型值
 */
- (int32_t)readInt32;

/**
 *	@brief	读取一个64位整型值
 *
 *	@return	整型值
 */
- (int64_t)readInt64;

/**
 *	@brief	读取一个双精度浮点型
 *
 *	@return	浮点型值 
 */
- (double)readDouble;

/**
 *	@brief	读取二进制流
 *
 *	@return	二进制流对象
 */
- (NSData *)readBinary;

/**
 *	@brief	读取字节数组
 *
 *	@param 	buf 	缓存区
 *	@param 	offset 	偏移位置，从缓存区的指定位置开始写入位置
 *	@param 	len 	读入长度
 */
- (void)readBytes:(uint8_t *)buf
           offset:(NSInteger)offset
              len:(NSInteger)len;

/**
 *	@brief	开始读取消息
 *
 *	@param 	name 	用于保存读取的消息名称指向
 *	@param 	type 	用于保存读取的消息类型指向
 *	@param 	sequenceID 	用于保存读取的消息序列指向
 */
- (void)beginReadMessage:(NSString **)name
                    type:(int *)type
              sequenceID:(int *)sequenceID;

/**
 *	@brief	结束读取消息
 */
- (void)endReadMessage;

/**
 *	@brief	开始读取结构
 *
 *	@param 	name 	用于保存读取的结构名称指向
 */
- (void)beginReadStruct:(NSString **)name;

/**
 *	@brief	结束读取结构
 */
- (void)endReadStruct;

/**
 *	@brief	开始读取字段信息
 *
 *	@param 	name 	用于保存字段名称指向
 *	@param 	type 	用于保存字段类型指向
 *	@param 	fieldID 	用于保存字段ID指向
 */
- (void)beginReadField:(NSString **)name
                  type:(int *)type
               fieldID:(int *)fieldID;

/**
 *	@brief	结束读取字段
 */
- (void)endReadField;

/**
 *	@brief	开始读取图信息
 *
 *	@param 	keyType 	用于保存Key类型指向
 *	@param 	valueType 	用于保存Value类型指向
 *	@param 	size 	用于保存长度指向
 */
- (void)beginReadMap:(int *)keyType
           valueType:(int *)valueType
                size:(int *)size;

/**
 *	@brief	结束读取图信息
 */
- (void)endReadMap;

/**
 *	@brief	开始读取集合
 *
 *	@param 	elementType 	用于保存元素类型指向
 *	@param 	size 	用于保存长度指向
 */
- (void)beginReadSet:(int *)elementType
                size:(int *)size;

/**
 *	@brief	结束读取集合
 */
- (void)endReadSet;

/**
 *	@brief	开始读取列表
 *
 *	@param 	elementType 	用于保存元素类型指向
 *	@param 	size 	用于保存长度指向
 */
- (void)beginReadList:(int *)elementType
                 size:(int *)size;

/**
 *	@brief	结束读取列表
 */
- (void)endReadList;


@end
