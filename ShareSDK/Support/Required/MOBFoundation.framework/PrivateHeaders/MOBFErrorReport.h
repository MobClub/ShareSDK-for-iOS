//
//  MOBFErrorReport.h
//  MOBFoundation
//
//  Created by 刘 靖煌 on 15/5/25.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MOBFErrorReportTypeDef.h"
#import "MOBFErrorMsg.h"
#import <dlfcn.h>

/**
 *  异常报告核心类
 */
@interface MOBFErrorReport : NSObject<UIApplicationDelegate>

/**
 *  初始化错误信息报告
 *
 *  @param appKey     应用标识
 *  @param sdkType    SDK类型
 *  @param sdkVersion SDK版本
 *
 *  @return 错需信息报告类型
 */
- (instancetype)initWithAppKey:(NSString *)appKey
                       sdkType:(MOBFSDKType)sdkType
                    sdkVersion:(NSString *)sdkVersion __deprecated_msg("use [initWithAppKey:productType:sdkVersion:] method instead");

/**
 *  初始化错误信息报告
 *
 *  @param appKey           应用标识
 *  @param productType      产品类型
 *  @param sdkVersion       SDK版本
 *
 *  @return 错需信息报告类型
 */
- (instancetype) initWithAppKey:(NSString *)appKey
                    productType:(NSString *)productType
                     sdkVersion:(NSString *)sdkVersion;

/**
 *  保存错误和异常数据。
 */
- (void)writeErrorDataWithMsg:(MOBFErrorMsg *)errorMsg;

/**
 *  写入一个错误信息
 *
 *  @param error 错误信息
 *  @param type  错误类型
 */
- (void)writeError:(NSError *)error forType:(MOBFErrorMsgType)type;

@end
