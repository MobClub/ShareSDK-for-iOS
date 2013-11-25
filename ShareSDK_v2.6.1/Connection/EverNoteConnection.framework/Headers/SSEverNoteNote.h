//
//  SSEverNoteNote.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-5-22.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <ShareSDKCoreService/SSCDataObject.h>
#import "ISSEverNoteDataOutput.h"
#import "ISSEverNoteDataInput.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	笔记信息
 */
@interface SSEverNoteNote : NSObject <ISSPlatformShareInfo,
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
 *	@brief	创建微博信息
 *
 *	@param 	response 	服务器回复数据
 *
 *	@return	微博信息
 */
+ (SSEverNoteNote *)noteWithResponse:(NSDictionary *)response;

@end
