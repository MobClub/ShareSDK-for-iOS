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
#import "SSTwitterUser.h"
#import "SSTwitterErrorInfo.h"
#import "SSTwitterTweets.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Twitter请求方式
 */
typedef enum
{
	SSTwitterRequestMethodGet = 0, /**< GET方式 */
	SSTwitterRequestMethodPost = 1, /**< POST方式 */
	SSTwitterRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTwitterRequestMethod;

/**
 *	@brief	Twitter应用协议
 */
@protocol ISSTwitterApp <ISSPlatformApp>


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
     method:(SSTwitterRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	更新状态信息
 *
 *	@param 	status 	状态信息
 *  @param  locationCoordinate  地理位置
 *  @param  result  返回回调
 */
- (void)updateWithStatus:(NSString *)status
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	更新带媒体的状态信息
 *
 *	@param 	status 	状态信息
 *	@param 	media 	媒体信息
 *  @param  locationCoordinate  地理位置
 *  @param  result  返回回调
 */
- (void)updateWithStatus:(NSString *)status
                   media:(id<ISSCAttachment>)media
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;


@end
