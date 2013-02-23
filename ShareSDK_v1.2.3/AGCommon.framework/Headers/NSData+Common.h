//
//  NSData+Common.h
//  Common
//
//  Created by 冯 鸿杰 on 12/8/20.
//
//

#import <Foundation/Foundation.h>

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

@end
