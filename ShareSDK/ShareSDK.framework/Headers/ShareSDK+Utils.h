//
//  ShareSDK+Utils.h
//  ShareSDK
//
//  Created by vimfung on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>
#import <CommonCrypto/CommonCrypto.h>
#import "SSHTTPClient.h"

/**
 *	@brief	网络类型
 */
typedef enum
{
	SSNetworkTypeNone = 0, /**< 无网络 */
	SSNetworkTypeCellular = 1, /**< 蜂窝网络 */
    SSNetworkTypeWifi = 2, /**< wifi */
}
SSNetworkType;


/**
 *	@brief	ShareSDK工具类提供
 */
@interface ShareSDK (Utils)

#pragma mark - ViewController

/**
 *	@brief	获取当前视图控制器
 *
 *	@return	视图控制器
 */
+ (UIViewController *)currentViewController;

#pragma mark - Date

/**
 *	@brief	获取NSDate的年份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	年份
 */
+ (NSInteger)getFullYearWithDate:(NSDate *)date;

/**
 *	@brief	获取NSDate的月份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	月份
 */
+ (NSInteger)getMonthWithDate:(NSDate *)date;

/**
 *	@brief	获取NSDate的日期部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	日期
 */
+ (NSInteger)getDayWithDate:(NSDate *)date;

/**
 *	@brief	获取NSDate的小时部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	小时
 */
+ (NSInteger)getHourWithDate:(NSDate *)date;

/**
 *	@brief	获取NSDate的分钟部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	分钟
 */
+ (NSInteger)getMinuteWithDate:(NSDate *)date;

/**
 *	@brief	获取NSDate的秒部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	秒
 */
+ (NSInteger)getSecondWithDate:(NSDate *)date;


/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *
 *	@return	日期对象
 */
+ (NSDate *)dateWithFormat:(NSString *)format dateString:(NSString *)dateString;

/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *	@param 	locale 	本地化参数
 *
 *	@return	日期对象
 */
+ (NSDate *)dateWithFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale;

/**
 *	@brief	根据字符串格式转换日期为字符串
 *
 *	@param 	format 	日期格式字符串
 *	@param 	date 	日期对象
 *
 *	@return	日期字符串
 */
+ (NSString *)stringWithFormat:(NSString *)format data:(NSDate *)date;

/**
 *	@brief	根据年月日返回日期
 *
 *	@param 	year 	年份
 *	@param 	month 	月份
 *	@param 	date 	日期
 *	@param 	hour 	小时
 *	@param 	minute 	分钟
 *	@param 	second 	秒
 *
 *	@return	日期对象
 */
+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                    date:(NSInteger)date
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

#pragma mark - Color

/**
 *	@brief	获取颜色对象
 *
 *	@param 	rgb 	RGB颜色值
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;

#pragma mark - Image

/**
 *	@brief	获取图片对象
 *
 *	@param 	name 	图片名称
 *	@param 	bundleName 	Bundle名称
 *
 *	@return	图片对象
 */
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;

/**
 *	@brief	裁剪图片
 *
 *  @param  image   图片对象
 *	@param 	rect 	裁剪范围
 *
 *	@return	裁剪后的图片对象
 */
+ (UIImage *)clipImageWithImage:(UIImage *)image rect:(CGRect)rect;

/**
 *	@brief	创建圆角图片
 *
 *  @param  image   图片对象
 *	@param 	size 	圆角图像的图片尺寸
 *	@param 	ovalWidth 	圆角宽度
 *	@param 	ovalHeight 	圆角高度
 *
 *	@return	圆角图片对象引用
 */
+ (UIImage *)roundedRectImageWithImage:(UIImage *)image
                                  size:(CGSize)size
                             ovalWidth:(CGFloat)ovalWidth
                            ovalHeight:(CGFloat)ovalHeight;

#pragma mark - Device

/**
 *	@brief	比较版本字符串
 *
 *	@param 	other 	需要对比的版本号
 *
 *	@return	NSOrderedAscending 表示大于指定版本 NSOrderedSame 表示两个版本相同  NSOrderedDescending 表示小于指定版本
 */
+ (NSComparisonResult)versionStringCompare:(NSString *)other;

/**
 *	@brief	获取应用的Bundle标识
 *
 *	@return	Bundle标识
 */
+ (NSString *)bundleId;

/**
 *	@brief	获取应用版本号
 *
 *	@return	版本号
 */
+ (NSString *)appVersion;

/**
 *	@brief	获取当前网络类型
 *
 *	@return	网络类型
 */
+ (SSNetworkType)currentNetworkType;

/**
 *	@brief	获取设备型号
 *
 *	@return	设备型号
 */
+ (NSString *)deviceModel;

/**
 *	@brief	获取手机运营商代码
 *
 *	@return	手机运营商代码
 */
