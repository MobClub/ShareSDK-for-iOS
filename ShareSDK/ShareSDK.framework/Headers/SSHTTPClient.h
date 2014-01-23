//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSHTTPParameters.h"

/**
 *	@brief	HTTP result event.
 */
typedef void(^SSHTTPResultEvent) (NSHTTPURLResponse *response, NSData *responseData);

/**
 *	@brief	HTTP fault event.
 */
typedef void(^SSHTTPFaultEvent) (NSError *error);

/**
 *	@brief	HTTP Client
 */
@interface SSHTTPClient : NSObject

/**
 *	@brief	Initialize HTTP Client.
 *
 *	@param 	url 	Request URL object.
 *
 *	@return	HTTP Client object.
 */
- (id)initWithURL:(NSURL *)url;

/**
 *	@brief	Initialize HTTP Client.
 *
 *	@param 	urlString 	Request URL string.
 *
 *	@return	HTTP Client object.
 */
- (id)initWithURLString:(NSString *)urlString;

/**
 *	@brief	Initialize HTTP Client.
 *
 *	@param 	request 	Request object.
 *
 *	@return	HTTP client object.
 */
- (id)initWithRequest:(NSMutableURLRequest *)request;

/**
 *	@brief	Start request.
 *
 *  @param  resultHandler   Result handler.
 *  @param  faultHandler    Fault handler.
 */
- (void)startWithResult:(SSHTTPResultEvent)resultHandler
                  fault:(SSHTTPFaultEvent)faultHandler;

/**
 *	@brief	Cancel request.
 */
- (void)cancelRequest;

/**
 *	@brief	Set request method.
 *
 *	@param 	method 	Request method.
 */
- (void)setMethod:(NSString *)method;

/**
 *	@brief	Enable Multipart forms submitted
 *
 *	@return	Boundary string.
 */
- (NSString *)enableMultipart;

/**
 *	@brief	Add parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	value 	Parameter value.
 */
- (void)addParameterWithName:(NSString *)name value:(id)value;

/**
 *	@brief	Add file parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	fileName 	File name.
 *	@param 	data 	File data.
 *	@param 	contentType 	MIME Type.
 *	@param 	transferEncoding 	Transfer Encoding.
 */
- (void)addPostedFileWithName:(NSString *)name
                     fileName:(NSString *)fileName
                         data:(NSData *)data
                  contentType:(NSString *)contentType
             transferEncoding:(NSString *)transferEncoding;

/**
 *	@brief	Get response string.
 *
 *	@param 	encoding 	Encoding.
 *
 *	@return	Response string.
 */
- (NSString *)responseString:(NSStringEncoding)encoding;

@end
