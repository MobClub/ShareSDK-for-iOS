//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSEverNoteUser.h"
#import "SSEverNoteErrorInfo.h"
#import "SSEverNoteCredential.h"
#import "SSEverNoteNote.h"
#import "SSEverNoteTagReader.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Evernote request method
 */
typedef enum
{
	SSEverNoteRequestMethodGet = 0, /**< GET方式 */
	SSEverNoteRequestMethodPost = 1, /**< POST方式 */
	SSEverNoteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSEverNoteRequestMethod;

/**
 *	@brief	Evernot app protocol
 */
@protocol ISSEverNoteApp <ISSPlatformApp>

/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
- (NSString *)consumerKey;

/**
 *	@brief	Get consumer secret
 *
 *	@return	Consumer secret.
 */
- (NSString *)consumerSecret;

/**
 *	@brief	Create note.
 *
 *	@param 	content 	Content string.
 *  @param  title       Title string.
 *  @param  result      Result handler.
 */
- (void)createNote:(NSString *)content
             title:(NSString *)title
            result:(SSShareResultEvent)result;

/**
 *	@brief	Create note.
 *
 *	@param 	content 	Content string.
 *  @param  title       Title string.
 *  @param  resources      Resources list.
 *  @param  result      Result handler.
 */
- (void)createNote:(NSString *)content
             title:(NSString *)title
         resources:(NSArray *)resources
            result:(SSShareResultEvent)result;


/**
 *	@brief	Create note.
 *
 *  @since  v2.9.0
 *
 *	@param 	content 	Content string.
 *  @param  title       Title string.
 *  @param  resources      Resources list.
 *  @param  notebookGuid    Notebook guid string.
 *  @param  tagsGuid    Tag guid list.
 *  @param  result      Result handler.
 */
- (void)createNote:(NSString *)content
             title:(NSString *)title
         resources:(NSArray *)resources
      notebookGuid:(NSString *)noteBookGuid
          tagsGuid:(NSArray *)tagsGuid
            result:(SSShareResultEvent)result;

/**
 *	@brief	Create a tag.
 *
 *	@param 	tagName 	Tag name.
 *	@param 	parentGuid 	Parent tag id.
 *	@param 	result 	Result handler.
 */
- (void)createTagWithName:(NSString *)tagName
               parentGuid:(NSString *)parentGuid
                   result:(void(^)(SSResponseState state, SSEverNoteTagReader *tag, id<ICMErrorInfo> error))result;

/**
 *	@brief	Get tag list.
 *
 *  @param  notebookGuid    Notebook guid.
 *  @param  result  Result handler.
 */
- (void)getTagsWithNotebookGuid:(NSString *)notebookGuid
                         result:(void(^)(SSResponseState state, NSArray *tags, id<ICMErrorInfo> error))result;


@end
