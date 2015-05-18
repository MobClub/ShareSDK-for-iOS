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
#import "ISSYouDaoNoteAuthSession.h"
#import "SSYouDaoNoteUser.h"
#import "SSYouDaoNoteErrorInfo.h"
#import "SSYouDaoNoteNote.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	请求方式
 */
///#end
///#begin en
/**
 *	@brief	Request Method
 */
///#end
typedef enum
{
	SSYouDaoNoteRequestMethodGet = 0, /**< GET方式 */
	SSYouDaoNoteRequestMethodPost = 1, /**< POST方式 */
	SSYouDaoNoteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSYouDaoNoteRequestMethod;

///#begin zh-cn
/**
 *	@brief	有道云笔记应用
 */
///#end
///#begin en
/**
 *	@brief	YouDaoNote App
 */
///#end
@protocol ISSYouDaoNoteApp <ISSPlatformApp>

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
 *	@brief	Get consumer secret.
 *
 *	@return	Consumer secret.
 */
///#end
- (NSString *)consumerSecret;

///#begin zh-cn
/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *  @param  method  请求方法
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
///#end
///#begin en
/**
 *	@brief	Call API.
 *
 *	@param 	path 	API path string.
 *  @param  method  Request method.
 *	@param 	params  Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSYouDaoNoteRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	上传附件
 *
 *	@param 	file 	附件信息
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Upload resource.
 *
 *	@param 	file 	File attachment.
 *  @param  result  Result handler.
 */
///#end
- (void)uploadResource:(id<ISSCAttachment>)file
                result:(void(^)(BOOL result, id resource, CMErrorInfo *error))result;

///#begin zh-cn
/**
 *	@brief	创建笔记
 *
 *	@param 	content 	内容
 *	@param 	source 	来源
 *	@param 	author 	作者
 *	@param 	title 	标题
 *	@param 	notebook 	笔记本路径
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Create a note.
 *
 *	@param 	content 	Content string.
 *	@param 	source 	Source.
 *	@param 	author 	Author.
 *	@param 	title 	Title string.
 *	@param 	notebook 	Notebook path.
 *  @param  result  Result handler.
 */
///#end
- (void)createNote:(NSString *)content
            source:(NSString *)source
            author:(NSString *)author
             title:(NSString *)title
          notebook:(NSString *)notebook
            result:(SSShareResultEvent)result;


@end
