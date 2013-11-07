//
//  SSGooglePlusShareContentEntity.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSGooglePlusShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                      NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	内容
 */
@property (nonatomic,copy) NSString *text;

/**
 *	@brief	图片
 */
@property (nonatomic,copy) id<ISSCAttachment> image;

/**
 *	@brief	链接
 */
@property (nonatomic,copy) NSString *url;

/**
 *	@brief	深链接描述
 */
@property (nonatomic,copy) NSString *description;

/**
 *	@brief	深链接标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *	@brief	缩略图
 */
@property (nonatomic,retain) NSString *thumbnail;

/**
 *	@brief	深链接ID
 */
@property (nonatomic,copy) NSString *deepLinkId;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
