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

///#begin zh-cn
/**
 *	@brief	日期类目
 */
///#end
///#begin en
/**
 *	@brief	NSDate Category
 */
///#end
@interface NSDate (Common)


///#begin zh-cn
/**
 *	@brief	获取NSDate的年份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	年份
 */
///#end
///#begin en
/**
 *	@brief	Get the year part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	year value.
 */
///#end
+ (NSInteger)getFullYear:(NSDate *)date;

///#begin zh-cn
/**
 *	@brief	获取NSDate的月份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	月份
 */
///#end
///#begin en
/**
 *	@brief	Get the month part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	Month value.
 */
///#end
+ (NSInteger)getMonth:(NSDate *)date;

///#begin zh-cn
/**
 *	@brief	获取NSDate的日期部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	日期
 */
///#end
///#begin en
/**
 *	@brief	Get the date part of the NSDate.
 *
 *	@param 	date 	Date object.
 *
 *	@return	Date value.
 */
///#end
+ (NSInteger)getDate:(NSDate *)date;

///#begin zh-cn
/**
 *	@brief	获取NSDate的小时部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	小时
 */
///#end
///#begin en
/**
 *	@brief	Get the hour part of the NSDate.
 *
 *	@param 	date 	Date object.
 *
 *	@return	Hour value.
 */
///#end
+ (NSInteger)getHour:(NSDate *)date;

///#begin zh-cn
/**
 *	@brief	获取NSDate的分钟部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	分钟
 */
///#end
///#begin en
/**
 *	@brief	Get the minute part of the NSDate.
 *
 *	@param 	date 	Date object.
 *
 *	@return	Minute value.
 */
///#end
+ (NSInteger)getMinute:(NSDate *)date;

///#begin zh-cn
/**
 *	@brief	获取NSDate的秒部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	秒
 */
///#end
///#begin en
/**
 *	@brief	Get the seconds part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	Seconds value.
 */
///#end
+ (NSInteger)getSecond:(NSDate *)date;

///#begin zh-cn
/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *
 *	@return	日期对象
 */
///#end
///#begin en
/**
 *	@brief	According to date format convert the string to a date
 *
 *	@param 	format 	Format string.
 *	@param 	dateString 	Date string.
 *
 *	@return	Date object.
 */
///#end
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString;

///#begin zh-cn
/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *	@param 	locale 	语言环境
 *
 *	@return	日期对象
 */
///#end
///#begin en
/**
 *	@brief	According to date format convert the string to a date
 *
 *	@param 	format 	Format string.
 *	@param 	dateString 	Date string.
 *	@param 	locale 	Locale
 *
 *	@return	Date object.
 */
///#end
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale;

///#begin zh-cn
/**
 *	@brief	根据字符串格式转换日期为字符串
 *
 *	@param 	format 	日期格式字符串
 *	@param 	date 	日期对象
 *
 *	@return	日期字符串
 */
///#end
///#begin en
/**
 *	@brief	According to date format conversion date to a string
 *
 *	@param 	format 	Format string.
 *	@param 	date 	Date object.
 *
 *	@return	String object.
 */
///#end
+ (NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	According to year、month、day creation date
 *
 *	@param 	year 	Year
 *	@param 	month 	Month
 *	@param 	date 	Date
 *	@param 	hour 	Hour
 *	@param 	minute 	Minute
 *	@param 	second 	Seconds
 *
 *	@return	Date object.
 */
///#end
+ (NSDate *)dateByYear:(NSInteger)year 
                 month:(NSInteger)month 
                  date:(NSInteger)date 
                  hour:(NSInteger)hour 
                minute:(NSInteger)minute 
                second:(NSInteger)second;

@end
