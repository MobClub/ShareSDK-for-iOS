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
#import "SSPinterestErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	Pinterest应用协议
 */
///#end
///#begin en
/**
 *	@brief	Pinterest App Protocol.
 */
///#end
@protocol ISSPinterestApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
///#end
///#begin en
/**
 *	@brief	Get client id.
 *
 *	@return	Client id.
 */
///#end
- (NSString *)clientId;

///#begin zh-cn
/**
 *	@brief	分享内容
 *
 *	@param 	image 	图片，只允许网络图片路径
 *	@param 	url 	网址
 *	@param 	description 	描述
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	Share content.
 *
 *	@param 	image 	Image object，Pictures only allows network path
 *	@param 	url 	URL string.
 *	@param 	description 	Description.
 *  @param  result  Result handler.
 */
///#end
- (void)createPinWithImage:(id<ISSCAttachment>)image
                       url:(NSString *)url
               description:(NSString *)description
                    result:(SSShareResultEvent)result;


@end
