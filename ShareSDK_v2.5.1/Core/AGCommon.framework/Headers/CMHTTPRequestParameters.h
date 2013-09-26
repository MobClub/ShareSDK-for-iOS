//
//  HTTPRequestParameters.h
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
 *	@brief	HTTP请求参数列表类,用于快捷填充HTTP请求数据的工具类
 */
@interface CMHTTPRequestParameters : NSObject
{
@private
    NSMutableDictionary *_parameterDict;
}

/**
 *	@brief	参数字典
 */
@property (nonatomic,readonly) NSDictionary *parameterDictionary;

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
 *  @since  ver1.0.8
 *
 *	@param 	parameters 	请求参数列表对象
 */
- (void)addParameters:(CMHTTPRequestParameters *)parameters;

/**
 *	@brief	添加多个参数
 *
 *  @since  ver1.0.8
 *
 *	@param 	dictionary 	请求参数字典
 */
- (void)addParametersWithDictionary:(NSDictionary *)dictionary;


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

@end
