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
#import "SSMailErrorInfo.h"
#import <ShareSDK/ShareSDK.h>

/**
 *	@brief	Mail App Protocol
 */
@protocol ISSMailApp <ISSPlatformApp>

/**
 *	@brief	Set View delegate.
 *
 *	@param 	viewDelegate 	View delegate object.
 */
- (void)setViewDelegate:(id<ISSViewDelegate>)viewDelegate;

/**
 *	@brief	Send mail.
 *
 *	@param 	subject 	Subject string.
 *	@param 	content 	Content string.
 *	@param 	isHTML 	Whether the HTML format
 *	@param 	attachments 	Attachment list.
 *	@param 	to 	Recipient List
 *	@param 	cc 	Cc list
 *	@param 	bcc 	Bcc list
 *	@param 	container 	Container
 *  @param  viewDelegate    View delegate object, Implement ISSViewDelegate protocol object.
 *  @param  result  Result handler.
 */
- (void)sendMailWithSubject:(NSString *)subject
                    content:(NSString *)content
                     isHTML:(NSNumber *)isHTML
                attachments:(NSArray *)attachments
                         to:(NSArray *)to
                         cc:(NSArray *)cc
                        bcc:(NSArray *)bcc
                  container:(UIViewController *)container
               viewDelegate:(id<ISSViewDelegate>)viewDelegate
                     result:(SSShareResultEvent)result;


@end
