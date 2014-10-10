//
//  SSKakaoTalkShareContentEntity.h
//  KakaoTalkConnection
//
//  Created by @刘靖煌 on 14-7-1.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSKakaoTalkShareContentEntity : NSObject<ISSPlatformShareContentEntity,
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
@property (nonatomic, copy) NSString *message;

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
 *	@brief	iOS下载地址
 */
@property (nonatomic, copy) NSString *iosDownLoadUrl;

/**
 *	@brief	Android下载地址
 */
@property (nonatomic, copy) NSString *androidDownLoadUrl;

/**
 *	@brief	执行URL
 */
@property (nonatomic, copy) NSString *executeUrl;

/**
 *	@brief	标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *	@brief	链接
 */
@property (nonatomic, copy) NSString *url;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
