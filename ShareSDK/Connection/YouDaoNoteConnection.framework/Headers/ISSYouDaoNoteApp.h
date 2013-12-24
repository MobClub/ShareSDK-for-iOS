//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSYouDaoNoteAuthSession.h"
#import "SSYouDaoNoteUser.h"
#import "SSYouDaoNoteErrorInfo.h"
#import "SSYouDaoNoteNote.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	请求方式
 */
typedef enum
{
	SSYouDaoNoteRequestMethodGet = 0, /**< GET方式 */
	SSYouDaoNoteRequestMethodPost = 1, /**< POST方式 */
	SSYouDaoNoteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSYouDaoNoteRequestMethod;

/**
 *	@brief	有道云笔记应用
 */
@protocol ISSYouDaoNoteApp <ISSPlatformApp>

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
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSYouDaoNoteRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	上传附件
 *
 *	@param 	file 	附件信息
 *  @param  result  返回回调
 */
- (void)uploadResource:(id<ISSCAttachment>)file
                result:(void(^)(BOOL result, id resource, CMErrorInfo *error))result;


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
- (void)createNote:(NSString *)content
            source:(NSString *)source
            author:(NSString *)author
             title:(NSString *)title
          notebook:(NSString *)notebook
            result:(SSShareResultEvent)result;


@end
