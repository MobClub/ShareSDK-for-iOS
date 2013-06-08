//
//  UIDevice+Common.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *	@brief	网络类型
 */
typedef enum
{
	CMNetworkTypeNone = 0, /**< 无网络 */
	CMNetworkTypeCellular = 1, /**< 蜂窝网络 */
    CMNetworkTypeWifi = 2, /**< wifi */
}
CMNetworkType;


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
 *  iPhone1,1  ->   iPhone (Original/EDGE)
 *  iPhone1,2  ->   iPhone 3G
 *  iPhone1,2* ->   iPhone 3G (China/No Wi-Fi)
 *  iPhone2,1  ->   iPhone 3GS
 *  iPhone2,1* ->   iPhone 3GS (China/No Wi-Fi)
 *  iPhone3,1  ->   iPhone 4 (GSM)
 *  iPhone3,3  ->   iPhone 4 (CDMA/Verizon/Sprint)
 *  iPhone4,1  ->   iPhone 4S
 *  iPhone4,1* ->   iPhone 4S (GSM China/WAPI)
 *  iPhone5,1  ->   iPhone 5 (GSM/LTE 4, 17/North America), iPhone 5 (GSM/LTE 1, 3, 5/International), iPhone 5 (GSM/LTE/AWS/North America)
 *  iPhone5,2  ->   iPhone 5 (CDMA/LTE, Sprint/Verizon/KDDI)
 *  iPhone5,2* ->   iPhone 5 (CDMA China/UIM/WAPI)
 *
 *  iPod1,1   -> iPod touch (Original)
 *  iPod2,1   -> iPod touch (2nd Gen)
 *  iPod2,2   -> iPod touch 2.5G
 *  iPod3,1   -> iPod touch (3rd Gen/8 GB), iPod touch (3rd Gen/32 & 64 GB)
 *  iPod4,1   -> iPod touch (4th Gen/FaceTime), iPod touch (4th Gen, 2011), iPod touch (4th Gen, 2012)
 *  iPod5,1   -> iPod touch (5th Gen)
 *
 *  iPad1,1   -> iPad Wi-Fi (Original), iPad Wi-Fi/3G/GPS (Original)
 *  iPad2,1   -> iPad 2 (Wi-Fi Only)
 *  iPad2,2   -> iPad 2 (Wi-Fi/GSM/GPS)
 *  iPad2,3   -> iPad 2 (Wi-Fi/CDMA/GPS)
 *  iPad2,4   -> iPad 2 (Wi-Fi Only, iPad2,4)
 *  iPad3,1   -> iPad 3rd Gen (Wi-Fi Only)
 *  iPad3,3   -> iPad 3rd Gen (Wi-Fi/Cellular AT&T/GPS)
 *  iPad3,2   -> iPad 3rd Gen (Wi-Fi/Cellular Verizon/GPS)
 *  iPad3,4   -> iPad 4th Gen (Wi-Fi Only)
 *  iPad3,5   -> iPad 4th Gen (Wi-Fi/AT&T/GPS)
 *  iPad3,6   -> iPad 4th Gen (Wi-Fi/Verizon & Sprint/GPS)
 *  iPad2,5   -> iPad mini (Wi-Fi Only)
 *  iPad2,6   -> iPad mini (Wi-Fi/AT&T/GPS)
 *  iPad2,7   -> iPad mini (Wi-Fi/Verizon & Sprint/GPS)
 */
- (NSString *)deviceModel;

/**
 *	@brief	获取当前网络类型
 *
 *	@return	网络类型
 */
- (CMNetworkType)currentNetworkType;

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
