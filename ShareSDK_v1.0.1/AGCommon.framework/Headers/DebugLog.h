//
//  Debug.h
//  CommonModule
//
//  Created by 冯 鸿杰 on 12-10-27.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief  调试日志类
 */
@interface DebugLog : NSObject

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
