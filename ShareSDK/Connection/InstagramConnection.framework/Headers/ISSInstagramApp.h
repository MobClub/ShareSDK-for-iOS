//
//  ISSInstagramApp.h
//  InstagramConnection
//
//  Created by 冯 鸿杰 on 13-10-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSInstagramUser.h"
#import "SSInstagramErrorInfo.h"
#import "SSInstagramCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSInstagramRequestMethodGet = 0, /**< GET方式 */
	SSInstagramRequestMethodPost = 1, /**< POST方式 */
	SSInstagramRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSInstagramRequestMethod;

/**
 *	@brief	Instagram应用协议
 */
@protocol ISSInstagramApp <ISSPlatformApp>

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)clientId;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)clientSecret;

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
     method:(SSInstagramRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;


/**
 *	@brief 打开Instgaram的拍照功能
 *
 *  @return YES 表示
 */
- (BOOL)openInstagramWithCamera;

/**
 *	@brief	分享内容
 *
 *	@param 	image 	图片
 *	@param 	title 	标题
 *  @param  containerController     容器控制器
 *  @param  result  返回回调
 */
- (void)shareWithImage:(id<ISSCAttachment>)image
                 title:(NSString *)title
   containerController:(UIViewController *)containerController
                result:(SSShareResultEvent)result;


@end
