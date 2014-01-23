//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Data input protocol.
 */
@protocol ISSEverNoteDataInput <NSObject>

/**
 *	@brief	Write bytes.
 *
 *	@param 	buf 	bytes buffer.
 *	@param 	offset 	Offset，Specify the starting position of the buffer to read.
 *	@param 	len 	Read length.
 */
- (void)writeBytes:(const uint8_t *)buf
            offset:(NSInteger)offset
               len:(NSInteger)len;

/**
 *	@brief	Begin write message.
 *
 *	@param 	name 	Message name.
 *	@param 	messageType 	Message type.
 *	@param 	sequenceID 	Message id.
 */
- (void)beginWriteMessage:(NSString *)name
                     type:(int)messageType
               sequenceID:(int)sequenceID;

/**
 *	@brief	End write message.
 */
- (void)endWriteMessage;

/**
 *	@brief	Begin write structure
 *
 *	@param 	name 	Structure name.
 */
- (void)beginWriteStruct:(NSString *)name;

/**
 *	@brief	End write structure.
 */
- (void)endWriteStruct;

/**
 *	@brief	Begin write field.
 *
 *	@param 	name 	Field name.
 *	@param 	type 	Field type.
 *	@param 	fieldID 	Field id.
 */
- (void)beginWriteField:(NSString *)name
                   type:(int)type
                fieldID:(int)fieldID;

/**
 *	@brief	Write field stop flag.
 */
- (void)writeFieldStop;

/**
 *	@brief	End write field.
 */
- (void)endWriteField;

/**
 *	@brief	Write 32-bit integer.
 *
 *	@param 	value 	32-bit integer.
 */
- (void)writeInt32:(int32_t)value;

/**
 *	@brief	Write 64-bit Integer.
 *
 *	@param 	value   64-bit Integer.
 */
- (void)writeInt64:(int64_t)value;

/**
 *	@brief	Write short integer.
 *
 *	@param 	value 	Short integer.
 */
- (void)writeShort:(short)value;

/**
 *	@brief	Write byte
 *
 *	@param 	value 	byte.
 */
- (void)writeByte:(uint8_t)value;

/**
 *	@brief	Write string.
 *
 *	@param 	value 	string.
 */
- (void)writeString:(NSString *)value;

/**
 *	@brief	Write double.
 *
 *	@param 	value 	Double value.
 */
- (void)writeDouble:(double)value;

/**
 *	@brief	Write boolean.
 *
 *	@param 	value 	Boolean value.
 */
- (void)writeBool:(BOOL)value;

/**
 *	@brief	Write binary.
 *
 *	@param 	data 	binary data.
 */
- (void)writeBinary:(NSData *)data;

/**
 *	@brief	Start write map.
 *
 *	@param 	keyType 	Key type.
 *	@param 	valueType 	Value type.
 *	@param 	size 	Size
 */
- (void)beginWriteMap:(int)keyType
            valueType:(int)valueType
                 size:(int)size;
				 
/**
 *	@brief	End write map.
 */
- (void)endWriteMap;

/**
 *	@brief	Start write set.
 *
 *	@param 	elementType 	Element type.
 *	@param 	size 	Size
 */
- (void)beginWriteSet:(int)elementType
                 size:(int)size;

/**
 *	@brief	End write set.
 */
- (void)endWriteSet;

/**
 *	@brief	Start write list.
 *
 *	@param 	elementType 	Element type.
 *	@param 	size 	Size.
 */
- (void)beginWriteList:(int)elementType size:(int)size;

/**
 *	@brief	End write list.
 */
- (void)endWriteList;

@end
