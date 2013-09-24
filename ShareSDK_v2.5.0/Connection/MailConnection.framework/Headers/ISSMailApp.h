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
#import "SSMailErrorInfo.h"

/**
 *	@brief	邮件应用协议
 */
@protocol ISSMailApp <ISSCOpenApp>

/**
 *	@brief	登录帐户
 *
 *	@return	帐户信息
 */
- (id<ISSCAccount>)account;

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
- (void)sendMailWithSubject:(NSString *)subject
                    content:(NSString *)content
                     isHTML:(BOOL)isHTML
                attachments:(NSArray *)attachments
                         to:(NSArray *)to
                         cc:(NSArray *)cc
                        bcc:(NSArray *)bcc
                  container:(UIViewController *)container
               viewDelegate:(id)viewDelegate
                     result:(void(^)(SSCShareSessionState state, SSMailErrorInfo *error))result;


@end
