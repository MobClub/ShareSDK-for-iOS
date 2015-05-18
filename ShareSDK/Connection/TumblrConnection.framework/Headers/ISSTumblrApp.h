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
#import "SSTumblrUser.h"
#import "SSTumblrErrorInfo.h"
#import "SSTumblrCredential.h"
#import "SSTumblrPost.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	请求方式
 */
///#end
///#begin en
/**
 *	@brief	Request method
 */
///#end
typedef enum
{
	SSTumblrRequestMethodGet = 0, /**< GET方式 */
	SSTumblrRequestMethodPost = 1, /**< POST方式 */
	SSTumblrRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTumblrRequestMethod;

///#begin zh-cn
/**
 *	@brief	Tumblr应用
 */
///#end
///#begin en
/**
 *	@brief	Tumblr App
 */
///#end
@protocol ISSTumblrApp <ISSPlatformApp>

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
 *	@brief	获取回调地址
 *
 *	@return	回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get callback url.
 *
 *	@return	Callback url.
 */
///#end
- (NSString *)callbackUrl;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
///#end
///#begin en
/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized user, it means that if the incoming nil default authorized user
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSTumblrRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	发布文本类型文章
 *
 *	@param 	text 	内容，可以包含html格式
 *	@param 	title 	标题
 *	@param 	blogName 	博客名称，如果传入nil，则发布到该用户的默认博客
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Create a post.
 *
 *	@param 	text 	Content string. can include html format
 *	@param 	title 	Title string.
 *	@param 	blogName 	Blog name，If you pass nil, then publish to the user's default blog
 *  @param  result  Result handler.
 */
///#end
- (void)postText:(NSString *)text
           title:(NSString *)title
        blogName:(NSString *)blogName
          result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	创建照片类型文章
 *
 *	@param 	photo 	照片信息集合
 *	@param 	caption 	标题
 *	@param 	url 	点击后跳转的链接
 *	@param 	blogName 	博客名称，如果传入nil，则发布到该用户的默认博客
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Create a post with photo.
 *
 *	@param 	photo 	Image attachment object.
 *	@param 	caption 	Title string.
 *	@param 	url 	URL string.
 *	@param 	blogName 	Blog name，If you pass nil, then publish to the user's default blog
 *  @param  result  Result handler.
 */
///#end
- (void)postPhoto:(id<ISSCAttachment>)photo
          caption:(NSString *)caption
              url:(NSString *)url
         blogName:(NSString *)blogName
           result:(SSShareResultEvent)result;


@end
