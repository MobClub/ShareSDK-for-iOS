//
//  MOBFApplicationUtils.h
//  MOBFoundation
//
//  Created by vimfung on 15-1-20.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  应用工具类
 */
@interface MOBFApplication : NSObject

/**
 *  获取应用名称
 *
 *  @return 应用名称
 */
+ (NSString *)name;

/**
 *  获取应用包名
 *
 *  @return 包名
 */
+ (NSString *)bundleId;

/**
 *  获取应用编译版本
 *
 *  @return 编译版本
 */
+ (NSString *)buildVersion;

/**
 *  获取应用版本号
 *
 *  @return 应用版本号
 */
+ (NSString *)shortVersion;

/**
 *  获取应用版本号
 *
 *  @return 版本号
 */
+ (NSString *)version __deprecated_msg("use [buildVersion] method instead");

/**
 *  检测是否启用ATS功能
 */
+ (BOOL)enabledATS;

/**
 *  获取应用运行经过的时间（单位：毫秒）
 *
 *  @return 经过时间
 */
+ (uint64_t)elapsedTime;

@end
