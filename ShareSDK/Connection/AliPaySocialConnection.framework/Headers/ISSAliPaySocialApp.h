//
//  ISSAliPaySocialApp.h
//  AliPaySocialConnection
//
//  Created by chenjd on 15/7/23.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSAliPaySocialErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	支付宝应用协议
 */
///#end
///#begin en
/**
 *	@brief	AliPay App Protocol.
 */
///#end
@protocol ISSAliPaySocialApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
///#end
///#begin en
/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
///#end
- (NSString *)appId;

///#begin zh-cn
/**
 *	@brief	分享文本信息
 *
 *	@param 	text 	文本信息
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send a text message.
 *
 *	@param 	text 	Content string.
 *  @param  result  Result handler.
 */
///#end
- (void)sendText:(NSString *)text
          result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享图片信息
 *
 *	@param 	title 	标题
 *	@param 	description 	描述
 *	@param 	pic 	图片信息
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send a picture message.
 *
 *	@param 	title 	Title string.
 *	@param 	description 	Description.
 *	@param 	pic 	Pictrue attachment object.
 *  @param  result  Result handler.
 */
///#end
- (void)sendPic:(NSString *)title
    description:(NSString *)description
            pic:(id<ISSCAttachment>)pic
         result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享新闻信息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	url 	链接
 *	@param 	pic 	预览图
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send a news message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	url 	URL string.
 *	@param 	pic 	Thumbnail.
 *  @param  result  Result handler.
 */
///#end
- (void)sendNews:(NSString *)title
         content:(NSString *)content
             url:(NSString *)url
             pic:(id<ISSCAttachment>)pic
          result:(SSShareResultEvent)result;


@end
