//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSSMSErrorInfo.h"
#import <ShareSDK/ShareSDK.h>

/**
 *	@brief	SMS App Protocol.
 */
@protocol ISSSMSApp <ISSPlatformApp>

/**
 *	@brief	Set view delegate object.
 *
 *	@param 	viewDelegate 	View Delegate.
 */
- (void)setViewDelegate:(id<ISSViewDelegate>)viewDelegate;

/**
 *	@brief	Send text message.
 *
 *	@param 	text 	Content string.
 *  @param  container   Container
 *  @param  viewDelegate    View delegate object.
 *  @param  result  Result handler.
 */
- (void)sendText:(NSString *)text
       container:(UIViewController *)container
    viewDelegate:(id<ISSViewDelegate>)viewDelegate
          result:(SSShareResultEvent)result;


@end
