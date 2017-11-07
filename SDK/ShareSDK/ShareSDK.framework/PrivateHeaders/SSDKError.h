//
//  SSDKError.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/26.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
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
@interface SSDKError : NSError

/**
 *  初始化错误信息
 *
 *  @param code     错误码
 *  @param userInfo 用户自定义数据
 *
 *  @return 错误信息
 */
- (id)initWithCode:(NSInteger)code userInfo:(NSDictionary *)userInfo;

/**
 *  创建错误
 *
 *  @param object JSON对象
 *
 *  @return 错误信息
 */
+ (SSDKError *)errorWithJsonObject:(NSDictionary *)object;

/**
 *  创建未知错误信息
 *
 *  @return 错误信息对象
 */
+ (SSDKError *)unknownError;

/**
 *  创建尚未初始化SDK错误信息
 *
 *  @return 错误信息对象
 */
+ (SSDKError *)uninitSDKError;

/**
 *  创建拒绝请求错误信息
 *
 *  @return 错误信息对象
 */
+ (SSDKError *)deniedRequestError;

/**
 *  创建无上传文件错误信息
 *
 *  @param  path    文件路径
 *
 *  @return 错误信息对象
 */
+ (SSDKError *)uploadFileNotFoundErrorWithPath:(NSString *)path;

/**
 *  创建API请求失败错误信息
 *
 *  @param responder 回复数据
 *
 *  @return 错误信息对象
 */
+ (SSDKError *)apiRequestFailErrorWithResponder:(id)responder;

/**
 *  创建HTTP请求失败错误信息
 *
 *  @param statusCode 状态码
 *
 *  @return 错误信息对象
 */
+ (SSDKError *)httpRequestFailErrorWithStatusCode:(NSInteger)statusCode;

@end
