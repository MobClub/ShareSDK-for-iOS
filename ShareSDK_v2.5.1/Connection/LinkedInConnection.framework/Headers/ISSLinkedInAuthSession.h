//
//  ISSLinkedAuthSession.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	授权会话
 */
@protocol ISSLinkedInAuthSession <ISSCAuthSession>

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
