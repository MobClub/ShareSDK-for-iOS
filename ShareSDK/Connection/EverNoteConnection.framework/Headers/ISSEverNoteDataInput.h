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
 *	@brief	数据写入协议
 */
///#end
///#begin en
/**
 *	@brief	Data input protocol.
 */
///#end
@protocol ISSEverNoteDataInput <NSObject>

///#begin zh-cn
/**
 *	@brief	写入字节数组
 *
 *	@param 	buf 	缓存区
 *	@param 	offset 	偏移位置，从缓存区的指定位置开始读取位置
 *	@param 	len 	读入长度
 */
///#end
///#begin en
/**
 *	@brief	Write bytes.
 *
 *	@param 	buf 	bytes buffer.
 *	@param 	offset 	Offset，Specify the starting position of the buffer to read.
 *	@param 	len 	Read length.
 */
///#end
- (void)writeBytes:(const uint8_t *)buf
            offset:(NSInteger)offset
               len:(NSInteger)len;

///#begin zh-cn
/**
 *	@brief	开始写入消息
 *
 *	@param 	name 	消息名称
 *	@param 	messageType 	消息类型
 *	@param 	sequenceID 	序列ID
 */
///#end
///#begin en
/**
 *	@brief	Begin write message.
 *
 *	@param 	name 	Message name.
 *	@param 	messageType 	Message type.
 *	@param 	sequenceID 	Message id.
 */
///#end
- (void)beginWriteMessage:(NSString *)name
                     type:(int)messageType
               sequenceID:(int)sequenceID;

///#begin zh-cn
/**
 *	@brief	结束写入消息
 */
///#end
///#begin en
/**
 *	@brief	End write message.
 */
///#end
- (void)endWriteMessage;

///#begin zh-cn
/**
 *	@brief	开始写入结构
 *
 *	@param 	name 	结构名称
 */
///#end
///#begin en
/**
 *	@brief	Begin write structure
 *
 *	@param 	name 	Structure name.
 */
///#end
- (void)beginWriteStruct:(NSString *)name;

///#begin zh-cn
/**
 *	@brief	结束写入结构
 */
///#end
///#begin en
/**
 *	@brief	End write structure.
 */
///#end
- (void)endWriteStruct;

///#begin zh-cn
/**
 *	@brief	开始写入字段
 *
 *	@param 	name 	字段名称
 *	@param 	type 	字段类型
 *	@param 	fieldID 	字段ID
 */
///#end
///#begin en
/**
 *	@brief	Begin write field.
 *
 *	@param 	name 	Field name.
 *	@param 	type 	Field type.
 *	@param 	fieldID 	Field id.
 */
///#end
- (void)beginWriteField:(NSString *)name
                   type:(int)type
                fieldID:(int)fieldID;

///#begin zh-cn
/**
 *	@brief	写入字段结束标识
 */
///#end
///#begin en
/**
 *	@brief	Write field stop flag.
 */
///#end
- (void)writeFieldStop;

///#begin zh-cn
/**
 *	@brief	结束写入字段
 */
///#end
///#begin en
/**
 *	@brief	End write field.
 */
///#end
- (void)endWriteField;

///#begin zh-cn
/**
 *	@brief	写入一个整型值
 *
 *	@param 	value 	整型值
 */
///#end
///#begin en
/**
 *	@brief	Write 32-bit integer.
 *
 *	@param 	value 	32-bit integer.
 */
///#end
- (void)writeInt32:(int32_t)value;

///#begin zh-cn
/**
 *	@brief	写入一个长整型值
 *
 *	@param 	value   长整型值
 */
///#end
///#begin en
/**
 *	@brief	Write 64-bit Integer.
 *
 *	@param 	value   64-bit Integer.
 */
///#end
- (void)writeInt64:(int64_t)value;

///#begin zh-cn
/**
 *	@brief	写入一个短整型指
 *
 *	@param 	value 	短整型值
 */
///#end
///#begin en
/**
 *	@brief	Write short integer.
 *
 *	@param 	value 	Short integer.
 */
///#end
- (void)writeShort:(short)value;

///#begin zh-cn
/**
 *	@brief	写入一个字节
 *
 *	@param 	value 	字节
 */
///#end
///#begin en
/**
 *	@brief	Write byte
 *
 *	@param 	value 	byte.
 */
///#end
- (void)writeByte:(uint8_t)value;

///#begin zh-cn
/**
 *	@brief	写入一个字符串
 *
 *	@param 	value 	字符串
 */
///#end
///#begin en
/**
 *	@brief	Write string.
 *
 *	@param 	value 	string.
 */
///#end
- (void)writeString:(NSString *)value;

///#begin zh-cn
/**
 *	@brief	写入一个双精度浮点型
 *
 *	@param 	value 	浮点型数值
 */
///#end
///#begin en
/**
 *	@brief	Write double.
 *
 *	@param 	value 	Double value.
 */
///#end
- (void)writeDouble:(double)value;

///#begin zh-cn
/**
 *	@brief	写入一个布尔值
 *
 *	@param 	value 	布尔值
 */
///#end
///#begin en
/**
 *	@brief	Write boolean.
 *
 *	@param 	value 	Boolean value.
 */
///#end
- (void)writeBool:(BOOL)value;

///#begin zh-cn
/**
 *	@brief	写入一个字节流
 *
 *	@param 	data 	二进制流
 */
///#end
///#begin en
/**
 *	@brief	Write binary.
 *
 *	@param 	data 	binary data.
 */
///#end
- (void)writeBinary:(NSData *)data;

///#begin zh-cn
/**
 *	@brief	开始写入图
 *
 *	@param 	keyType 	Key类型
 *	@param 	valueType 	Value类型
 *	@param 	size 	长度
 */
///#end
///#begin en
/**
 *	@brief	Start write map.
 *
 *	@param 	keyType 	Key type.
 *	@param 	valueType 	Value type.
 *	@param 	size 	Size
 */
///#end
- (void)beginWriteMap:(int)keyType
            valueType:(int)valueType
                 size:(int)size;
				 
///#begin zh-cn
/**
 *	@brief	结束写入图
 */
///#end
///#begin en
/**
 *	@brief	End write map.
 */
///#end
- (void)endWriteMap;

///#begin zh-cn
/**
 *	@brief	开始写入集合
 *
 *	@param 	elementType 	元素类型
 *	@param 	size 	长度
 */
///#end
///#begin en
/**
 *	@brief	Start write set.
 *
 *	@param 	elementType 	Element type.
 *	@param 	size 	Size
 */
///#end
- (void)beginWriteSet:(int)elementType
                 size:(int)size;

///#begin zh-cn
/**
 *	@brief	结束写入集合
 */
///#end
///#begin en
/**
 *	@brief	End write set.
 */
///#end
- (void)endWriteSet;

///#begin zh-cn
/**
 *	@brief	开始写入列表
 *
 *	@param 	elementType 	元素类型
 *	@param 	size 	长度
 */
///#end
///#begin en
/**
 *	@brief	Start write list.
 *
 *	@param 	elementType 	Element type.
 *	@param 	size 	Size.
 */
///#end
- (void)beginWriteList:(int)elementType size:(int)size;

///#begin zh-cn
/**
 *	@brief	结束写入列表
 */
///#end
///#begin en
/**
 *	@brief	End write list.
 */
///#end
- (void)endWriteList;

@end
