//
//  SSKakaoStoryShareContentEntity.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/18.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>
@interface SSKakaoStoryShareContentEntity : NSObject <ISSPlatformShareContentEntity,
                                                     NSCoding>
{
@private
    NSMutableDictionary *_dict;
}

/**
 *	@brief	分享类型
 */
@property (nonatomic, strong) NSNumber *mediaType;

/**
 *	@brief	发送内容
 */
@property (nonatomic, copy) NSString *content;

/**
 *  @brief  图片数组
 */
@property (nonatomic, strong) NSArray *images;

/**
 *	@brief	链接路径
 */
@property (nonatomic, copy) NSString *url;

/**
 *	@brief	iphone应用下载地址
 */
@property (nonatomic, copy) NSString *iphoneMarketParam;

/**
 *	@brief	安卓应用下载地址
 */
@property (nonatomic, copy) NSString *androidMarketParam;

/**
 *	@brief	 查看权限：F 表示好友可以查看，A 表示任何人可以查看，M 表示私有，默认为A
 */
@property (nonatomic, copy) NSString *permission;

/**
 *	@brief	 是否允许分享，当查看权限为好友查看时，该选项有效，可以设置内容是否允许再分享
 */
@property (nonatomic, assign) BOOL enableShare;

/**
 *	@brief	通过分享内容解析实体数据
 *
 *	@param 	content 	分享内容
 */
- (void) parseWithContent:(id<ISSContent>)content;


@end
