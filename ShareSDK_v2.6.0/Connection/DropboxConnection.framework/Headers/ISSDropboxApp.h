//
//  ISSDropboxApp.h
//  DropboxConnection
//
//  Created by 冯 鸿杰 on 13-9-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSDropboxUser.h"
#import "SSDropboxErrorInfo.h"
#import "SSDropboxCredential.h"
#import "SSDropboxFile.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	请求方式
 */
typedef enum
{
	SSDropboxRequestMethodGet = 0, /**< GET方式 */
	SSDropboxRequestMethodPost = 1, /**< POST方式 */
	SSDropboxRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSDropboxRequestMethod;

/**
 *	@brief	Dropbox应用协议
 */
@protocol ISSDropboxApp <ISSPlatformApp>

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
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSDropboxRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	上传文件
 *
 *	@param 	file 	文件对象
 */
- (void)uploadFile:(id<ISSCAttachment>)file
            result:(SSShareResultEvent)result;

@end
