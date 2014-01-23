//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	HTTP Parameters.
 */
@interface SSHTTPParameters : NSObject

/**
 *	@brief	Initialize HTTP Parameters.
 *
 *	@param 	url 	URL object.
 *
 *	@return	HTTP Parameters object.
 */
- (id)initWithURL:(NSURL *)url;

/**
 *	@brief	Initialize HTTP parameters.
 *
 *	@param 	queryString 	URL's query part string.
 *
 *	@return	HTTP Paremeters object.
 */
- (id)initWithQueryString:(NSString *)queryString;

/**
 *	@brief	Add parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	value 	Paremeter value.
 */
- (void)addParameterWithName:(NSString *)name value:(id)value;

/**
 *	@brief	Adding multiple parameters
 *
 *	@param 	dictionary 	Request parameters dicationary object.
 */
- (void)addParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	Add file parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	fileName 	File name.
 *	@param 	data 	File data.
 *	@param 	contentType 	MIME type.
 *	@param 	transferEncoding 	Transfer Encoding.
 */
- (void)addPostedFileWithName:(NSString *)name
                     fileName:(NSString *)fileName
                         data:(NSData *)data
                  contentType:(NSString *)contentType
             transferEncoding:(NSString *)transferEncoding;

/**
 *	@brief	Remove parameter.
 *
 *	@param 	name 	Parameter name.
 */
- (void)removeParameterWithName:(NSString *)name;

/**
 *	@brief	Get parameter value.
 *
 *	@param 	name 	Parameter name.
 *
 *	@return	Parameter value.
 */
- (id)getValueForName:(NSString *)name;

/**
 *	@brief	Remove all parameters.
 */
- (void)clear;

/**
 *	@brief	Get parameters binary data.
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	Binary data object.
 */
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding;

/**
 *	@brief	Get multipart format binary data
 *
 *	@param 	encoding 	Encoding
 *  @param  boundary    Boundary string.
 *
 *	@return	Binary data object.
 */
- (NSData *)multipartDataUsingEncoding:(NSStringEncoding)encoding boundary:(NSString *)boundary;

/**
 *	@brief	Get parameters string.
 *
 *  @param  encoding    Encoding.
 *
 *	@return	String object.
 */
- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding;

/**
 *	@brief	Get parameters dictionary.
 *
 *	@return	Dictionary object.
 */
- (NSDictionary *)dictionaryValue;

@end
