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

+ (instancetype)initWithAppKey:(NSString *)appKey
                       sdkType:(MOBFSDKType)sdkType
                    sdkVersion:(NSString *)sdkVersion;

/**
 *  保存错误和异常数据。
 */
- (void)writeErrorDataWithMsg:(MOBFErrorMsg *)errorMsg;

@end
