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
 *	@brief  调试日志类
 */
///#end
///#begin en
/**
 *	@brief  Debug Log.
 */
///#end
@interface CMDebugLog : NSObject

///#begin zh-cn
/**
 *	@brief	获取日志保存路径
 *
 *	@return	日志路径
 */
///#end
///#begin en
/**
 *	@brief	Get log path.
 *
 *	@return	Log path.
 */
///#end
+ (NSString *)logPath;

///#begin zh-cn
/**
 *	@brief	写入信息
 *
 *	@param 	content 	内容
 */
///#end
///#begin en
/**
 *	@brief	Write info message.
 *
 *	@param 	content 	info message.
 */
///#end
+ (void)writeInfo:(NSString *)content;

///#begin zh-cn
/**
 *	@brief	写入警告
 *
 *	@param 	content 	内容
 */
///#end
///#begin en
/**
 *	@brief	Write warning message.
 *
 *	@param 	content 	Warning string.
 */
///#end
+ (void)writeWarning:(NSString *)content;

///#begin zh-cn
/**
 *	@brief	写入错误
 *
 *	@param 	content 	内容
 */
///#end
///#begin en
/**
 *	@brief	Write error message.
 *
 *	@param 	content 	Error string.
 */
///#end
+ (void)writeError:(NSString *)content;

///#begin zh-cn
/**
 *	@brief	写入内容
 *
 *	@param 	content 	内容字典对象
 */
///#end
///#begin en
/**
 *	@brief	Write log content.
 *
 *	@param 	content 	Content dictionary object.
 */
///#end
+ (void)writeContentWithDictionary:(NSDictionary *)content;


@end
