//
//  Debug.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief  调试日志类
 */
@interface CMDebugLog : NSObject

/**
 *	@brief	获取日志保存路径
 *
 *	@return	日志路径
 */
+ (NSString *)logPath;


/**
 *	@brief	写入信息
 *
 *	@param 	content 	内容
 */
+ (void)writeInfo:(NSString *)content;

/**
 *	@brief	写入警告
 *
 *	@param 	content 	内容
 */
+ (void)writeWarning:(NSString *)content;

/**
 *	@brief	写入错误
 *
 *	@param 	content 	内容
 */
+ (void)writeError:(NSString *)content;

/**
 *	@brief	写入内容
 *
 *	@param 	content 	内容字典对象
 */
+ (void)writeContentWithDictionary:(NSDictionary *)content;


@end
