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

/**
 *	@brief	授权会话
 */
@protocol ISSKaiXinAuthSession <ISSCAuthSession>

/**
 *	@brief	获取是否允许回调到服务器标识，默认YES
 *
 *	@return	YES 表示回调服务器，NO 表示不回调服务器
 */
- (BOOL)allowCallback;

/**
 *	@brief	设置回调服务器标识，对于没有服务器的客户端应用可以设置为NO，则在接收授权信息后拦截回调。
 *
 *	@param 	allowCallback 	回调服务器标识
 */
- (void)setAllowCallback:(BOOL)allowCallback;

@end
