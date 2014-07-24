///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>

///#begin zh-cn
/**
 *	@brief	数据读取协议
 */
///#end
///#begin en
/**
 *	@brief	Data output protocol.
 */
///#end
@protocol ISSEverNoteDataOutput <NSObject>

///#begin zh-cn
/**
 *	@brief	读取一个字符串
 *
 *	@return	字符串
 */
///#end
///#begin en
/**
 *	@brief	Read a string.
 *
 *	@return	String object.
 */
///#end
- (NSString *)readString;

///#begin zh-cn
/**
 *	@brief	读取一个布尔值
 *
 *	@return	布尔值
 */
///#end
///#begin en
/**
 *	@brief	Read a boolean.
 *
 *	@return	Boolean value.
 */
///#end
- (BOOL)readBool;

///#begin zh-cn
/**
 *	@brief	读取一个字节
 *
 *	@return	字节
 */
///#end
///#begin en
/**
 *	@brief	Read a byte.
 *
 *	@return	Byte value.
 */
///#end
- (unsigned char)readByte;

///#begin zh-cn
/**
 *	@brief	读取一个短整型
 *
 *	@return	短整型值
 */
///#end
///#begin en
/**
 *	@brief	Read a short integer.
 *
 *	@return	Short integer value.
 */
///#end
- (short)readShort;

///#begin zh-cn
/**
 *	@brief	读取一个32位整型值
 *
 *	@return	整型值
 */
///#end
///#begin en
/**
 *	@brief	Read a bit-32 integer.
 *
 *	@return	Bit-32 integer value.
 */
///#end
- (int32_t)readInt32;

///#begin zh-cn
/**
 *	@brief	读取一个64位整型值
 *
 *	@return	整型值
 */
///#end
///#begin en
/**
 *	@brief	Read a bit-64 integer.
 *
 *	@return	Bit-64 integer value.
 */
///#end
- (int64_t)readInt64;

///#begin zh-cn
/**
 *	@brief	读取一个双精度浮点型
 *
 *	@return	浮点型值 
 */
///#end
///#begin en
/**
 *	@brief	Read a double.
 *
 *	@return	Double value.
 */
///#end
- (double)readDouble;

///#begin zh-cn
/**
 *	@brief	读取二进制流
 *
 *	@return	二进制流对象
 */
///#end
///#begin en
/**
 *	@brief	Read binary.
 *
 *	@return	Binary object.
 */
///#end
- (NSData *)readBinary;

///#begin zh-cn
/**
 *	@brief	读取字节数组
 *
 *	@param 	buf 	缓存区
 *	@param 	offset 	偏移位置，从缓存区的指定位置开始写入位置
 *	@param 	len 	读入长度
 */
///#end
///#begin en
/**
 *	@brief	Read bytes.
 *
 *	@param 	buf 	Buffer.
 *	@param 	offset 	Offset，Specify the starting position of the buffer to write.
 *	@param 	len 	Length.
 */
///#end
- (void)readBytes:(uint8_t *)buf
           offset:(NSInteger)offset
              len:(NSInteger)len;

///#begin zh-cn
/**
 *	@brief	开始读取消息
 *
 *	@param 	name 	用于保存读取的消息名称指向
 *	@param 	type 	用于保存读取的消息类型指向
 *	@param 	sequenceID 	用于保存读取的消息序列指向
 */
///#end
///#begin en
/**
 *	@brief	Begin read message.
 *
 *	@param 	name 	Used to store the name's pointer
 *	@param 	type 	Used to store the type's pointer
 *	@param 	sequenceID 	Used to store the sequence id's pointer
 */
///#end
- (void)beginReadMessage:(NSString **)name
                    type:(int *)type
              sequenceID:(int *)sequenceID;
			  
///#begin zh-cn
/**
 *	@brief	结束读取消息
 */
///#end
///#begin en
/**
 *	@brief	End read message.
 */
///#end
- (void)endReadMessage;

///#begin zh-cn
/**
 *	@brief	开始读取结构
 *
 *	@param 	name 	用于保存读取的结构名称指向
 */
///#end
///#begin en
/**
 *	@brief	Begin read structure.
 *
 *	@param 	name 	Used to store the name's pointer
 */
///#end
- (void)beginReadStruct:(NSString **)name;

///#begin zh-cn
/**
 *	@brief	结束读取结构
 */
///#end
///#begin en
/**
 *	@brief	End read structure.
 */
///#end
- (void)endReadStruct;

///#begin zh-cn
/**
 *	@brief	开始读取字段信息
 *
 *	@param 	name 	用于保存字段名称指向
 *	@param 	type 	用于保存字段类型指向
 *	@param 	fieldID 	用于保存字段ID指向
 */
///#end
///#begin en
/**
 *	@brief	Begin read field
 *
 *	@param 	name 	Used to store the field name's pointer
 *	@param 	type 	Used to store the field type's pointer
 *	@param 	fieldID 	Used to store the field id's pointer
 */
///#end
- (void)beginReadField:(NSString **)name
                  type:(int *)type
               fieldID:(int *)fieldID;
			   
///#begin zh-cn
/**
 *	@brief	结束读取字段
 */
///#end
///#begin en
/**
 *	@brief	End read field
 */
///#end
- (void)endReadField;

///#begin zh-cn
/**
 *	@brief	开始读取图信息
 *
 *	@param 	keyType 	用于保存Key类型指向
 *	@param 	valueType 	用于保存Value类型指向
 *	@param 	size 	用于保存长度指向
 */
///#end
///#begin en
/**
 *	@brief	Begin read map.
 *
 *	@param 	keyType 	Used to store the key's pointer
 *	@param 	valueType 	Used to store the value's pointer
 *	@param 	size 	Used to store the size's pointer
 */
///#end
- (void)beginReadMap:(int *)keyType
           valueType:(int *)valueType
                size:(int *)size;
				
///#begin zh-cn
/**
 *	@brief	结束读取图信息
 */
///#end
///#begin en
/**
 *	@brief	End read map.
 */
///#end
- (void)endReadMap;

///#begin zh-cn
/**
 *	@brief	开始读取集合
 *
 *	@param 	elementType 	用于保存元素类型指向
 *	@param 	size 	用于保存长度指向
 */
///#end
///#begin en
/**
 *	@brief	Begin read set.
 *
 *	@param 	elementType 	Used to store the element type's pointer
 *	@param 	size 	Used to store the Length pointer.
 */
///#end
- (void)beginReadSet:(int *)elementType
                size:(int *)size;
				
///#begin zh-cn
/**
 *	@brief	结束读取集合
 */
///#end
///#begin en
/**
 *	@brief	End read set.
 */
///#end
- (void)endReadSet;

///#begin zh-cn
/**
 *	@brief	开始读取列表
 *
 *	@param 	elementType 	用于保存元素类型指向
 *	@param 	size 	用于保存长度指向
 */
///#end
///#begin en
/**
 *	@brief	Begin read list.
 *
 *	@param 	elementType 	Used to store the element type's pointer
 *	@param 	size 	Used to store the Length pointer.
 */
///#end
- (void)beginReadList:(int *)elementType
                 size:(int *)size;
				 
///#begin zh-cn
/**
 *	@brief	结束读取列表
 */
///#end
///#begin en
/**
 *	@brief	End read list.
 */
///#end
- (void)endReadList;


@end
