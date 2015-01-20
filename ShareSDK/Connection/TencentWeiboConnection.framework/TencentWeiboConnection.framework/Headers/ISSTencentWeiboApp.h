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
#import "SSTencentWeiboUser.h"
#import "SSTencentWeiboErrorInfo.h"
#import "SSTencentWeiboTweet.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	请求方式
 */
///#end
///#begin en
/**
 *	@brief	Request method.
 */
///#end
typedef enum
{
	SSTecentWeiboRequestMethodGet = 0, /**< GET方式 */
	SSTecentWeiboRequestMethodPost = 1, /**< POST方式 */
	SSTecentWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTecentWeiboRequestMethod;

///#begin zh-cn
/**
 *	@brief	腾讯微博应用协议
 */
///#end
///#begin en
/**
 *	@brief	Tencent Weibo App Protocol.
 */
///#end
@protocol ISSTencentWeiboApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get app key.
 *
 *	@return	app key.
 */
///#end
- (NSString *)appKey;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get app secret.
 *
 *	@return	app secret.
 */
///#end
- (NSString *)appSecret;

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
 *	@brief	获取SSO回调地址
 *
 *	@return	SSO回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get SSO callback URL.
 *
 *	@return	SSO callback URL.
 */
///#end
- (NSString *)ssoCallbackUrl;

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
 *	@brief	Call API
 *
 *	@param 	path 	API path.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized user
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSTecentWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	发送普通微博信息
 *
 *	@param 	content 	内容
 *  @param  locationCoordinate  地理位置
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	Send a Tweet.
 *
 *	@param 	content 	Content string.
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
///#end
- (void)addTweetWithContent:(NSString *)content
         locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                     result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	发送带有图片的微博信息
 *
 *	@param 	content 	内容
 *	@param 	pic 	图片
 *  @param  locationCoordinate  地理位置
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	send a picture Tweet.
 *
 *	@param 	content 	Content string.
 *	@param 	pic 	Picture attachment.
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
///#end
- (void)addPicTweetWithContent:(NSString *)content
                           pic:(id<ISSCAttachment>)pic
            locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                        result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	发送带有多张图片的微博信息
 *
 *	@param 	content 	内容
 *	@param 	pic 	图片数组（数组元素是id<ISSCAttachment>类型）
 *  @param  locationCoordinate  地理位置
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	send Tweet with many pictures.
 *
 *	@param 	content 	Content string.
 *	@param 	pic 	Picture Array(the type of array element is id<ISSCAttachment>)
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
///#end
- (void)addSomePicTweetWithContent:(NSString *)content
                               pic:(NSMutableArray *)imagesArray
                locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                            result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	用图片URL发表带图片的微博
 *
 *	@param 	content 	微博内容
 *	@param 	url 	图片的URL地址，必须以http开头。
 *  @param  locationCoordinate  地理位置信息，可以为nil
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	send a picture Tweet with picture URL.
 *
 *	@param 	content 	Content string.
 *	@param 	url 	Image URL address, must begin with http.
 *  @param  locationCoordinate  Location information, which can be nil
 *  @param  result  Result handler.
 */
///#end
- (void)addPicUrlTweetWithContent:(NSString *)content
                              url:(NSString *)url
               locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                           result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	获取微博信息
 *
 *	@param 	tweetId 	微博ID
 *  @param  result      回调方法
 */
///#end
///#begin en
/**
 *	@brief	Get Tweet information.
 *
 *	@param 	tweetId 	Tweet id.
 *  @param  result      Result handler.
 */
///#end
- (void)getTweetWithId:(NSString *)tweetId
                result:(void(^)(BOOL result, id<ISSPlatformShareInfo> tweet, CMErrorInfo *error))result;


@end
