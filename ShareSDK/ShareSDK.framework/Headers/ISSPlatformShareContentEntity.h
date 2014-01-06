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
 *	@brief	分享内容实体协议，用于传递给各个平台进行分享的原始数据
 */
@protocol ISSPlatformShareContentEntity <NSObject>

@required

/**
 *	@brief	获取字段值
 *
 *	@param 	name 	字段名称
 *
 *	@return	字段值
 */
- (id)fieldForName:(NSString *)name;

/**
 *	@brief	设置字段值
 *
 *	@param 	field 	字段值
 *	@param 	name 	名称
 */
- (void)setField:(id)field forName:(NSString *)name;

@end
