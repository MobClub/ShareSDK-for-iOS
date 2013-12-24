//
//  ISSYiXinApp.h
//  YiXinConnection
//
//  Created by Nogard on 13-11-27.
//  Copyright (c) 2013年 AppGo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>
#import "SSYiXinTypeDef.h"


@protocol ISSYiXinApp <ISSPlatformApp>

/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)appId;

/**
 *	@brief	获取分享场景
 *
 *	@return	分享场景
 */
- (SSYiXinScene)scene;

/**
 *	@brief	设置委托
 *
 *	@param 	delegate 	委托对象
 */
- (void)setDelegate:(id)delegate;


/**
 *	@brief	发送文本消息(SSPulishContentMediaTypeText)
 *
 *	@param 	content 	内容
 *  @param  result  返回回调
 */
- (void)sendText:(NSString *)content
          result:(SSShareResultEvent)result;

/**
 *	@brief	发送图片消息(SSPulishContentMediaTypeImage)
 *
 *  @param  title   标题
 *  @param  description 描述
 *  @param  thumbImage  缩略图
 *	@param 	attachment 	图片
 *  @param  result  返回回调
 */
- (void)sendImageWithTitle:(NSString *)title
               description:(NSString *)description
                thumbImage:(id<ISSCAttachment>)thumbImage
                attachment:(id<ISSCAttachment>)attachment
                    result:(SSShareResultEvent)result;

/**
 *	@brief	发送网页内容(SSPulishContentMediaTypeNews)
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendNews:(NSString *)title
         content:(NSString *)content
           image:(id<ISSCAttachment>)pic
             url:(NSString *)url
          result:(SSShareResultEvent)result;

/**
 *	@brief	发送音乐消息(SSPulishContentMediaTypeMusic)
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *  @param  musicFileUrl    音乐文件路径
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendMusic:(NSString *)title
          content:(NSString *)content
            image:(id<ISSCAttachment>)image
              url:(NSString *)url
     musicFileUrl:(NSString *)musicFileUrl
           result:(SSShareResultEvent)result;

/**
 *	@brief	发送视频消息(SSPulishContentMediaTypeVideo)
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendVideo:(NSString *)title
          content:(NSString *)content
            image:(id<ISSCAttachment>)image
              url:(NSString *)url
           result:(SSShareResultEvent)result;

/**
 *	@brief	发送App信息(SSPulishContentMediaTypeApp)
 *
 *	@param 	title 	标题
 *	@param 	content 	内容
 *	@param 	pic 	预览图
 *	@param 	url 	链接
 *	@param 	extInfo 	扩展信息
 *	@param 	fileData 	文件数据
 *	@param 	scene 	类型
 *  @param  result  返回回调
 */
- (void)sendApp:(NSString *)title
        content:(NSString *)content
          image:(id<ISSCAttachment>)image
            url:(NSString *)url
        extInfo:(NSString *)extInfo
       fileData:(NSData *)fileData
         result:(SSShareResultEvent)result;

@end
