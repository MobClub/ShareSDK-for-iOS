//
//  UIDevice+Common.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Common)

/**
 *	@brief	判断是否为iPhone5
 *
 *	@return	YES：是，NO：否
 */
- (BOOL)isPhone5;

/**
 *	@brief	获取系统越狱标识
 *
 *	@return	YES表示已经越狱，否则没有越狱。
 */
- (BOOL)isJailBroken;

/**
 *	@brief	取得网卡的物理地址
 *
 *	@return	网卡物理地址
 */
- (NSString *)macAddress;

/**
 *	@brief	获取设备型号
 *
 *	@return	设备型号：设备型号对照如下：
 *  iPhone1,1 ->    iPhone 1G
 *  iPhone1,2 ->    iPhone 3G
 *  iPhone2,1 ->    iPhone 3GS
 *  iPhone3,1 ->    iPhone 4
 *
 *  iPod1,1   -> iPod touch 1G
 *  iPod2,1   -> iPod touch 2G
 *  iPod2,2   -> iPod touch 2.5G
 *  iPod3,1   -> iPod touch 3G
 *  iPod4,1   -> iPod touch 4
 *
 *  iPad1,1   -> iPad 1G, WiFi
 */
- (NSString *)deviceModel;

/**
 *	@brief	获取wifi的使能状态
 *
 *	@return	YES wifi可用，NO wifi不可用
 */
- (BOOL)isEnableWIFI;

/**
 *	@brief	获取3G的使能状态
 *
 *	@return	YES 3G可用，NO 3G不可用
 */
- (BOOL)isEnable3G;

/**
 *	@brief	判断是否为iPad设备
 *
 *	@return	YES：是，NO：否
 */
- (BOOL)isPad;

/**
 *	@brief	获取运行进程
 *
 *	@return	运行进程
 */
- (NSArray *)runningProcesses;

@end
