//
//  SSVKontaktePost.h
//  VKontakteConnection
//
//  Created by 冯 鸿杰 on 13-10-12.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	文章信息
 */
@interface SSVKontaktePost : NSObject <ISSPlatformShareInfo,
                                       NSCoding,
                                       ISSCDataObject>

{
@private
    NSDictionary *_sourceData;
    NSString *_sid;
    NSString *_text;
    NSArray *_urls;
    NSArray *_imgs;
    NSDictionary *_extInfo;
}

/**
 *	@brief	分享ID
 */
@property (nonatomic,copy) NSString *sid;

/**
 *	@brief	分享内容
 */
@property (nonatomic,copy) NSString *text;

/**
 *	@brief	分享的链接列表
 */
@property (nonatomic,retain) NSArray *urls;

/**
 *	@brief	分享的图片列表
 */
@property (nonatomic,retain) NSArray *imgs;

/**
 *	@brief	扩展信息
 */
@property (nonatomic,retain) NSDictionary *extInfo;

/**
 *	@brief	原始数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	创建文章信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	文章信息
 */
+ (SSVKontaktePost *)postWithResponse:(NSDictionary *)response;


@end
