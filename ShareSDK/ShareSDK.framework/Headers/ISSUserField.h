//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ShareSDKTypeDef.h"

/**
 *	@brief	用户信息字段
 */
@protocol ISSUserField <NSObject>

/**
 *	@brief	获取字段值
 *
 *	@return	字段值
 */
- (id)value;

/**
 *	@brief	设置字段值
 *
 *	@param 	value 	字段值
 */
- (void)setValue:(NSString *)value;

/**
 *	@brief	获取字段类型
 *
 *	@return	字段类型
 */
- (SSUserFieldType)type;

/**
 *	@brief	设置字段类型
 *
 *	@param 	type 	字段类型
 */
- (void)setType:(SSUserFieldType)type;



@end
