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
#import "SSPrintErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Print App Protocol.
 */
@protocol ISSPrintApp <ISSPlatformApp>

/**
 *	@brief	Print.
 *
 *  @param  jobName Job name.
 *	@param 	text 	Content string.
 *	@param 	pic 	Picture attachment.
 *  @param  container   Container.
 *  @param  result  Result handler.
 */
- (void)printWithJobName:(NSString *)jobName
                    text:(NSString *)text
                     pic:(id<ISSCAttachment>)pic
               container:(UIViewController *)container
                  result:(SSShareResultEvent)result;


@end
