//
//  MOBFNetworkFlowInfo.h
//  MOBFoundation
//
//  Created by fenghj on 15/12/17.
//  Copyright © 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络流量信息
 */
@interface MOBFNetworkFlowInfo : NSObject

/**
 *  接收到的字节数
 */
@property (nonatomic, readonly) NSUInteger receivedBytes;

/**
 *  发送字节数
 */
@property (nonatomic, readonly) NSUInteger sentBytes;

/**
 *  最后的更新时间
 */
@property (nonatomic, strong, readonly) NSDate *lastChangeTime;

/**
 *  WIFI下的接收字节数
 */
@property (nonatomic, readonly) NSUInteger WIFIReceivedBytes;

/**
 *  WIFI下的发送字节数
 */
@property (nonatomic, readonly) NSUInteger WIFISentBytes;

/**
 *  蜂窝网络下的接收字节数
 */
@property (nonatomic, readonly) NSUInteger WWANReceivedBytes;

/**
 *  蜂窝网络下的发送字节数
 */
@property (nonatomic, readonly) NSUInteger WWANSentBytes;

/**
 *  获取网络流量信息共享实例
 *
 *  @return 网络流量信息对象
 */
+ (MOBFNetworkFlowInfo *)sharedInstance;

/**
 *  更新信息
 */
- (void)update;

@end
