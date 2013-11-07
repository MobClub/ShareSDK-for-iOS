//
//  SSFlickrPhoto.h
//  FlickrConnection
//
//  Created by 冯 鸿杰 on 13-9-4.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSFlickrXMLNode.h"
#import <ShareSDKCoreService/SSCDataObject.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	照片信息
 */
@interface SSFlickrPhoto : NSObject <ISSPlatformShareInfo,
                                     ISSCDataObject,
                                     NSCoding>

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
 *	@brief	创建照片信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	照片信息
 */
+ (SSFlickrPhoto *)photoWithResponse:(id)response;


@end
