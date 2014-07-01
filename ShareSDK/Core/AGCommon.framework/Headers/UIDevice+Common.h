//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
 *	@brief	Network type
 */
typedef enum
{
	CMNetworkTypeNone = 0, /**< 无网络 */
	CMNetworkTypeCellular = 1, /**< 蜂窝网络 */
    CMNetworkTypeWifi = 2, /**< wifi */
}
CMNetworkType;

/**
 *	@brief	UIDevice Category
 */
@interface UIDevice (Common)

/**
 *	@brief	Determine whether the iPhone5
 *
 *	@return	YES：is iPhone5，NO：Not iPhone5
 */
- (BOOL)isPhone5;

/**
 *	@brief	Get System jailbreak flag
 *
 *	@return	YES said it had jailbreak, otherwise there is no jailbreak.
 */
- (BOOL)isJailBroken;

/**
 *	@brief	Get MAC address.
 *
 *	@return	MAC address.
 */
- (NSString *)macAddress;

/**
 *	@brief	Get device model.
 *
 *	@return	Device model. Model follows：
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
 *	@brief	Get current network type.
 *
 *	@return	Network type.
 */
- (CMNetworkType)currentNetworkType;

/**
 *	@brief	Get the WIFI enabled
 *
 *	@return	YES indicates WIFI enabled，NO indicates WIFI disabled.
 */
- (BOOL)isEnableWIFI;

/**
 *	@brief	Get the 3G enabled
 *
 *	@return	YES indicates 3G enabled，NO indicates 3G disabled.
 */
- (BOOL)isEnable3G;

/**
 *	@brief	Determine whether the iPad device
 *
 *	@return	YES：is iPad，NO：Not iPad.
 */
- (BOOL)isPad;

/**
 *	@brief	Get running processes information.
 *
 *	@return	Running processes information.
 */
- (NSArray *)runningProcesses;

@end
