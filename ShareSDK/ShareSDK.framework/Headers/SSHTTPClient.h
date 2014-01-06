//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSHTTPParameters.h"

/**
 *	@brief	HTTP返回事件
 */
typedef void(^SSHTTPResultEvent) (NSHTTPURLResponse *response, NSData *responseData);

/**
 *	@brief	HTTP错误事件
 */
typedef void(^SSHTTPFaultEvent) (NSError *error);

/**
 *	@brief	HTTP客户端
 */
@interface SSHTTPClient : NSObject

/**
 *	@brief	初始化HTTP客户端对象
 *
 *	@param 	url 	请求地址
 *
 *	@return	客户端对象
 */
- (id)initWithURL:(NSURL *)url;

/**
 *	@brief	初始化HTTP客户端对象
 *
 *	@param 	urlString 	请求地址字符串
 *
 *	@return	客户端对象
 */
- (id)initWithURLString:(NSString *)urlString;

/**
 *	@brief	初始化HTTP客户端对象
 *
 *	@param 	request 	请求对象
 *
 *	@return	客户端对象
 */
- (id)initWithRequest:(NSMutableURLRequest *)request;

/**
 *	@brief	开始请求
 *
 *  @param  resultHandler   返回事件处理
 *  @param  faultHandler    失败事件处理
 */
- (void)startWithResult:(SSHTTPResultEvent)resultHandler
                  fault:(SSHTTPFaultEvent)faultHandler;

/**
 *	@brief	取消请求
 */
- (void)cancelRequest;

/**
 *	@brief	设置请求方式
 *
 *	@param 	method 	请求方式
 */
- (void)setMethod:(NSString *)method;

/**
 *	@brief	启用Multipart形式提交
 *
 *	@return	分隔字符串
 */
- (NSString *)enableMultipart;

/**
 *	@brief	添加参数
 *
 *	@param 	name 	参数名称
 *	@param 	value 	参数值
 */
- (void)addParameterWithName:(NSString *)name value:(id)value;

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
 *	@brief	获取回复数据字符串
 *
 *	@param 	encoding 	编码
 *
 *	@return	数据字符串
 */
- (NSString *)responseString:(NSStringEncoding)encoding;

@end
