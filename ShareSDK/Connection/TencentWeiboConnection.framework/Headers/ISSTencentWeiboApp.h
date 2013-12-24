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
#import "SSTencentWeiboUser.h"
#import "SSTencentWeiboErrorInfo.h"
#import "SSTencentWeiboTweet.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSTecentWeiboRequestMethodGet = 0, /**< GET方式 */
	SSTecentWeiboRequestMethodPost = 1, /**< POST方式 */
	SSTecentWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTecentWeiboRequestMethod;

/**
 *	@brief	腾讯微博应用协议
 */
@protocol ISSTencentWeiboApp <ISSPlatformApp>

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)appKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)appSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	获取SSO回调地址
 *
 *	@return	SSO回调地址
 */
- (NSString *)ssoCallbackUrl;

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
     method:(SSTecentWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	发送普通微博信息
 *
 *	@param 	content 	内容
 *  @param  locationCoordinate  地理位置
 *  @param  result  回调方法
 */
- (void)addTweetWithContent:(NSString *)content
         locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                     result:(SSShareResultEvent)result;

/**
 *	@brief	发送带有图片的微博信息
 *
 *	@param 	content 	内容
 *	@param 	pic 	图片
 *  @param  locationCoordinate  地理位置
 *  @param  result  回调方法
 */
- (void)addPicTweetWithContent:(NSString *)content
                           pic:(id<ISSCAttachment>)pic
            locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                        result:(SSShareResultEvent)result;

/**
 *	@brief	用图片URL发表带图片的微博
 *
 *	@param 	content 	微博内容
 *	@param 	url 	图片的URL地址，必须以http开头。
 *  @param  locationCoordinate  地理位置信息，可以为nil
 *  @param  result  回调方法
 */
- (void)addPicUrlTweetWithContent:(NSString *)content
                              url:(NSString *)url
               locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                           result:(SSShareResultEvent)result;

/**
 *	@brief	获取微博信息
 *
 *	@param 	tweetId 	微博ID
 *  @param  result      回调方法
 */
- (void)getTweetWithId:(NSString *)tweetId
                result:(void(^)(BOOL result, id<ISSPlatformShareInfo> tweet, CMErrorInfo *error))result;


@end
