//
//  ISSPinterestApp.h
//  PinterestConnection
//
//  Created by 冯 鸿杰 on 13-8-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSPinterestErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Pinterest应用协议
 */
@protocol ISSPinterestApp <ISSPlatformApp>

/**
 *	@brief	获取应用ID
 *
 *	@return	应用ID
 */
- (NSString *)clientId;

/**
 *	@brief	分享内容
 *
 *	@param 	image 	图片，只允许网络图片路径
 *	@param 	url 	网址
 *	@param 	description 	描述
 *  @param  result  回调方法
 */
- (void)createPinWithImage:(id<ISSCAttachment>)image
                       url:(NSString *)url
               description:(NSString *)description
                    result:(SSShareResultEvent)result;


@end
