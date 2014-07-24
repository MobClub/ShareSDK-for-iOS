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
#import "SSPrintErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	打印应用协议
 */
///#end
///#begin en
/**
 *	@brief	Print App Protocol.
 */
///#end
@protocol ISSPrintApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	打印
 *
 *  @param  jobName 作业名称
 *	@param 	text 	文本内容
 *	@param 	pic 	图片内容
 *  @param  container   容器
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Print.
 *
 *  @param  jobName Job name.
 *	@param 	text 	Content string.
 *	@param 	pic 	Picture attachment.
 *  @param  container   Container.
 *  @param  result  Result handler.
 */
///#end
- (void)printWithJobName:(NSString *)jobName
                    text:(NSString *)text
                     pic:(id<ISSCAttachment>)pic
               container:(UIViewController *)container
                  result:(SSShareResultEvent)result;


@end
