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
 *	@brief	HTTP Request Parameters
 */
@interface CMHTTPRequestParameters : NSObject
{
@private
    NSMutableDictionary *_parameterDict;
}

/**
 *	@brief	Parameter dicationary.
 */
@property (nonatomic,readonly) NSDictionary *parameterDictionary;

/**
 *	@brief	Initialize parameter.
 *
 *	@param 	url 	The URL object.
 *
 *	@return	Request parameter object.
 */
- (id)initWithURL:(NSURL *)url;

/**
 *	@brief	Initialize parameter.
 *
 *	@param 	queryString 	The URL query string.
 *
 *	@return	Request Parameter object.
 */
- (id)initWithQueryString:(NSString *)queryString;

/**
 *	@brief	Add parameter.
 *
 *	@param 	name 	Name
 *	@param 	value 	Value
 */
- (void)addParameterWithName:(NSString *)name value:(id)value;

/**
 *	@brief	Adding multiple parameters
 *
 *  @since  ver1.0.8
 *
 *	@param 	parameters 	Parameters object.
 */
- (void)addParameters:(CMHTTPRequestParameters *)parameters;

/**
 *	@brief	Adding multiple parameters
 *
 *  @since  ver1.0.8
 *
 *	@param 	dictionary 	Parameters dicationary object.
 */
- (void)addParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	Remove a parameter.
 *
 *	@param 	name 	Name.
 */
- (void)removeParameterWithName:(NSString *)name;

/**
 *	@brief	Get parameter value.
 *
 *	@param 	name 	Name.
 *
 *	@return	Value.
 */
- (id)getValueForName:(NSString *)name;

/**
 *	@brief	Remove all parameters.
 */
- (void)clear;

/**
 *	@brief	Get request parameters binary data.
 *
 *	@param 	encoding 	Encoding.
 *
 *	@return	Binary data object.
 */
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding;

/**
 *	@brief	Get binary data of multipart form.
 *
 *	@param 	encoding 	Encoding
 *  @param  boundary    Boundary string.
 *
 *	@return	Binary data object.
 */
- (NSData *)multipartDataUsingEncoding:(NSStringEncoding)encoding boundary:(NSString *)boundary;

/**
 *	@brief	Get request parameters string.
 *
 *  @param  encoding    Encoding
 *
 *	@return	String object.
 */
- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding;

@end
