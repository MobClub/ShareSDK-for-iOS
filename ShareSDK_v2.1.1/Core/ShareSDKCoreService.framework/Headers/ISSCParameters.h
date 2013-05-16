//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	请求参数协议
 */
@protocol ISSCParameters <NSObject>

/**
 *	@brief	添加参数
 *
 *	@param 	name 	参数名称
 *	@param 	value 	参数值
 */
- (void)addParameter:(NSString *)name value:(id)value;

/**
 *	@brief	添加文件参数
 *
 *	@param 	name 	参数名称
 *	@param 	filePath 	参数值
 *  @param  mimeType    MIME类型
 */
- (void)addParameter:(NSString *)name
            filePath:(id)filePath
            mimeType:(NSString *)mimeType;

/**
 *	@brief	添加文件参数
 *
 *	@param 	name 	参数名称
 *	@param 	fileName 	文件名称
 *	@param 	data 	文件数据
 *	@param 	mimeType 	MIME类型
 *	@param 	transferEncoding 	传输编码，不指定可以设置为nil
 */
- (void)addParameter:(NSString *)name
            fileName:(NSString *)fileName
                data:(NSData *)data
            mimeType:(NSString *)mimeType
    transferEncoding:(NSString *)transferEncoding;

/**
 *	@brief	添加多个参数
 *
 *	@param 	parameters 	参数对象
 */
- (void)addParameters:(id<ISSCParameters>)parameters;

/**
 *	@brief	添加多个参数
 *
 *	@param 	dictionary 	参数字典
 */
- (void)addParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	清除参数
 */
- (void)clear;

/**
 *	@brief	获取参数值
 *
 *	@param 	name 	参数名称
 *
 *	@return	参数值
 */
- (id)parameterWithName:(NSString *)name;

/**
 *	@brief	获取参数数量
 *
 *	@return	参数数量
 */
- (NSInteger)parameterCount;

/**
 *	@brief	获取字典结构数据
 *
 *	@return	字典数据
 */
- (NSDictionary *)dictionaryValue;

/**
 *	@brief	获取参数组织的字符串
 *
 *	@param 	encoding 	编码
 *
 *	@return	字符串
 */
- (NSString *)stringValue:(NSStringEncoding)encoding;

/**
 *	@brief	获取参数组织的二进制数据
 *
 *	@param 	encoding 	编码
 *
 *	@return	二进制数据
 */
- (NSData *)dataValue:(NSStringEncoding)encoding;

/**
 *	@brief	获取参数组织的二进制数据
 *
 *	@param 	encoding 	编码
 *	@param 	boundary 	分隔字符串，用于multipart形式
 *
 *	@return	 二进制数据
 */
- (NSData *)dataValue:(NSStringEncoding)encoding boundary:(NSString *)boundary;


@end
