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
#import "SSVKontakteUser.h"
#import "SSVKontakteErrorInfo.h"
#import "SSVKontakteCredential.h"
#import "SSVKontaktePost.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	VKontakte应用
 */
///#end
///#begin en
/**
 *	@brief	VKontakte App
 */
///#end
@protocol ISSVKontakteApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	 Get app key
 *
 *	@return	App key
 */
///#end
- (NSString *)appKey;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get secret key
 *
 *	@return	Secret key.
 */
///#end
- (NSString *)secretKey;

///#begin zh-cn
/**
 *	@brief	发布文章到用户墙上
 *
 *	@param 	message 	内容，如果附件没有设置则为必填项
 *	@param 	attachments 	附件，如果内容没有设置则为必填项
 *  @param  url     链接地址
 *  @param  groupId     组标识,当设置了attachments参数时必填。
 *	@param 	friendsOnly 	是否仅允许好友查看
 *	@param 	locationCoordinate 	发布文章时的位置
 *  @param  result    返回回调
 */
///#end
///#begin en
/**
 *	@brief	Publish a Wall Post.
 *
 *	@param 	message 	Content string, if not set attachments, was required.
 *	@param 	attachments 	Attachment list，if not set message, was required.
 *  @param  url     URL string.
 *  @param  groupId     Group id,When setting up attachments parameters required。
 *	@param 	friendsOnly 	Whether to allow only friends to view
 *	@param 	locationCoordinate 	Position when publish post.
 *  @param  result    Result hanlder.
 */
///#end
- (void)wallPostWithMessage:(NSString *)message
                attachments:(NSArray *)attachments
                        url:(NSString *)url
                    groupId:(NSString *)groupId
                friendsOnly:(NSNumber *)friendsOnly
         locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                     result:(SSShareResultEvent)result;


@end