+ (NSString *)carrier;

#pragma mark - Http

/**
 *	@brief	创建HTTP客户端
 *
 *	@param 	request 	请求对象
 *
 *	@return	HTTP客户端对象
 */
+ (SSHTTPClient *)httpClientWithRequest:(NSMutableURLRequest *)request;

/**
 *	@brief	创建HTTP客户端
 *
 *	@param 	url 	请求URL
 *
 *	@return	HTTP客户端对象
 */
+ (SSHTTPClient *)httpClientWithURL:(NSURL *)url;

/**
 *	@brief	创建HTTP客户端
 *
 *	@param 	urlString 	请求地址字符串
 *
 *	@return	HTTP客户端对象
 */
+ (SSHTTPClient *)httpClientWithURLString:(NSString *)urlString;

#pragma mark - JSON

/**
 *	@brief	将Data转换为JSON对象
 *
 *	@param 	data 	数据
 *
 *	@return	JSON对象
 */
+ (id)jsonObjectWithData:(NSData *)data;

/**
 *	@brief	将字符串转换为JSON对象
 *
 *	@param 	string 	字符串
 *
 *	@return	JSON对象
 */
+ (id)jsonObjectWithString:(NSString *)string;

/**
 *	@brief	将对象转换为JSON字符串
 *
 *	@param 	object 	对象
 *
 *	@return	JSON字符串
 */
+ (NSString *)jsonStringWithObject:(id)object;

/**
 *	@brief	将对象转换为JSON数据
 *
 *	@param 	object 	对象
 *
 *	@return	JSON数据
 */
+ (NSData *)jsonDataWithObject:(id)object;


#pragma mark - Data

/**
 *	@brief	GZip方式压缩数据
 *
 *	@return	压缩后数据
 */
+ (NSData *)gzipWithData:(NSData *)data;

/**
 *	@brief	解压GZip数据
 *
 *	@return	解压后GZip数据
 */
+ (NSData *)uncompressGZipWithData:(NSData *)data;

/**
 *	@brief	AES128位加密
 *
 *  @param  data    需要加密数据
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  encoding    字符编码
 *
 *	@return	加密后数据
 */
+ (NSData *)dataUsingAES128EncryptWithData:(NSData *)data
                                       key:(NSString *)key
                                        iv:(NSString *)iv
                                  encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES128位解密
 *
 *  @param  data    需要解密数据
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  encoding    字符编码
 *
 *	@return	解密后数据
 */
+ (NSData *)dataUsingAES128DecryptWithData:(NSData *)data
                                       key:(NSString *)key
                                        iv:(NSString *)iv
                                  encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES128位加密
 *
 *  @param  data    需要加密数据
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  options     选项
 *
 *	@return	加密后数据
 */
+ (NSData *)dataUsingAES128EncryptWithData:(NSData *)data
                                       key:(NSData *)key
                                        iv:(NSData *)iv
                                   options:(CCOptions)options;

/**
 *	@brief	AES128位解密
 *
 *  @param  data    需要解密数据
 *	@param 	key 	密钥
 *	@param 	iv 	初始向量,允许为nil
 *  @param  options     选项
 *
 *	@return	解密后数据
 */
+ (NSData *)dataUsingAES128DecryptWithData:(NSData *)data
                                       key:(NSData *)key
                                        iv:(NSData *)iv
                                   options:(CCOptions)options;

/**
 *	@brief	使用BASE64编码数据
 *
 *  @param  data    数据
 *
 *	@return	编码后字符串
 */
+ (NSString *)stringUsingBase64EncodeWithData:(NSData *)data;


#pragma mark - String

/**
 *	@brief	URL编码
 *
 *  @param  string      需要进行URL编码字符串
 *	@param 	encoding 	编码标准
 *
 *	@return	编码后字符串
 */
+ (NSString *)urlEncodeWithString:(NSString *)string encoding:(NSStringEncoding)encoding;

/**
 *	@brief	URL解码
 *
 *  @param  string      需要进行URL解码字符串
 *	@param 	encoding 	编码标准
 *
 *	@return	解码后字符串
 */
+ (NSString *)urlDecodeWithString:(NSString *)string encoding:(NSStringEncoding)encoding;

/**
 *	@brief	使用MD5算法进行签名（16位）
 *
 *	@return	签名后字符串
 */
+ (NSString *)hexDigestStringUsingMD5WithString:(NSString *)string;

#pragma mark - Regex

/**
 *	@brief	字符串是否匹配
 *
 *	@param 	string 	字符串
 *	@param 	regex 	正则表达式
 *
 *	@return	YES 表示匹配， NO 表示不匹配
 */
+ (BOOL)isMatchWithString:(NSString *)string regex:(NSString *)regex;


@end
