//
//  MOBSDKDef.h
//  MOBFoundation
//
//  Created by liyc on 2018/8/22.
//  Copyright © 2018年 MOB. All rights reserved.
//

#ifndef MOBSDKDef_h
#define MOBSDKDef_h
#import <Foundation/Foundation.h>

/**
 *  国际域名类型
 */
typedef NS_ENUM(NSUInteger, MOBFSDKDomainType){
    /**
     *  默认（大陆域名）
     */
    MOBFSDKDomainTypeDefault  = 0,
    /**
     *  美国
     */
    MOBFSDKDomainTypeUS = 1,
    /**
     *  日本
     */
    MOBFSDKDomainTypeJapan = 2,
};


/**
 *  网络类型
 */
typedef NS_ENUM(NSUInteger, MOBFNetworkType)
{
    /**
     *  无网咯
     */
    MOBFNetworkTypeNone         = 0,
    /**
     *  蜂窝网络
     */
    MOBFNetworkTypeCellular     = 2,
    /**
     *  WIFI
     */
    MOBFNetworkTypeWifi         = 1,
    /**
     *  2G网络
     */
    MOBFNetworkTypeCellular2G   = 3,
    /**
     *  3G网络
     */
    MOBFNetworkTypeCellular3G   = 4,
    /**
     *  4G网络
     */
    MOBFNetworkTypeCellular4G   = 5,
    /**
     *  5G网络
     */
    MOBFNetworkTypeCellular5G   = 6,
};


/**
 IP版本

 - MOBFIPVersion4: IPv4
 - MOBFIPVersion6: IPv6
 */
typedef NS_ENUM(NSUInteger, MOBFIPVersion)
{
    MOBFIPVersion4 = 0,
    MOBFIPVersion6 = 1,
};

#endif /* MOBSDKDef_h */
