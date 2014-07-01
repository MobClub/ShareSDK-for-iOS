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
 *	@brief	NSString Category
 */
@interface NSString (Common)

/**
 *	@brief	Get GUID string.
 *
 *	@return	GUID string.
*/
+ (NSString *)guidString;

/**
 *	@brief	compare version string.
 *
 *	@param 	other 	Need to compare the version string.
 *
 *	@return NSOrderedAscending means greater than the specified version.
 *          NSOrderedSame means two versions of the same.
 *          NSOrderedDescending means less than the specified version
 */
- (NSComparisonResult)versionStringCompare:(NSString *)other;

/**
 *	@brief	Use SHA1 encryption
 *
 *  @since  ver1.0.6
 *
 *	@return	The encrypted string.
 */
- (NSString *)sha1String;

/**
 *	@brief	Use MD5 encryption (16-bit)
 *
 *	@return	The encrypted string.
 */
- (NSString *)md5HexDigestString;

/**
 *	@brief	Use MD5 encryption (32-bit)
 *
 *	@return	The encrypted string.
 */
- (NSString *)md5DHexDigestString;

/**
 *	@brief	Use HMac-SHA1 encryption.
 *
 *	@param 	key 	Key
 *
 *	@return	The encrypted string.
 */
- (NSString *)hmacSha1StringWithKey:(NSString *)key;

/**
 *	@brief	Use HMac-SHA1 encryption.
 *
 *	@param 	key 	Key
 *
 *	@return	The encrypted data.
 */
- (NSData *)dataUsinghmacSha1StringWithKey:(NSString *)key;

/**
 *	@brief	Determine whether the URL string
 *
 *	@return	YES：is URL string. NO：Not a URL string.
 */
- (BOOL)isURLString;

/**
 *	@brief	To determine whether a string contains a URL
 *
 *	@return	YES indicates contains; NO indicates not contains.
 */
- (BOOL)containURL;

/**
 *	@brief	use URL encode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The encode string.
 */
- (NSString *)urlEncode:(NSStringEncoding)encoding;

/**
 *	@brief	use URL decode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The decode string.
 */
- (NSString *)urlDecode:(NSStringEncoding)encoding;

/**
 *	@brief	use BASE64 encode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The encode string.
 */
- (NSString *)base64Encode:(NSStringEncoding)encoding;

/**
 *	@brief	use BASE64 decode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The decode string.
 */
- (NSString *)base64Decode:(NSStringEncoding)encoding;

/**
 *	@brief	Get Pinyin string
 *
 *	@return	Pinyin string.
 */
- (NSString *)pinyinString;

/**
 *	@brief	Get the first characters the Pinyin of the first letter
 *
 *	@return	The Pinyin of the first letter
 */
- (NSString *)pinyinFirstLetter;

/**
 *	@brief	Converted to hexadecimal
 *
 *	@return	Hexadecimal value.
 */
- (long long)hexValue;

/**
 *	@brief	Convert hex string to NSData
 *
 *	@return	Binary data object.
 */
- (NSData *)dataForHexString;

/**
 *	@brief	Use Base64 decode
 *
 *	@return	Binary data object.
 */
- (NSData *)dataUsingBase64Decode;


@end
