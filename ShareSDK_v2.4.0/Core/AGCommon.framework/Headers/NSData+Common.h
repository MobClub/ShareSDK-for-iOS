//
//  NSData+Common.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@interface NSData (Common)

/**
 *	@brief	使用Key进行HMAC-SHA1加密
 *
 *	@param 	key 	密钥
 *
 *	@return	加密后数据
 */
- (NSData *)dataByUsingHMacSHA1WithKey:(NSData *)key;

/**
 *	@brief	使用BASE64编码数据
 *
 *	@return	编码后字符串
 */
- (NSString *)stringWithBase64Encode;

/**
 *	@brief	获取16进制字符串
 *
 *	@return	16进制字符串
 */
- (NSString *)hexString;


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
- (NSData *)dataUsingAES128EncryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

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
- (NSData *)dataUsingAES128DecryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

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
- (NSData *)dataUsingAES128EncryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

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
- (NSData *)dataUsingAES128DecryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;


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
- (NSData *)dataUsingAES256EncryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

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
- (NSData *)dataUsingAES256DecryptWithKey:(NSString *)key
                                       iv:(NSString *)iv
                                 encoding:(NSStringEncoding)encoding;

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
- (NSData *)dataUsingAES256EncryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

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
- (NSData *)dataUsingAES256DecryptWithKey:(NSData *)key
                                       iv:(NSData *)iv
                                  options:(CCOptions)options;

/**
 *	@brief	GZip方式压缩数据
 *
 *	@return	压缩后数据
 */
- (NSData *)gzipData;

/**
 *	@brief	解压GZip数据
 *
 *	@return	解压后GZip数据
 */
- (NSData *)uncompressGZipData;

/**
 *	@brief	对数据进行MD5散列
 *
 *  @since  ver1.0.10
 *
 *	@return	MD5后的数据
 */
- (NSData *)dataByUsingMD5;


@end
