//
//  SSPError.h
//  ShareSDKConnector
//
//  Created by fenghj on 15/6/4.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  错误域
 */
extern NSString *const SSDKErrorDomain;

#pragma mark - 错误码定义

/**
 *  未知错误
 */
extern const NSInteger SSDKErrorCodeUnknown;

/**
 *  尚未初始化SDK
 */
extern const NSInteger SSDKErrorCodeUninitSDK;

/**
 *  无上传文件
 */
extern const NSInteger SSDKErrorCodeUploadFileNotFound;

/**
 *  API请求失败
 */
extern const NSInteger SSDKErrorCodeAPIRequestFail;

/**
 *  HTTP请求失败
 */
extern const NSInteger SSDKErrorCodeHTTPRequestFail;

/**
 *  拒绝请求
 */
extern const NSInteger SSDKErrorCodeDeniedRequest;

/**
 *  无任何平台
 */
extern const NSInteger SSDKErrorCodePlatformNotFound;

/**
 *  未初始化平台
 */
extern const NSInteger SSDKErrorCodeUninitPlatform;

/**
 *  无效的授权回调
 */
extern const NSInteger SSDKErrorCodeInvalidAuthCallback;

/**
 *  用户尚未授权
 */
extern const NSInteger SSDKErrorCodeUserUnauth;

/**
 *  不支持的功能
 */
extern const NSInteger SSDKErrorCodeUnsupportFeature;

/**
 *  平台无效
 */
extern const NSInteger SSDKErrorCodeInvalidPlatform;

/**
 *  API调用失败
 */
extern const NSInteger SSDKErrorCodeSocialAPIRequestFail;

/**
 *  不支持的分享类型
 */
extern const NSInteger SSDKErrorCodeUnsupportContentType;

/**
 *  尚未设置URL Scheme
 */
extern const NSInteger SSDKErrorCodeUnsetURLScheme;

/**
 *  尚未安装客户端
 */
extern const NSInteger SSDKErrorCodeNotYetInstallClient;

/**
 *  错误信息
 */
@interface SSPError : NSError

@end
