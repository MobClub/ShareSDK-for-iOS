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
 *	@brief	NSDate Category
 */
@interface NSDate (Common)


/**
 *	@brief	Get the year part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	year value.
 */
+ (NSInteger)getFullYear:(NSDate *)date;

/**
 *	@brief	Get the month part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	Month value.
 */
+ (NSInteger)getMonth:(NSDate *)date;

/**
 *	@brief	Get the date part of the NSDate.
 *
 *	@param 	date 	Date object.
 *
 *	@return	Date value.
 */
+ (NSInteger)getDate:(NSDate *)date;

/**
 *	@brief	Get the hour part of the NSDate.
 *
 *	@param 	date 	Date object.
 *
 *	@return	Hour value.
 */
+ (NSInteger)getHour:(NSDate *)date;

/**
 *	@brief	Get the minute part of the NSDate.
 *
 *	@param 	date 	Date object.
 *
 *	@return	Minute value.
 */
+ (NSInteger)getMinute:(NSDate *)date;

/**
 *	@brief	Get the seconds part of the NSDate
 *
 *	@param 	date 	Date object.
 *
 *	@return	Seconds value.
 */
+ (NSInteger)getSecond:(NSDate *)date;

/**
 *	@brief	According to date format convert the string to a date
 *
 *	@param 	format 	Format string.
 *	@param 	dateString 	Date string.
 *
 *	@return	Date object.
 */
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString;

/**
 *	@brief	According to date format convert the string to a date
 *
 *	@param 	format 	Format string.
 *	@param 	dateString 	Date string.
 *	@param 	locale 	Locale
 *
 *	@return	Date object.
 */
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale;

/**
 *	@brief	According to date format conversion date to a string
 *
 *	@param 	format 	Format string.
 *	@param 	date 	Date object.
 *
 *	@return	String object.
 */
+ (NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date;

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
+ (NSDate *)dateByYear:(NSInteger)year 
                 month:(NSInteger)month 
                  date:(NSInteger)date 
                  hour:(NSInteger)hour 
                minute:(NSInteger)minute 
                second:(NSInteger)second;

@end
