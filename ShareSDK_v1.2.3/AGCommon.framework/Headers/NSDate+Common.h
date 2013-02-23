//
//  NSDate+Additions.h
//  MeYou
//
//  Created by hower on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Common)

/**
 *	@brief	获取NSDate的年份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	年份
 */
+ (NSInteger)getFullYear:(NSDate *)date;

/**
 *	@brief	获取NSDate的月份部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	月份
 */
+ (NSInteger)getMonth:(NSDate *)date;

/**
 *	@brief	获取NSDate的日期部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	日期
 */
+ (NSInteger)getDate:(NSDate *)date;

/**
 *	@brief	获取NSDate的小时部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	小时
 */
+ (NSInteger)getHour:(NSDate *)date;

/**
 *	@brief	获取NSDate的分钟部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	分钟
 */
+ (NSInteger)getMinute:(NSDate *)date;

/**
 *	@brief	获取NSDate的秒部分
 *
 *	@param 	date 	日期对象
 *
 *	@return	秒
 */
+ (NSInteger)getSecond:(NSDate *)date;


/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *
 *	@return	日期对象
 */
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString;

/**
 *	@brief	根据字符串格式转换字符串为日期
 *
 *	@param 	format 	日期格式字符串
 *	@param 	dateString 	日期字符串
 *	@param 	locale 	本地化参数
 *
 *	@return	日期对象
 */
+ (NSDate *)dateByStringFormat:(NSString *)format dateString:(NSString *)dateString locale:(NSLocale *)locale;

/**
 *	@brief	根据字符串格式转换日期为字符串
 *
 *	@param 	format 	日期格式字符串
 *	@param 	date 	日期对象
 *
 *	@return	日期字符串
 */
+ (NSString *)stringByStringFormat:(NSString *)format data:(NSDate *)date;

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
+ (NSDate *)dateByYear:(NSInteger)year 
                 month:(NSInteger)month 
                  date:(NSInteger)date 
                  hour:(NSInteger)hour 
                minute:(NSInteger)minute 
                second:(NSInteger)second;

@end
