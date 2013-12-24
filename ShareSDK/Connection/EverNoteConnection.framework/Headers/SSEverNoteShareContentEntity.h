//
//  SSEverNoteShareContentEntity.h
//  EverNoteConnection
//
//  Created by vimfung on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSEverNoteShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                    NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	内容
 */
@property (nonatomic,copy) NSString *content;

/**
 *	@brief	标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *	@brief	图片资源列表,元素为ISSAttachment协议对象
 */
@property (nonatomic,retain) NSArray *resources;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
