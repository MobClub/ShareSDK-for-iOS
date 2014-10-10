//
//  SSKakaoStoryShareContentEntity.h
//  KakaoStoryConnection
//
//  Created by ljh on 14-7-28.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体：用于决定分享时的内容
 */
@interface SSKakaoStoryShareContentEntity : NSObject<ISSPlatformShareContentEntity,
NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	分享类型
 */
@property (nonatomic, retain) NSNumber *mediaType;

/**
 *	@brief	分享内容
 */
@property (nonatomic, copy) NSString *content;

/**
 *	@brief	标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *	@brief	描述
 */
@property (nonatomic, copy)NSString *description;

/**
 *	@brief	配图
 */
@property (nonatomic, retain) id<ISSCAttachment> image;

/**
 *	@brief	应用名
 */
@property (nonatomic, copy) NSString *appName;

/**
 *	@brief	应用版本
 */
@property (nonatomic, copy) NSString *appVersion;

/**
 *	@brief  appBundleID
 */
@property (nonatomic, copy) NSString *appBundleID;

/**
 *	@brief	文件地址
 */
@property (nonatomic, copy) NSString *fileUrl;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;


@end
