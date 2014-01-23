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
 *	@brief	Parameters.
 */
@protocol ISSCParameters <NSObject>

/**
 *	@brief	Add parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	value 	Parameter value.
 */
- (void)addParameter:(NSString *)name value:(id)value;

/**
 *	@brief	Add file parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	filePath 	File path.
 *  @param  mimeType    MIME type.
 */
- (void)addParameter:(NSString *)name
            filePath:(id)filePath
            mimeType:(NSString *)mimeType;

/**
 *	@brief	Add file parameter.
 *
 *	@param 	name 	Parameter name.
 *	@param 	fileName 	File name.
 *	@param 	data 	File data.
 *	@param 	mimeType 	MIME type.
 *	@param 	transferEncoding 	Transfer encoding, can be set to nil
 */
- (void)addParameter:(NSString *)name
            fileName:(NSString *)fileName
                data:(NSData *)data
            mimeType:(NSString *)mimeType
    transferEncoding:(NSString *)transferEncoding;

/**
 *	@brief	Adding multiple parameters
 *
 *	@param 	parameters 	Parameters object.
 */
- (void)addParameters:(id<ISSCParameters>)parameters;

/**
 *	@brief	Adding multiple parameters
 *
 *	@param 	dictionary 	Dicationary value.
 */
- (void)addParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	Remove all parameters.
 */
- (void)clear;

/**
 *	@brief	Get parameter value
 *
 *	@param 	name 	Parameter name.
 *
 *	@return	Paremeter value
 */
- (id)parameterWithName:(NSString *)name;

/**
 *	@brief	Get parameters number.
 *
 *	@return	Number of parameters
 */
- (NSInteger)parameterCount;

/**
 *	@brief	Get parameters dictionary.
 *
 *	@return	Dication object.
 */
- (NSDictionary *)dictionaryValue;

/**
 *	@brief	Get parameters string.
 *
 *	@param 	encoding 	Encoding.
 *
 *	@return	String object.
 */
- (NSString *)stringValue:(NSStringEncoding)encoding;

/**
 *	@brief	Get parameters binary data.
 *
 *	@param 	encoding 	Encoding.
 *
 *	@return	Binary data.
 */
- (NSData *)dataValue:(NSStringEncoding)encoding;

/**
 *	@brief	Get parameters binary data.
 *
 *	@param 	encoding 	Encoding
 *	@param 	boundary 	Boundary string for multipart forms
 *
 *	@return	 Binary data.
 */
- (NSData *)dataValue:(NSStringEncoding)encoding boundary:(NSString *)boundary;


@end
