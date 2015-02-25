
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
