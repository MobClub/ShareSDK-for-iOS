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
#import "SSDouBanUser.h"
#import "SSDouBanErrorInfo.h"
#import "SSDouBanStatus.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	豆瓣请求方式
 */
///#end
///#begin en
/**
 *	@brief	DouBan request method
 */
///#end
typedef enum
{
	SSDouBanRequestMethodGet = 0, /**< GET方式 */
	SSDouBanRequestMethodPost = 1, /**< POST方式 */
	SSDouBanRequestMethodMultipartPost = 2, /**< Multipart POST方式，用于上传文件的api接口 */
    SSDouBanRequestMethodDelete = 3 /**< DELETE方式 */
}
SSDouBanRequestMethod;

///#begin zh-cn
/**
 *	@brief	豆瓣应用协议
 */
///#end
///#begin en
/**
 *	@brief	DouBan app protocol
 */
///#end
@protocol ISSDouBanApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get app key
 *
 *	@return	app key
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
 *	@return	App secret.
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
 *	@brief	Call api
 *
 *	@param 	path 	Path string.
 *	@param 	params 	Request parameters.
 *  @param  user    User object,If the incoming nil indicates the default authorized users
 *  @param  result  result handler.
 *  @param  fault   fault handler.
 */
///#end
- (void)api:(NSString *)path
     method:(SSDouBanRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	发布广播
 *
 *	@param 	text 	广播文本内容
 *	@param 	image 	我说的图
 *	@param 	recTitle 	推荐网址的标题
 *	@param 	recUrl 	推荐网址的href
 *	@param 	recDesc 	推荐网址的描述
 *	@param 	recImage 	推荐网址的附图url
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Add Status
 *
 *	@param 	text 	Content string.
 *	@param 	image 	Image attachment object.
 *	@param 	recTitle 	Recommended URL title
 *	@param 	recUrl 	Recommended URL href
 *	@param 	recDesc 	Recommended URL description
 *	@param 	recImage 	Recommended URL image url.
 *  @param  result  result handler.
 */
///#end
- (void)addStatusWithText:(NSString *)text
                    image:(id<ISSCAttachment>)image
                 recTitle:(NSString *)recTitle
                   recUrl:(NSString *)recUrl
                  recDesc:(NSString *)recDesc
                 recImage:(NSString *)recImage
                   result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	获取单条广播
 *
 *	@param 	statusId 	广播id
 */
///#end
///#begin en
/**
 *	@brief	Get Status info.
 *
 *	@param 	statusId 	Status id.
 */
///#end
- (void)getStatusWithId:(NSString *)statusId
                 result:(void(^)(BOOL result, id status, CMErrorInfo *error))result;



@end
