
#import <Foundation/Foundation.h>

///#begin zh-cn
/**
 *	@brief	字符串类目
 */
///#end
///#begin en
/**
 *	@brief	NSString Category
 */
///#end
@interface NSString (Common)

///#begin zh-cn
/**
 *	@brief	获取GUID字符串
 *
 *	@return	GUID字符串
 */
///#end
///#begin en
/**
 *	@brief	Get GUID string.
 *
 *	@return	GUID string.
*/
///#end
+ (NSString *)guidString;

///#begin zh-cn
/**
 *	@brief	比较版本字符串
 *
 *	@param 	other 	需要对比的版本号
 *
 *	@return	NSOrderedAscending 表示大于指定版本 NSOrderedSame 表示两个版本相同  NSOrderedDescending 表示小于指定版本
 */
///#end
///#begin en
/**
 *	@brief	compare version string.
 *
 *	@param 	other 	Need to compare the version string.
 *
 *	@return NSOrderedAscending means greater than the specified version.
 *          NSOrderedSame means two versions of the same.
 *          NSOrderedDescending means less than the specified version
 */
///#end
- (NSComparisonResult)versionStringCompare:(NSString *)other;

///#begin zh-cn
/**
 *	@brief	使用SHA1算法进行签名
 *
 *  @since  ver1.0.6
 *
 *	@return	签名后字符串
 */
///#end
///#begin en
/**
 *	@brief	Use SHA1 encryption
 *
 *  @since  ver1.0.6
 *
 *	@return	The encrypted string.
 */
///#end
- (NSString *)sha1String;

///#begin zh-cn
/**
 *	@brief	使用MD5算法进行签名（16位）
 *
 *	@return	签名后字符串
 */
///#end
///#begin en
/**
 *	@brief	Use MD5 encryption (16-bit)
 *
 *	@return	The encrypted string.
 */
///#end
- (NSString *)md5HexDigestString;

///#begin zh-cn
/**
 *	@brief	使用MD5算法进行签名（32位）
 *
 *	@return	签名后字符串
 */
///#end
///#begin en
/**
 *	@brief	Use MD5 encryption (32-bit)
 *
 *	@return	The encrypted string.
 */
///#end
- (NSString *)md5DHexDigestString;

///#begin zh-cn
/**
 *	@brief	使用HMac-SHA1进行签名
 *
 *	@param 	key 	密钥
 *
 *	@return	签名后字符串
 */
///#end
///#begin en
/**
 *	@brief	Use HMac-SHA1 encryption.
 *
 *	@param 	key 	Key
 *
 *	@return	The encrypted string.
 */
///#end
- (NSString *)hmacSha1StringWithKey:(NSString *)key;

///#begin zh-cn
/**
 *	@brief	使用HMac-SHA1进行签名
 *
 *	@param 	key 	密钥
 *
 *	@return	签名后的数据
 */
///#end
///#begin en
/**
 *	@brief	Use HMac-SHA1 encryption.
 *
 *	@param 	key 	Key
 *
 *	@return	The encrypted data.
 */
///#end
- (NSData *)dataUsinghmacSha1StringWithKey:(NSString *)key;

///#begin zh-cn
/**
 *	@brief	判断是否为URL字符串
 *
 *	@return	YES：是 NO：否
 */
///#end
///#begin en
/**
 *	@brief	Determine whether the URL string
 *
 *	@return	YES：is URL string. NO：Not a URL string.
 */
///#end
- (BOOL)isURLString;

///#begin zh-cn
/**
 *	@brief	判断是否包含URL字符串
 *
 *	@return	YES 是 NO 否
 */
///#end
///#begin en
/**
 *	@brief	To determine whether a string contains a URL
 *
 *	@return	YES indicates contains; NO indicates not contains.
 */
///#end
- (BOOL)containURL;

///#begin zh-cn
/**
 *	@brief	URL编码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	编码后字符串
 */
///#end
///#begin en
/**
 *	@brief	use URL encode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The encode string.
 */
///#end
- (NSString *)urlEncode:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	URL解码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	解码后字符串
 */
///#end
///#begin en
/**
 *	@brief	use URL decode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The decode string.
 */
///#end
- (NSString *)urlDecode:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	BASE64编码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	编码后字符串
 */
///#end
///#begin en
/**
 *	@brief	use BASE64 encode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The encode string.
 */
///#end
- (NSString *)base64Encode:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	BASE64解码
 *
 *	@param 	encoding 	编码标准
 *
 *	@return	解码后字符串
 */
///#end
///#begin en
/**
 *	@brief	use BASE64 decode
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	The decode string.
 */
///#end
- (NSString *)base64Decode:(NSStringEncoding)encoding;

///#begin zh-cn
/**
 *	@brief	取得汉字拼音字符串
 *
 *	@return	拼音字符串
 */
///#end
///#begin en
/**
 *	@brief	Get Pinyin string
 *
 *	@return	Pinyin string.
 */
///#end
- (NSString *)pinyinString;

///#begin zh-cn
/**
 *	@brief	取得第一个汉字的拼音首字母
 *
 *	@return	拼音首字母
 */
///#end
///#begin en
/**
 *	@brief	Get the first characters the Pinyin of the first letter
 *
 *	@return	The Pinyin of the first letter
 */
///#end
- (NSString *)pinyinFirstLetter;

///#begin zh-cn
/**
 *	@brief	转换为16进制数
 *
 *	@return	16进制数
 */
///#end
///#begin en
/**
 *	@brief	Converted to hexadecimal
 *
 *	@return	Hexadecimal value.
 */
///#end
- (long long)hexValue;

///#begin zh-cn
/**
 *	@brief	转换16进制字符串为NSData
 *
 *	@return	二进制数据对象
 */
///#end
///#begin en
/**
 *	@brief	Convert hex string to NSData
 *
 *	@return	Binary data object.
 */
///#end
- (NSData *)dataForHexString;

///#begin zh-cn
/**
 *	@brief	使用Base64进行解码得到二进制数据对象
 *
 *	@return	二进制数据对象
 */
///#end
///#begin en
/**
 *	@brief	Use Base64 decode
 *
 *	@return	Binary data object.
 */
///#end
- (NSData *)dataUsingBase64Decode;


@end
