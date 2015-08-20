//
//  MOBFErrorReportTypeDef.h
//  MOBFoundation
//
//  Created by 刘 靖煌 on 15/5/25.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#ifndef MOBFoundation_MOBFErrorReportTypeDef_h
#define MOBFoundation_MOBFErrorReportTypeDef_h

/**
 SDK 类型
 */
typedef enum
{
    MOBFShareSDK,
    MOBFShareREC,
    MOBFSMSSDK,
    MOBFOther,
}MOBFSDKType;

/**
 *  统计异常系统配置接口
 */
#define kGetShareSDKExceptionConfigurationUrl @"http://api.exc.mob.com/errconf"

/**
 *  平台号
 */
#define kMobPlatform @"2"

/**
 *  错误报告日志名
 */
#define kMobErrorReportLogPath @"/kMobErrorReportLog"

/**
 *  异常报告配置日志名
 */
#define kMobErrorConfigurationLogPath @"/kMobErrorConfigurationLog"

#endif
