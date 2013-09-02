//
//  NSString+Common.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)

/**
 *	@brief	获取GUID字符串
 *
 *	@return	GUID字符串
 */
+ (NSString *)guidString;

/**
 *	@brief	比较版本字符串
 *
 *	@param 	other 	需要对比的版本号
 *
 *	@return	NSOrderedAscending 表示大于指定版本 NSOrderedSame 表示两个版本相同  NSOrderedDescending 表示小于指定版本
 */
- (NSComparisonResult)versionStringCompare:(NSString *)other;

/**
 *	@brief	使用SHA1算法进行签名
 *
 *  @since  ver1.0.6
 *
 *	@return	签名后字符串
 */
- (NSString *)sha1String;

/**
 *	@brief	使用MD5算法进行签名（16位）
 *
 *	@return	签名后字符串
 */
- (NSString *)md5HexDigestString;

/**
 *	@brief	使用MD5算法进行签名（32位）
 *
 *	@return	签名后字符串
 */
- (NSString *)md5DHexDigestString;

/**
 *	@brief	使用HMac-SHA1进行签名
 *
 *	@param 	key 	密钥
 *
 *	@return	签名后字符串
 */
- (NSString *)hmacSha1StringWithKey:(NSString *)key;

/**
 *	@brief	使用HMac-SHA1进行签名
 *
 *	@param 	key 	密钥
 *
 *	@return	签名后的数据
 */
- (NSData *)dataUsinghmacSha1StringWithKey:(NSString *)key;

/**
 *	@brief	判断是否为URL字符串
 *
 *	@return	YES：是 NO：否
 */
- (BOOL)isURLString;

/**
 *	@brief	判断是否包含URL字符串
 *
 *	@return	YES 是 NO 否
 */
- (BOOL)containURL;


/**
 *	@brief	URL编码
 *
 *	@param 	encoding 	编码标准｀
 *
 *	@return	编码后字符串
 */
- (NSString *)urlEncode:(NSStringEncoding)encoding;

/**
 *	@brief	URL解码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	解码后字符串
 */
- (NSString *)urlDecode:(NSStringEncoding)encoding;


/**
 *	@brief	BASE64编码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	编码后字符串
 */
- (NSString *)base64Encode:(NSStringEncoding)encoding;

/**
 *	@brief	BASE64解码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	解码后字符串
 */
- (NSString *)base64Decode:(NSStringEncoding)encoding;

/**
 *	@brief	取得汉字拼音字符串
 *
 *	@return	拼音字符串
 */
- (NSString *)pinyinString;

/**
 *	@brief	取得第一个汉字的拼音首字母
 *
 *	@return	拼音首字母
 */
- (NSString *)pinyinFirstLetter;

/**
 *	@brief	转换为16进制数
 *
 *	@return	16进制数
 */
- (long long)hexValue;

/**
 *	@brief	转换16进制字符串为NSData
 *
 *	@return	二进制数据对象
 */
- (NSData *)dataForHexString;

/**
 *	@brief	使用Base64进行解码得到二进制数据对象
 *
 *	@return	二进制数据对象
 */
- (NSData *)dataUsingBase64Decode;


@end
