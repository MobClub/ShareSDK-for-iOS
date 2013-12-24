//
//  ISSFlickrApp.h
//  FlickrConnection
//
//  Created by 冯 鸿杰 on 13-9-3.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSFlickrUser.h"
#import "SSFlickrErrorInfo.h"
#import "SSFlickrCredential.h"
#import "SSFlickrPhoto.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	请求方式
 */
typedef enum
{
	SSFlickrRequestMethodGet = 0, /**< GET方式 */
	SSFlickrRequestMethodPost = 1, /**< POST方式 */
	SSFlickrRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSFlickrRequestMethod;

/**
 *	@brief	Flickr应用协议
 */
@protocol ISSFlickrApp <ISSPlatformApp>

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
 *	@brief	调用开放平台API
 *
 *	@param 	path 	接口路径
 *  @param  restMethod  REST API的方法名称，如果指定此参数可以忽略path，path会默认指向http://ycpi.api.flickr.com/services/rest
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
 restMethod:(NSString *)restMethod
     method:(SSFlickrRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	上传图片
 *
 *	@param 	photo 	图片对象
 *	@param 	title 	标题
 *	@param 	description 	相片描述。可能包含某受限的 HTML。
 *	@param 	tags 	適用於相片的以空格分隔的標籤清單。
 *	@param 	isPublic 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	isFriend 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	isFamily 	設定為 0 表示否，1 表示是。指定誰可以檢視相片。
 *	@param 	safetyLevel 	設置 1 為「安全級」、2 為「輔導級」、3 為「限制級」。
 *	@param 	contentType 	設置 1 為「相片」、2 為「螢幕截圖」、3 為「其他」。
 *	@param 	hidden 	設置 1 為「相片」、2 為「螢幕截圖」、3 為「其他」。
 *  @param  result  返回回调
 */
- (void)uploadPhoto:(id<ISSCAttachment>)photo
              title:(NSString *)title
        description:(NSString *)description
               tags:(NSString *)tags
           isPublic:(NSNumber *)isPublic
           isFriend:(NSNumber *)isFriend
           isFamily:(NSNumber *)isFamily
        safetyLevel:(NSNumber *)safetyLevel
        contentType:(NSNumber *)contentType
             hidden:(NSNumber *)hidden
             result:(SSShareResultEvent)result;

@end
