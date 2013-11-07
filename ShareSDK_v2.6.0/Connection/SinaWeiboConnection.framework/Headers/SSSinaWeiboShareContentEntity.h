//
//  SSSinaWeiboShareContentEntity.h
//  SinaWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-17.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSSinaWeiboShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                     NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	分享内容
 */
@property (nonatomic,copy) NSString *content;

/**
 *	@brief	分享图片
 */
@property (nonatomic,retain) id<ISSCAttachment> image;

/**
 *	@brief	地理位置信息
 */
@property (nonatomic,retain) SSCLocationCoordinate2D *locationCoordinate;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
