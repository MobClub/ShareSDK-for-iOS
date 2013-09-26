//
//  SSGooglePlusShareInfo.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-15.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	分享信息
 */
@interface SSGooglePlusShareInfo : SSCDataObject

/**
 *	@brief	链接
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	深链接ID
 */
@property (nonatomic,readonly) NSString *deepLinkId;

/**
 *	@brief	深链接标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	深链接描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	缩略图
 */
@property (nonatomic,readonly) NSString *thumbnail;

/**
 *	@brief	创建分享信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	分享信息
 */
+ (SSGooglePlusShareInfo *)shareInfoWithResponse:(NSDictionary *)response;


@end
