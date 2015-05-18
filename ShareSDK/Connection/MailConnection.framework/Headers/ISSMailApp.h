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
#import "SSMailErrorInfo.h"
#import <ShareSDK/ShareSDK.h>

///#begin zh-cn
/**
 *	@brief	邮件应用协议
 */
///#end
///#begin en
/**
 *	@brief	Mail App Protocol
 */
///#end
@protocol ISSMailApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	设置邮件视图委托
 *
 *	@param 	viewDelegate 	视图委托
 */
///#end
///#begin en
/**
 *	@brief	Set View delegate.
 *
 *	@param 	viewDelegate 	View delegate object.
 */
///#end
- (void)setViewDelegate:(id<ISSViewDelegate>)viewDelegate;

///#begin zh-cn
/**
 *	@brief	发送邮件
 *
 *	@param 	subject 	主题
 *	@param 	content 	内容
 *	@param 	isHTML 	是否为HTML格式
 *	@param 	attachments 	附件列表
 *	@param 	to 	接受人列表
 *	@param 	cc 	抄送人列表
 *	@param 	bcc 	密送人列表
 *	@param 	container 	容器
 *  @param  viewDelegate    视图委托,实现了ISSViewDelegate协议的对象
 *  @param  result  返回回调
 */
///#end
///#begin en
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
///#end
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
