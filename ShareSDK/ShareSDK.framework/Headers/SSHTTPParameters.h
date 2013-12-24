//
//  SSHTTPParameters.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 13-11-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	HTTP参数集合
 */
@interface SSHTTPParameters : NSObject

/**
 *	@brief	初始化HTTP请求参数列表
 *
 *	@param 	url 	请求的URL对象
 *
 *	@return	请求参数列表对象
 */
- (id)initWithURL:(NSURL *)url;

/**
 *	@brief	初始化HTTP请求参数列表
 *
 *	@param 	queryString 	请求的URL参数部分字符串
 *
 *	@return	请求参数列表对象
 */
- (id)initWithQueryString:(NSString *)queryString;

/**
 *	@brief	添加参数
 *
 *	@param 	name 	参数名称
 *	@param 	value 	参数值
 */
- (void)addParameterWithName:(NSString *)name value:(id)value;

/**
 *	@brief	添加多个参数
 *
 *	@param 	dictionary 	请求参数字典
 */
- (void)addParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	添加文件参数
 *
 *	@param 	name 	参数名称
 *	@param 	fileName 	文件名称
 *	@param 	data 	文件数据
 *	@param 	contentType 	MIME类型
 *	@param 	transferEncoding 	传输编码
 */
- (void)addPostedFileWithName:(NSString *)name
                     fileName:(NSString *)fileName
                         data:(NSData *)data
                  contentType:(NSString *)contentType
             transferEncoding:(NSString *)transferEncoding;


/**
 *	@brief	删除参数
 *
 *	@param 	name 	参数名称
 */
- (void)removeParameterWithName:(NSString *)name;

/**
 *	@brief	获取参数值
 *
 *	@param 	name 	参数名称
 *
 *	@return	参数值
 */
- (id)getValueForName:(NSString *)name;

/**
 *	@brief	清除所有参数
 */
- (void)clear;

/**
 *	@brief	获取请求参数的二进制数据
 *
 *	@param 	encoding 	编码
 *
 *	@return	二进制数据对象
 */
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding;

/**
 *	@brief	获取Multipart格式的二进制数据
 *
 *	@param 	encoding 	编码
 *  @param  boundary    分隔符号
 *
 *	@return	二进制数据对象
 */
- (NSData *)multipartDataUsingEncoding:(NSStringEncoding)encoding boundary:(NSString *)boundary;

/**
 *	@brief	获取请求参数字符串
 *
 *  @param  encoding    编码
 *
 *	@return	字符串对象
 */
- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding;

/**
 *	@brief	获取参数集合字典
 *
 *	@return	字典对象
 */
- (NSDictionary *)dictionaryValue;

@end
