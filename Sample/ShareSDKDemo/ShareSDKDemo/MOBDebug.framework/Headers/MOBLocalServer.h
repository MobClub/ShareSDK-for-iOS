//
//  MOBLocalServer.h
//  MOBDebug
//
//  Created by 冯鸿杰 on 2017/7/28.
//  Copyright © 2017年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 本地服务
 */
@interface MOBLocalServer : NSObject

/**
 启动服务
 
 @param host 主机名称
 */
+ (void)startupWithHost:(NSString *)host;

/**
 停止服务
 */
+ (void)stop;

/**
 设置延时应答

 @param delay 延时时间（单位：秒）
 */
+ (void)setResponseDelay:(NSTimeInterval)delay;

/**
 下发业务错误数据,请求会到达$err接口

 @param incorrectDataEnabled 错误数据开关
 */
+ (void)responseIncorrectDataEnabled:(BOOL)incorrectDataEnabled;

/**
 请求失败开关，所有请求将下发错的状态码

 @param requestFailEnabled 请求错误开关
 */
+ (void)requestFailEnabled:(BOOL)requestFailEnabled;

/**
 使服务离线

 @param offlineEnabled 离线开关
 */
+ (void)offlineEnabled:(BOOL)offlineEnabled;

@end
