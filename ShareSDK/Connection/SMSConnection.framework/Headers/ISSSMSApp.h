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
#import "SSSMSErrorInfo.h"
#import <ShareSDK/ShareSDK.h>

///#begin zh-cn
/**
 *	@brief	短信应用协议
 */
///#end
///#begin en
/**
 *	@brief	SMS App Protocol.
 */
///#end
@protocol ISSSMSApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	设置视图委托
 *
 *	@param 	viewDelegate 	视图委托
 */
///#end
///#begin en
/**
 *	@brief	Set view delegate object.
 *
 *	@param 	viewDelegate 	View Delegate.
 */
///#end
- (void)setViewDelegate:(id<ISSViewDelegate>)viewDelegate;

///#begin zh-cn
/**
 *	@brief	发送短信息
 *
 *	@param 	text 	文本信息
 *  @param  container   容器
 *  @param  viewDelegate    视图委托
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send text message.
 *
 *	@param 	text 	Content string.
 *  @param  container   Container
 *  @param  viewDelegate    View delegate object.
 *  @param  result  Result handler.
 */
///#end
- (void)sendText:(NSString *)text
       container:(UIViewController *)container
    viewDelegate:(id<ISSViewDelegate>)viewDelegate
          result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	可发送带附件（如图片、音频、视频）短信息 （iOS7以上的系统才能发送带附件的短信）
 *
 *  @param subject      短信主题
 *  @param text         文本
 *  @param attachments  附件（如）
 *  @param to           收信人
 *  @param container    容器
 *  @param viewDelegate 视图委托
 *  @param result       返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send text message.
 *
 *  @param subject      subject
 *  @param text         the content of message
 *  @param attachments  attachments(it can be image,radio and video)
 *  @param to           the recipients array
 *  @param container    Container
 *  @param viewDelegate View delegate object
 *  @param result       Result handler
 */
///#end
- (void)sendSMSWithSubject:(NSString *)subject
                   content:(NSString *)text
               attachments:(NSArray *)attachments
                        to:(NSArray *)to
                 container:(UIViewController *)container
              viewDelegate:(id<ISSViewDelegate>)viewDelegate
                    result:(SSShareResultEvent)result;



@end
