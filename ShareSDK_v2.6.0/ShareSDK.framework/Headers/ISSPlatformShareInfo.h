//
//  ISSPlatformShareInfo.h
//  ShareSDK
//
//  Created by vimfung on 13-10-14.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
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
