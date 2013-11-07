//
//  SSYouDaoNoteShareContentEntity.h
//  YouDaoNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSYouDaoNoteShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                      NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	内容
 */
@property (nonatomic, copy) NSString *content;

/**
 *	@brief	标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *	@brief	作者
 */
@property (nonatomic, copy) NSString *author;

/**
 *	@brief	来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *	@brief	附件列表
 */
@property (nonatomic, retain) NSArray *attachments;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
