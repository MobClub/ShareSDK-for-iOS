//
//  ISSVKontakteApp.h
//  VKontakteConnection
//
//  Created by 冯 鸿杰 on 13-10-11.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSVKontakteUser.h"
#import "SSVKontakteErrorInfo.h"
#import "SSVKontakteCredential.h"
#import "SSVKontaktePost.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSVKontakteRequestMethodGet = 0, /**< GET方式 */
	SSVKontakteRequestMethodPost = 1, /**< POST方式 */
	SSVKontakteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSVKontakteRequestMethod;

@protocol ISSVKontakteApp <ISSPlatformApp>

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
- (NSString *)secretKey;

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
     method:(SSVKontakteRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	发布文章到用户墙上
 *
 *	@param 	message 	内容，如果附件没有设置则为必填项
 *	@param 	attachments 	附件，如果内容没有设置则为必填项
 *  @param  url     链接地址
 *  @param  groupId     组标识,当设置了attachments参数时必填。
 *	@param 	friendsOnly 	是否仅允许好友查看
 *	@param 	locationCoordinate 	发布文章时的位置
 *  @param  result    返回回调
 */
- (void)wallPostWithMessage:(NSString *)message
                attachments:(NSArray *)attachments
                        url:(NSString *)url
                    groupId:(NSString *)groupId
                friendsOnly:(NSNumber *)friendsOnly
         locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                     result:(SSShareResultEvent)result;


@end
