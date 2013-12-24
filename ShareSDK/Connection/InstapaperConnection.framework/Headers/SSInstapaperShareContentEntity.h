//
//  SSInstapaperShareContentEntity.h
//  InstapaperConnection
//
//  Created by 冯 鸿杰 on 13-10-28.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSInstapaperShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                      NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	链接
 */
@property (nonatomic,copy) NSString *url;

/**
 *	@brief	标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *	@brief	描述
 */
@property (nonatomic,copy) NSString *description;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
