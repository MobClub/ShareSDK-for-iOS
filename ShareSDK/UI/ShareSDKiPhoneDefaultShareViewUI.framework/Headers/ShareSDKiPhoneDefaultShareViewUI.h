//
//  ShareSDKiPhoneDefaultShareViewUI.h
//  ShareSDKiPhoneDefaultShareViewUI
//
//  Created by 冯 鸿杰 on 13-4-7.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ISSShareView.h>
#import <ShareSDK/ShareSDK.h>

/**
 *	@brief	iPhone默认分享视图
 */
@interface ShareSDKiPhoneDefaultShareViewUI : NSObject

/**
 *	@brief	创建分享视图
 *
 *	@return	分享视图对象
 */
+ (id<ISSShareView>)create;

/**
 *	@brief	设置获取用户信息事件
 *
 *	@param 	result 	返回事件处理
 */
+ (void)onGetUserInfoResult:(SSGetUserInfoEventHandler)result;


@end
