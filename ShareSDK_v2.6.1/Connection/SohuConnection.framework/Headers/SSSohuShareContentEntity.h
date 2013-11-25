//
//  SSSohuShareContentEntity.h
//  SohuConnection
//
//  Created by 冯 鸿杰 on 13-10-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	分享内容实体
 */
@interface SSSohuShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	书签源链接
 */
@property (nonatomic,copy) NSString *url;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void)parseWithContent:(id<ISSContent>)content;

@end
