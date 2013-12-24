//
//  SSVKontakteAttachment.h
//  VKontakteConnection
//
//  Created by 冯 鸿杰 on 13-10-12.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	附件信息
 */
@interface SSVKontakteAttachment : NSObject
{
@private
    NSString *_type;
    NSString *_ownerId;
    NSString *_mediaId;
}

/**
 *	@brief	附件类型
 */
@property (nonatomic,copy) NSString *type;

/**
 *	@brief	媒体标识
 */
@property (nonatomic,copy) NSString *mediaId;

/**
 *	@brief	媒体所属用户标识
 */
@property (nonatomic,copy) NSString *ownerId;

/**
 *	@brief	创建附件信息
 *
 *	@param 	type 	附件类型
 *	@param 	mediaId 	媒体标识
 *	@param 	ownerId 	媒体所属用户标识
 *
 *	@return	附件信息
 */
+ (SSVKontakteAttachment *)attachmentWithType:(NSString *)type
                                      mediaId:(NSString *)mediaId
                                      ownerId:(NSString *)ownerId;


@end
