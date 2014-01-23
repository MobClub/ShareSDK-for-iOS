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
 *	@brief  Debug Log.
 */
@interface CMDebugLog : NSObject

/**
 *	@brief	Get log path.
 *
 *	@return	Log path.
 */
+ (NSString *)logPath;

/**
 *	@brief	Write info message.
 *
 *	@param 	content 	info message.
 */
+ (void)writeInfo:(NSString *)content;

/**
 *	@brief	Write warning message.
 *
 *	@param 	content 	Warning string.
 */
+ (void)writeWarning:(NSString *)content;

/**
 *	@brief	Write error message.
 *
 *	@param 	content 	Error string.
 */
+ (void)writeError:(NSString *)content;

/**
 *	@brief	Write log content.
 *
 *	@param 	content 	Content dictionary object.
 */
+ (void)writeContentWithDictionary:(NSDictionary *)content;


@end
