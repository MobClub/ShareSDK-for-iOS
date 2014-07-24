//
//  ISSLineApp.h
//  LineConnection
//
//  Created by 刘靖煌 on 14-6-20.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDK.h>

///#begin zh-cn
/**
 *	@brief	Line应用协议
 */
///#end
///#begin en
/**
 *	@brief	Line App.
 */
///#end
@protocol ISSLineApp <ISSPlatformApp>


///#begin zh-cn
/**
 *	@brief 是否装了Line
 *
 *  @return YES 表示
 */
///#end
///#begin en
/**
 *	@brief Open Line
 *
 *  @return YES open success. otherwise open failure.
 */
///#end
- (BOOL)isLineInstalled;


///#begin zh-cn
/**
 *	@brief	发送文本消息
 *
 *	@param 	content 	内容
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send a text message.
 *
 *	@param 	content 	Content string.
 *  @param  result  Result handler.
 */
///#end
- (void)sendText:(NSString *)text
          result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享内容
 *
 *	@param 	image 	图片
 *  @param  containerController     容器控制器
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Share content.
 *
 *	@param 	image 	Image attachment object.
 *  @param  containerController     Container controller.
 *  @param  result  Result handler.
 */
///#end
- (void)sendImage:(id<ISSCAttachment>)image
                result:(SSShareResultEvent)result;



@end
