//
//  UIDevice+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (SSDKCategory)

+ (double)systemVersion;

+ (NSString *)localVersion;

+ (NSString *)localBuild;

+ (NSString *)storeUrlWithAppId:(NSString *)appId;

@property (nonatomic, readonly) BOOL isJailbroken;

@property (nonatomic, readonly) BOOL isPad;

@property (nonatomic, readonly) BOOL isSimulator;

@property (nullable, nonatomic, readonly) NSString *machineModel;

@property (nullable, nonatomic, readonly) NSString *machineModelName;

/**
 系统启动时间
 */
@property (nonatomic, readonly) NSDate *systemUptime;

@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");
/**
 wifi IP
 */
@property (nullable, nonatomic, readonly) NSString *ipAddressWIFI;

/**
 cell IP
 */
@property (nullable, nonatomic, readonly) NSString *ipAddressCell;

typedef NS_OPTIONS(NSUInteger, SSDKNetworkTrafficType) {
    SSDKNetworkTrafficTypeWWANSent     = 1 << 0,
    SSDKNetworkTrafficTypeWWANReceived = 1 << 1,
    SSDKNetworkTrafficTypeWIFISent     = 1 << 2,
    SSDKNetworkTrafficTypeWIFIReceived = 1 << 3,
    SSDKNetworkTrafficTypeAWDLSent     = 1 << 4,
    SSDKNetworkTrafficTypeAWDLReceived = 1 << 5,
    
    SSDKNetworkTrafficTypeWWAN = SSDKNetworkTrafficTypeWWANSent | SSDKNetworkTrafficTypeWWANReceived,
    SSDKNetworkTrafficTypeWIFI = SSDKNetworkTrafficTypeWIFISent | SSDKNetworkTrafficTypeWIFIReceived,
    SSDKNetworkTrafficTypeAWDL = SSDKNetworkTrafficTypeAWDLSent | SSDKNetworkTrafficTypeAWDLReceived,
    
    SSDKNetworkTrafficTypeALL = SSDKNetworkTrafficTypeWWAN |
    SSDKNetworkTrafficTypeWIFI |
    SSDKNetworkTrafficTypeAWDL,
};

- (uint64_t)getNetworkTrafficBytes:(SSDKNetworkTrafficType)types;


#pragma mark - Disk Space


@property (nonatomic, readonly) int64_t diskSpace;

@property (nonatomic, readonly) int64_t diskSpaceFree;

@property (nonatomic, readonly) int64_t diskSpaceUsed;

#pragma mark - Memory Information

@property (nonatomic, readonly) int64_t memoryTotal;

@property (nonatomic, readonly) int64_t memoryUsed;

@property (nonatomic, readonly) int64_t memoryFree;

@property (nonatomic, readonly) int64_t memoryActive;

@property (nonatomic, readonly) int64_t memoryInactive;

@property (nonatomic, readonly) int64_t memoryWired;

@property (nonatomic, readonly) int64_t memoryPurgable;

@property (nonatomic, readonly) NSUInteger cpuCount;

@property (nonatomic, readonly) float cpuUsage;

@property (nullable, nonatomic, readonly) NSArray<NSNumber *> *cpuUsagePerProcessor;

@end

NS_ASSUME_NONNULL_END
