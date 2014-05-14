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

#import <UIKit/UIKit.h>

///#begin zh-cn
/**
 *	@brief	颜色类目
 */
///#end
///#begin en
/**
 *	@brief	UIColor Category.
 */
///#end
@interface UIColor (Common)


///#begin zh-cn
/**
 *	@brief	获取颜色对象
 *
 *	@param 	rgb 	RGB颜色值
 *
 *	@return	颜色对象
 */
///#end
///#begin en
/**
 *	@brief	Get color object.
 *
 *	@param 	rgb 	RGB color value.
 *
 *	@return	Color object.
 */
///#end
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;

///#begin zh-cn
/**
 *	@brief	获取颜色对象
 *
 *	@param 	argb 	ARGB颜色值
 *
 *	@return	颜色对象
 */
///#end
///#begin en
/**
 *	@brief	Get color object.
 *
 *	@param 	argb 	ARGB color value.
 *
 *	@return	Color object.
 */
///#end
+ (UIColor *)colorWithARGB:(NSUInteger)argb;

///#begin zh-cn
/**
 *	@brief	获取颜色对象
 *
 *	@param 	string 	颜色描述字符串，带“＃”开头
 *
 *	@return	颜色对象
 */
///#end
///#begin en
/**
 *	@brief	Get color object
 *
 *	@param 	string 	Color description string beginning with "#"
 *
 *	@return	Color object.
 */
///#end
+ (UIColor *)colorWithString:(NSString *)string;



@end
