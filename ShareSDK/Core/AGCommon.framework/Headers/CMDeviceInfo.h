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
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>

///#begin zh-cn
/**
 *	@brief	设备信息
 */
///#end
///#begin en
/**
 *	@brief	Device information.
 */
///#end
@interface CMDeviceInfo : NSObject

///#begin zh-cn
/**
 *	@brief	取得网卡的物理地址
 *
 *	@return	网卡物理地址
 */
///#end
///#begin en
/**
 *	@brief	Get MAC address.
 *
 *	@return	MAC address.
 */
///#end
+ (NSString *)macAddress;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Get device model.
 *
 *	@return	Device Model. Model as follows:
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
///#end
+ (NSString *)deviceModel;


@end
