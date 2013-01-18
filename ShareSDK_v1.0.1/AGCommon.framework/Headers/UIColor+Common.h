//
//  UIColor+Common.h
//  Common
//
//  Created by vimfung on 12-8-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)

/**
 *	@brief	获取颜色对象
 *
 *	@param 	rgb 	RGB颜色值
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;

/**
 *	@brief	获取颜色对象
 *
 *	@param 	argb 	ARGB颜色值
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithARGB:(NSUInteger)argb;

/**
 *	@brief	获取颜色对象
 *
 *	@param 	string 	颜色描述字符串，带“＃”开头
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithString:(NSString *)string;



@end
