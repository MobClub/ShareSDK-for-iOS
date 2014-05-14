///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

///#begin zh-cn
/**
 *	@brief	NSData类目
 */
///#end
///#begin en
/**
 *	@brief	NSData Category.
 */
///#end
@interface NSData (Common)


///#begin zh-cn
/**
 *	@brief	使用Key进行HMAC-SHA1加密
 *
 *	@param 	key 	密钥
 *
 *	@return	加密后数据
 */
///#end
///#begin en
/**
 *	@brief	Using HMAC-SHA1 encryption with key.
 *
 *	@param 	key 	Key
 *
 *	@return	The encrypted data.
 */
///#end
- (NSData *)dataByUsingHMacSHA1WithKey:(NSData *)key;

///#begin zh-cn
/**
 *	@brief	使用BASE64编码数据
 *
 *	@return	编码后字符串
 */
///#end
///#begin en
/**
 *	@brief	Using BASE64 encoding data
 *
 *	@return	The encoded string.
 */
///#end
- (NSString *)stringWithBase64Encode;

///#begin zh-cn
/**
 *	@brief	获取16进制字符串
 *
 *	@return	16进制字符串
 */
///#end
///#begin en
/**
 *	@brief	Get a hexadecimal string
 *
 *	@return	Hexadecimal string
 */
///#end
- (NSString *)hexString;

///#begin zh-cn
/**
 *	@brief	AES128位加密
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  encoding    字符编码
 *
 *	@return	加密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES128EncryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	AES128位解密
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  encoding    字符编码
 *
 *	@return	解密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES128DecryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	AES128位加密
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  options     选项
 *
 *	@return	加密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES128EncryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

///#begin zh-cn
/**
 *	@brief	AES128位解密
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  options     选项
 *
 *	@return	解密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES128DecryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

///#begin zh-cn
/**
 *	@brief	AES256位加密
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  encoding    字符编码
 *
 *	@return	加密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES256EncryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	AES256位解密
 *
 *  @since  ver1.0.6
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  encoding    字符编码
 *
 *	@return	解密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES256DecryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	AES256位加密
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  options     选项
 *
 *	@return	加密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES256EncryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

///#begin zh-cn
/**
 *	@brief	AES256位解密
 *
 *  @since  ver1.0.11
 *
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  options     选项
 *
 *	@return	解密后数据
 */
///#end
///#begin en
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
///#end
- (NSData *)dataUsingAES256DecryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

///#begin zh-cn
/**
 *	@brief	GZip方式压缩数据
 *
 *	@return	压缩后数据
 */
///#end
///#begin en
/**
 *	@brief	Compress data by GZip
 *
 *	@return	The compressed data.
 */
///#end
- (NSData *)gzipData;

///#begin zh-cn
/**
 *	@brief	解压GZip数据
 *
 *	@return	解压后GZip数据
 */
///#end
///#begin en
/**
 *	@brief	Decompress GZip data
 *
 *	@return	The decompressed data.
 */
///#end
- (NSData *)uncompressGZipData;

///#begin zh-cn
/**
 *	@brief	对数据进行MD5散列
 *
 *  @since  ver1.0.10
 *
 *	@return	MD5后的数据
 */
///#end
///#begin en
/**
 *	@brief	MD5 hash for data
 *
 *  @since  ver1.0.10
 *
 *	@return	Data object.
 */
///#end
- (NSData *)dataByUsingMD5;


@end
