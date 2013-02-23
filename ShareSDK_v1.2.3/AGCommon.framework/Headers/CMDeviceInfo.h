//
//  Device.h
//  StoreKitSDK
//
//  Created by 冯 鸿杰 on 12-9-25.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	设备信息
 */
@interface CMDeviceInfo : NSObject

/**
 *	@brief	取得网卡的物理地址
 *
 *	@return	网卡物理地址
 */
+ (NSString *)macAddress;

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
+ (NSString *)deviceModel;


@end
