//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <ShareSDK/ShareSDK.h>
#import <CommonCrypto/CommonCrypto.h>
#import "SSHTTPClient.h"

/**
 *	@brief	Network type
 */
typedef enum
{
	SSNetworkTypeNone = 0, /**< 无网络 */
	SSNetworkTypeCellular = 1, /**< 蜂窝网络 */
    SSNetworkTypeWifi = 2, /**< wifi */
}
SSNetworkType;

/**
 *	@brief	ShareSDK Utils
 */
@interface ShareSDK (Utils)

#pragma mark - ViewController

/**
 *	@brief	Get current view controller.
 *
 *	@return	View controller.
 */
+ (UIViewController *)currentViewController;

#pragma mark - Date

/**
 *	@brief	Get the year part of the NSDate
 *
 *	@param 	date 	Date object
 *
 *	@return	Year
 */
+ (NSInteger)getFullYearWithDate:(NSDate *)date;

/**
 *	@brief	Get the month part of the NSDate
 *
 *	@param 	date 	Date object
 *
 *	@return	Month
 */
+ (NSInteger)getMonthWithDate:(NSDate *)date;

/**
 *	@brief	Get the date part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	Date
 */
+ (NSInteger)getDayWithDate:(NSDate *)date;

/**
 *	@brief	Get the hour part of the NSDate
 *
 *	@param 	date 	Date object
 *
 *	@return	Hour
 */
+ (NSInteger)getHourWithDate:(NSDate *)date;

/**
 *	@brief	Get the minute part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return Minute
 */
+ (NSInteger)getMinuteWithDate:(NSDate *)date;

/**
 *	@brief	Get the second part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	Seconds
 */
+ (NSInteger)getSecondWithDate:(NSDate *)date;

/**
 *	@brief	According to format string convert the string to a date
 *
 *	@param 	format 	Date format string.
 *	@param 	dateString 	Date string.
 *
 *	@return	Date object.
 */
+ (NSDate *)dateWithFormat:(NSString *)format dateString:(NSString *)dateString;

/**
 *	@brief	According to format string convert the string to a date
 *
 *	@param 	format 	Date format string.
 *	@param 	dateString 	Date string.
 *	@param 	locale 	Localization parameters
 *
 *	@return	Date object.
 */
+ (NSDate *)dateWithFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale;

/**
 *	@brief	According to string format conversion date to a string
 *
 *	@param 	format 	date format string.
 *	@param 	date 	Date object
 *
 *	@return	date string.
 */
+ (NSString *)stringWithFormat:(NSString *)format data:(NSDate *)date;

/**
 *	@brief	According to Year，month, date return date object.
 *
 *	@param 	year 	Year
 *	@param 	month 	Month
 *	@param 	date 	Date
 *	@param 	hour 	Hour
 *	@param 	minute 	Minute
 *	@param 	second 	seconds
 *
 *	@return	Date object.
 */
+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                    date:(NSInteger)date
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second;

#pragma mark - Color

/**
 *	@brief	Get color object.
 *
 *	@param 	rgb 	RGB color value.
 *
 *	@return	Color object.
 */
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;

/**
 *	@brief	Get color object.
 *
 *	@param 	rgb 	ARGB color value.
 *
 *	@return	Color object.
 */
+ (UIColor *)colorWithARGB:(NSUInteger)argb;


#pragma mark - Image

/**
 *	@brief	Get image object.
 *
 *	@param 	name 	Image name.
 *	@param 	bundleName 	Bundle name.
 *
 *	@return	Image object.
 */
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;

/**
 *	@brief	Clip Image
 *
 *  @param  image   Image object.
 *	@param 	rect 	Clip rect.
 *
 *	@return	Image object.
 */
+ (UIImage *)clipImageWithImage:(UIImage *)image rect:(CGRect)rect;

/**
 *	@brief	Create a rounded image
 *
 *  @param  image   Image object.
 *	@param 	size 	Image size.
 *	@param 	ovalWidth 	oval width
 *	@param 	ovalHeight 	oval height
 *
 *	@return	Image object.
 */
+ (UIImage *)roundedRectImageWithImage:(UIImage *)image
                                  size:(CGSize)size
                             ovalWidth:(CGFloat)ovalWidth
                            ovalHeight:(CGFloat)ovalHeight;

#pragma mark - Device

/**
 *	@brief	Compare the version string
 *
 *	@param 	other 	Version string.
 *
 *	@return	NSOrderedAscending means greater than the specified version. NSOrderedSame represent two versions of the same. NSOrderedDescending represents less than the specified version
 */
+ (NSComparisonResult)versionStringCompare:(NSString *)other;

/**
 *	@brief	Get bundle identifier.
 *
 *	@return	Bundle identifier.
 */
+ (NSString *)bundleId;

/**
 *	@brief	Get app version.
 *
 *	@return	Version string.
 */
+ (NSString *)appVersion;

/**
 *	@brief	Get current network type.
 *
 *	@return	Network type.
 */
+ (SSNetworkType)currentNetworkType;

