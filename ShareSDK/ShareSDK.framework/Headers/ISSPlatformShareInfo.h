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
 *	@brief	分享信息协议
 */
@protocol ISSPlatformShareInfo <NSObject>

@required

/**
 *	@brief	获取分享信息的原始数据,与各平台定义结构一致
 *
 *	@return	原始数据
 */
- (NSDictionary *)sourceData;

/**
 *	@brief	获取分享信息标识
 *
 *	@return	分享信息标识
 */
- (NSString *)sid;

/**
 *	@brief	获取分享内容
 *
 *	@return	分享内容
 */
- (NSString *)text;

/**
 *	@brief	获取分享的链接列表
 *
 *	@return	链接列表数组
 */
- (NSArray *)urls;

/**
 *	@brief	获取分享的图片列表
 *
 *	@return	图片列表数组
 */
- (NSArray *)imgs;

/**
 *	@brief	获取扩展信息
 *
 *	@return	扩展信息
 */
- (NSDictionary *)extInfo;

@end
