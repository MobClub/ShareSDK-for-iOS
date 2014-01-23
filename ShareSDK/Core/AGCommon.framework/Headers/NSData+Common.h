//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

/**
 *	@brief	NSData Category.
 */
@interface NSData (Common)


/**
 *	@brief	Using HMAC-SHA1 encryption with key.
 *
 *	@param 	key 	Key
 *
 *	@return	The encrypted data.
 */
- (NSData *)dataByUsingHMacSHA1WithKey:(NSData *)key;

/**
 *	@brief	Using BASE64 encoding data
 *
 *	@return	The encoded string.
 */
- (NSString *)stringWithBase64Encode;

/**
 *	@brief	Get a hexadecimal string
 *
 *	@return	Hexadecimal string
 */
- (NSString *)hexString;

/**
 *	@brief	AES 128-bit encryption
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  encoding    Encoding
 *
 *	@return	The encrypted data.
 */
- (NSData *)dataUsingAES128EncryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES 128-bit decryption
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  encoding    Encoding
 *
 *	@return	The ecrypted data.
 */
- (NSData *)dataUsingAES128DecryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES 128-bit encryption
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  options     Options
 *
 *	@return	The encrypted data.
 */
- (NSData *)dataUsingAES128EncryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

/**
 *	@brief	AES 128-bit decryption
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	Key
 *	@param 	iv Initial vector, which allows to nil
 *  @param  options     Options
 *
 *	@return	The decrypted data.
 */
- (NSData *)dataUsingAES128DecryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

/**
 *	@brief	AES 256-bit encryption
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  encoding    Encoding
 *
 *	@return	The encrypted data.
 */
- (NSData *)dataUsingAES256EncryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES 256-bit decryption
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  encoding    Encoding
 *
 *	@return	The decrypted data.
 */
- (NSData *)dataUsingAES256DecryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES 256-bit encryption
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  options     Options
 *
 *	@return	The encrypted data.
 */
- (NSData *)dataUsingAES256EncryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

/**
 *	@brief	AES 256-bit decryption
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  options     Options
 *
 *	@return	The decrypted data.
 */
- (NSData *)dataUsingAES256DecryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

/**
 *	@brief	Compress data by GZip
 *
 *	@return	The compressed data.
 */
- (NSData *)gzipData;

/**
 *	@brief	Decompress GZip data
 *
 *	@return	The decompressed data.
 */
- (NSData *)uncompressGZipData;

/**
 *	@brief	MD5 hash for data
 *
 *  @since  ver1.0.10
 *
 *	@return	Data object.
 */
- (NSData *)dataByUsingMD5;


@end