/**
 *	@brief	Get device model.
 *
 *	@return	Device model.
 */
+ (NSString *)deviceModel;

/**
 *	@brief	Get mobile carrier code
 *
 *	@return	Mobile carrier code
 */
+ (NSString *)carrier;

#pragma mark - Http

/**
 *	@brief	Create a HTTP client.
 *
 *	@param 	request 	Request object.
 *
 *	@return	HTTP client object.
 */
+ (SSHTTPClient *)httpClientWithRequest:(NSMutableURLRequest *)request;

/**
 *	@brief	Create a HTTP client.
 *
 *	@param 	url 	Request URL object.
 *
 *	@return	HTTP client object.
 */
+ (SSHTTPClient *)httpClientWithURL:(NSURL *)url;

/**
 *	@brief	Create a HTTP client.
 *
 *	@param 	urlString 	Request url address.
 *
 *	@return	HTTP client object.
 */
+ (SSHTTPClient *)httpClientWithURLString:(NSString *)urlString;

#pragma mark - JSON

/**
 *	@brief	Converts a data to JSON object
 *
 *	@param 	data 	Data
 *
 *	@return	JSON object.
 */
+ (id)jsonObjectWithData:(NSData *)data;

/**
 *	@brief	Converts a string to JSON object
 *
 *	@param 	string 	String
 *
 *	@return	JSON object.
 */
+ (id)jsonObjectWithString:(NSString *)string;

/**
 *	@brief	Convert an object to JSON string.
 *
 *	@param 	object 	Object
 *
 *	@return	JSON string.
 */
+ (NSString *)jsonStringWithObject:(id)object;

/**
 *	@brief	Convert an object to JSON data
 *
 *	@param 	object 	Object
 *
 *	@return	JSON data.
 */
+ (NSData *)jsonDataWithObject:(id)object;


#pragma mark - Data

/**
 *	@brief	Compress data By GZip
 *
 *	@return	After compress data.
 */
+ (NSData *)gzipWithData:(NSData *)data;

/**
 *	@brief	Extracting GZip data
 *
 *	@return	After extracting data.
 */
+ (NSData *)uncompressGZipWithData:(NSData *)data;

/**
 *	@brief	AES 128-bit encryption
 *
 *  @param  data    Data
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  encoding    Encoding
 *
 *	@return	After the encrypt data.
 */
+ (NSData *)dataUsingAES128EncryptWithData:(NSData *)data
                                       key:(NSString *)key
                                        iv:(NSString *)iv
                                  encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES 128-bit dencryption
 *
 *  @param  data    Data
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  encoding    Encoding
 *
 *	@return	After the decrypt data.
 */
+ (NSData *)dataUsingAES128DecryptWithData:(NSData *)data
                                       key:(NSString *)key
                                        iv:(NSString *)iv
                                  encoding:(NSStringEncoding)encoding;

/**
 *	@brief	AES 128-bit encryption
 *
 *  @param  data    Data
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  options     Options
 *
 *	@return	After the encrypt data.
 */
+ (NSData *)dataUsingAES128EncryptWithData:(NSData *)data
                                       key:(NSData *)key
                                        iv:(NSData *)iv
                                   options:(CCOptions)options;

/**
 *	@brief	AES 128-bit decryption
 *
 *  @param  data    Data
 *	@param 	key 	Key
 *	@param 	iv 	Initial vector, which allows to nil
 *  @param  options     Options
 *
 *	@return	After the decrypt data.
 */
+ (NSData *)dataUsingAES128DecryptWithData:(NSData *)data
                                       key:(NSData *)key
                                        iv:(NSData *)iv
                                   options:(CCOptions)options;

/**
 *	@brief	Using BASE64 encoding data
 *
 *  @param  data    Data
 *
 *	@return	After the encoded string.
 */
+ (NSString *)stringUsingBase64EncodeWithData:(NSData *)data;


#pragma mark - String

/**
 *	@brief	URL encode.
 *
 *  @param  string      Needs to be URL encoded string
 *	@param 	encoding 	Encoding
 *
 *	@return	After the encoded string.
 */
+ (NSString *)urlEncodeWithString:(NSString *)string encoding:(NSStringEncoding)encoding;

/**
 *	@brief	URL decode.
 *
 *  @param  string      Needs to be URL decoded string
 *	@param 	encoding 	Encoding
 *
 *	@return	After the decoded string.
 */
+ (NSString *)urlDecodeWithString:(NSString *)string encoding:(NSStringEncoding)encoding;

/**
 *	@brief	Use MD5 signature algorithm (16-bit)
 *
 *  @param  string  Raw string.
 *
 *	@return	After the signature string
 */
+ (NSString *)hexDigestStringUsingMD5WithString:(NSString *)string;

#pragma mark - Regex

/**
 *	@brief	Whether the string matches
 *
 *	@param 	string 	String object.
 *	@param 	regex 	Regex string.
 *
 *	@return	YES means to match, NO means no match
 */
+ (BOOL)isMatchWithString:(NSString *)string regex:(NSString *)regex;


@end
