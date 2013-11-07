//
//  SSDropboxShareContentEntity.h
//  DropboxConnection
//
//  Created by 冯 鸿杰 on 13-10-30.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSDropboxShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                   NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	文件对象
 */
@property (nonatomic,retain) id<ISSCAttachment> file;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
