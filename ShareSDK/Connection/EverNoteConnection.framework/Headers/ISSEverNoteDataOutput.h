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
 *	@brief	Data output protocol.
 */
@protocol ISSEverNoteDataOutput <NSObject>

/**
 *	@brief	Read a string.
 *
 *	@return	String object.
 */
- (NSString *)readString;

/**
 *	@brief	Read a boolean.
 *
 *	@return	Boolean value.
 */
- (BOOL)readBool;

/**
 *	@brief	Read a byte.
 *
 *	@return	Byte value.
 */
- (unsigned char)readByte;

/**
 *	@brief	Read a short integer.
 *
 *	@return	Short integer value.
 */
- (short)readShort;

/**
 *	@brief	Read a bit-32 integer.
 *
 *	@return	Bit-32 integer value.
 */
- (int32_t)readInt32;

/**
 *	@brief	Read a bit-64 integer.
 *
 *	@return	Bit-64 integer value.
 */
- (int64_t)readInt64;

/**
 *	@brief	Read a double.
 *
 *	@return	Double value.
 */
- (double)readDouble;

/**
 *	@brief	Read binary.
 *
 *	@return	Binary object.
 */
- (NSData *)readBinary;

/**
 *	@brief	Read bytes.
 *
 *	@param 	buf 	Buffer.
 *	@param 	offset 	Offset，Specify the starting position of the buffer to write.
 *	@param 	len 	Length.
 */
- (void)readBytes:(uint8_t *)buf
           offset:(NSInteger)offset
              len:(NSInteger)len;

/**
 *	@brief	Begin read message.
 *
 *	@param 	name 	Used to store the name's pointer
 *	@param 	type 	Used to store the type's pointer
 *	@param 	sequenceID 	Used to store the sequence id's pointer
 */
- (void)beginReadMessage:(NSString **)name
                    type:(int *)type
              sequenceID:(int *)sequenceID;
			  
/**
 *	@brief	End read message.
 */
- (void)endReadMessage;

/**
 *	@brief	Begin read structure.
 *
 *	@param 	name 	Used to store the name's pointer
 */
- (void)beginReadStruct:(NSString **)name;

/**
 *	@brief	End read structure.
 */
- (void)endReadStruct;

/**
 *	@brief	Begin read field
 *
 *	@param 	name 	Used to store the field name's pointer
 *	@param 	type 	Used to store the field type's pointer
 *	@param 	fieldID 	Used to store the field id's pointer
 */
- (void)beginReadField:(NSString **)name
                  type:(int *)type
               fieldID:(int *)fieldID;
			   
/**
 *	@brief	End read field
 */
- (void)endReadField;

/**
 *	@brief	Begin read map.
 *
 *	@param 	keyType 	Used to store the key's pointer
 *	@param 	valueType 	Used to store the value's pointer
 *	@param 	size 	Used to store the size's pointer
 */
- (void)beginReadMap:(int *)keyType
           valueType:(int *)valueType
                size:(int *)size;
				
/**
 *	@brief	End read map.
 */
- (void)endReadMap;

/**
 *	@brief	Begin read set.
 *
 *	@param 	elementType 	Used to store the element type's pointer
 *	@param 	size 	Used to store the Length pointer.
 */
- (void)beginReadSet:(int *)elementType
                size:(int *)size;
				
/**
 *	@brief	End read set.
 */
- (void)endReadSet;

/**
 *	@brief	Begin read list.
 *
 *	@param 	elementType 	Used to store the element type's pointer
 *	@param 	size 	Used to store the Length pointer.
 */
- (void)beginReadList:(int *)elementType
                 size:(int *)size;
				 
/**
 *	@brief	End read list.
 */
- (void)endReadList;


@end
