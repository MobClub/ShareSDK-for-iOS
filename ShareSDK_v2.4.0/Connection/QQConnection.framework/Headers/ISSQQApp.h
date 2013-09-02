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

/**
 *	@brief	QQ应用协议
 */
@protocol ISSQQApp <ISSCOpenApp>

/**
 *	@brief	登录帐户
 *
 *	@return	帐户信息
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)appId;

/**
 *	@brief	获取是否转换链接标识
 *
 *	@return	YES 表示转换链接，NO 表示不转换链接
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	设置是否转换链接标识
 *
 *	@param 	enabled 	YES 表示转换链接，NO 表示不转换链接
 */
- (void)setConvertUrlEnabled:(BOOL)enabled;

/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
- (BOOL)handleOpenURL:(NSURL *)url;


/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;


/**
 *	@brief	分享文本信息
 *
 *	@param 	text 	文本信息
 *  @param  result  返回回调
 */
- (void)sendText:(NSString *)text
          result:(void(^)(SSCShareSessionState state, SSQQErrorInfo *error))result;

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
         result:(void(^)(SSCShareSessionState state, SSQQErrorInfo *error))result;


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
          result:(void(^)(SSCShareSessionState state, SSQQErrorInfo *error))result;

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
           result:(void(^)(SSCShareSessionState state, SSQQErrorInfo *error))result;

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
           result:(void(^)(SSCShareSessionState state, SSQQErrorInfo *error))result;


@end
