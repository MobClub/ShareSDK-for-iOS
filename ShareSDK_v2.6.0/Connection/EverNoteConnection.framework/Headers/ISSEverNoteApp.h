//
//  ISSEverNoteApp.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-7.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSEverNoteUser.h"
#import "SSEverNoteErrorInfo.h"
#import "SSEverNoteCredential.h"
#import "SSEverNoteNote.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	印象笔记请求方式
 */
typedef enum
{
	SSEverNoteRequestMethodGet = 0, /**< GET方式 */
	SSEverNoteRequestMethodPost = 1, /**< POST方式 */
	SSEverNoteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSEverNoteRequestMethod;

/**
 *	@brief	印象笔记应用协议
 */
@protocol ISSEverNoteApp <ISSPlatformApp>

/**
 *	@brief	获取消费者Key
 *
 *	@return	消费者Key
 */
- (NSString *)consumerKey;

/**
 *	@brief	获取消费者密钥
 *
 *	@return	消费者密钥
 */
- (NSString *)consumerSecret;

/**
 *	@brief	创建纯文本笔记
 *
 *	@param 	content 	内容
 *  @param  title       标题
 *  @param  result      返回回调
 */
- (void)createNote:(NSString *)content
             title:(NSString *)title
            result:(SSShareResultEvent)result;

/**
 *	@brief	创建图文笔记
 *
 *	@param 	content 	内容
 *  @param  title       标题
 *  @param  resources      图片资源列表
 *  @param  result      返回回调
 */
- (void)createNote:(NSString *)content
             title:(NSString *)title
         resources:(NSArray *)resources
            result:(SSShareResultEvent)result;


@end
