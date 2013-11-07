//
//  ISSTumblrApp.h
//  TumblrConnection
//
//  Created by 冯 鸿杰 on 13-9-5.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSTumblrUser.h"
#import "SSTumblrErrorInfo.h"
#import "SSTumblrCredential.h"
#import "SSTumblrPost.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	请求方式
 */
typedef enum
{
	SSTumblrRequestMethodGet = 0, /**< GET方式 */
	SSTumblrRequestMethodPost = 1, /**< POST方式 */
	SSTumblrRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTumblrRequestMethod;

/**
 *	@brief	Tumblr应用
 */
@protocol ISSTumblrApp <ISSPlatformApp>

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
 *	@brief	获取回调地址
 *
 *	@return	回调地址
 */
- (NSString *)callbackUrl;

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
     method:(SSTumblrRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	发布文本类型文章
 *
 *	@param 	text 	内容，可以包含html格式
 *	@param 	title 	标题
 *	@param 	blogName 	博客名称，如果传入nil，则发布到该用户的默认博客
 *  @param  result  返回回调
 */
- (void)postText:(NSString *)text
           title:(NSString *)title
        blogName:(NSString *)blogName
          result:(SSShareResultEvent)result;

/**
 *	@brief	创建照片类型文章
 *
 *	@param 	photo 	照片信息集合
 *	@param 	caption 	标题
 *	@param 	url 	点击后跳转的链接
 *	@param 	blogName 	博客名称，如果传入nil，则发布到该用户的默认博客
 *  @param  result  返回回调
 */
- (void)postPhoto:(id<ISSCAttachment>)photo
          caption:(NSString *)caption
              url:(NSString *)url
         blogName:(NSString *)blogName
           result:(SSShareResultEvent)result;


@end
