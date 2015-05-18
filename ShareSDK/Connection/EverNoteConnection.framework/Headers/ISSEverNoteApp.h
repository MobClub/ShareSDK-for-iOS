///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSEverNoteUser.h"
#import "SSEverNoteErrorInfo.h"
#import "SSEverNoteCredential.h"
#import "SSEverNoteNote.h"
#import "SSEverNoteTagReader.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	印象笔记请求方式
 */
///#end
///#begin en
/**
 *	@brief	Evernote request method
 */
///#end
typedef enum
{
	SSEverNoteRequestMethodGet = 0, /**< GET方式 */
	SSEverNoteRequestMethodPost = 1, /**< POST方式 */
	SSEverNoteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSEverNoteRequestMethod;

///#begin zh-cn
/**
 *	@brief	印象笔记应用协议
 */
///#end
///#begin en
/**
 *	@brief	Evernot app protocol
 */
///#end
@protocol ISSEverNoteApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取消费者Key
 *
 *	@return	消费者Key
 */
///#end
///#begin en
/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
///#end
- (NSString *)consumerKey;

///#begin zh-cn
/**
 *	@brief	获取消费者密钥
 *
 *	@return	消费者密钥
 */
///#end
///#begin en
/**
 *	@brief	Get consumer secret
 *
 *	@return	Consumer secret.
 */
///#end
- (NSString *)consumerSecret;

///#begin zh-cn
/**
 *	@brief	创建纯文本笔记
 *
 *	@param 	content 	内容
 *  @param  title       标题
 *  @param  result      返回回调
 */
///#end
///#begin en
/**
 *	@brief	Create note.
 *
 *	@param 	content 	Content string.
 *  @param  title       Title string.
 *  @param  result      Result handler.
 */
///#end
- (void)createNote:(NSString *)content
             title:(NSString *)title
            result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	创建图文笔记
 *
 *	@param 	content 	内容
 *  @param  title       标题
 *  @param  resources      图片资源列表
 *  @param  result      返回回调
 */
///#end
///#begin en
/**
 *	@brief	Create note.
 *
 *	@param 	content 	Content string.
 *  @param  title       Title string.
 *  @param  resources      Resources list.
 *  @param  result      Result handler.
 */
///#end
- (void)createNote:(NSString *)content
             title:(NSString *)title
         resources:(NSArray *)resources
            result:(SSShareResultEvent)result;


///#begin zh-cn
/**
 *	@brief	创建图文笔记
 *
 *  @since  v2.9.0
 *
 *	@param 	content 	内容
 *  @param  title       标题
 *  @param  resources      图片资源列表
 *  @param  notebookGuid    笔记本ID
 *  @param  result      返回回调
 */
///#end
///#begin en
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
///#end
- (void)createNote:(NSString *)content
             title:(NSString *)title
         resources:(NSArray *)resources
      notebookGuid:(NSString *)noteBookGuid
          tagsGuid:(NSArray *)tagsGuid
            result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	创建标签
 *
 *	@param 	tagName 	标签名称
 *	@param 	parentGuid 	父级标签ID
 *	@param 	result 	返回回调
 */
///#end
///#begin en
/**
 *	@brief	Create a tag.
 *
 *	@param 	tagName 	Tag name.
 *	@param 	parentGuid 	Parent tag id.
 *	@param 	result 	Result handler.
 */
///#end
- (void)createTagWithName:(NSString *)tagName
               parentGuid:(NSString *)parentGuid
                   result:(void(^)(SSResponseState state, SSEverNoteTagReader *tag, id<ICMErrorInfo> error))result;

///#begin zh-cn
/**
 *	@brief	获取标签列表
 *
 *  @param  notebookGuid    笔记本ID
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Get tag list.
 *
 *  @param  notebookGuid    Notebook guid.
 *  @param  result  Result handler.
 */
///#end
- (void)getTagsWithNotebookGuid:(NSString *)notebookGuid
                         result:(void(^)(SSResponseState state, NSArray *tags, id<ICMErrorInfo> error))result;


@end
