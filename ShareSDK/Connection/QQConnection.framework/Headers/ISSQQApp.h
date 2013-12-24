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
#import "SSQQErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	QQ应用协议
 */
@protocol ISSQQApp <ISSPlatformApp>

/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)appId;


/**
 *	@brief	分享文本信息
 *
 *	@param 	text 	文本信息
 *  @param  result  返回回调
 */
- (void)sendText:(NSString *)text
          result:(SSShareResultEvent)result;

/**
 *	@brief	分享图片信息
 *
 *	@param 	title 	标题
 *	@param 	description 	描述
 *	@param 	pic 	图片信息
 *  @param  result  返回回调
 */
- (void)sendPic:(NSString *)title
    description:(NSString *)description
            pic:(id<ISSCAttachment>)pic
         result:(SSShareResultEvent)result;


/**
 *	@brief	分享新闻信息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	url 	链接
 *	@param 	pic 	预览图
 *  @param  result  返回回调
 */
- (void)sendNews:(NSString *)title
         content:(NSString *)content
             url:(NSString *)url
             pic:(id<ISSCAttachment>)pic
          result:(SSShareResultEvent)result;

/**
 *	@brief	分享音乐信息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	url 	链接
 *	@param 	pic 	预览图
 *  @param  result  返回回调
 */
- (void)sendMusic:(NSString *)title
          content:(NSString *)content
              url:(NSString *)url
              pic:(id<ISSCAttachment>)pic
           result:(SSShareResultEvent)result;

/**
 *	@brief	分享视频信息
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	url 	链接
 *	@param 	pic 	预览图
 *  @param  result  返回回调
 */
- (void)sendVideo:(NSString *)title
          content:(NSString *)content
              url:(NSString *)url
              pic:(id<ISSCAttachment>)pic
           result:(SSShareResultEvent)result;


@end
