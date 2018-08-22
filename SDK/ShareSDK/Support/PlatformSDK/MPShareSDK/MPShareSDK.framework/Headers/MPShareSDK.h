//
//  MPShareSDK.h
//  MPShareSDK
//
//  Created by WangLe on 15/9/17.
//  Copyright (c) 2015年 美图网. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MPSDKProtocol <NSObject>

@optional

/**
 *  分享到美拍是否成功
 *
 *  @param success 是否成功
 */
- (void)shareToMeipaiDidSucceed:(BOOL)success;

@end

@interface MPShareSDK : NSObject

/**
 *  注册应用到美拍
 *
 *  @param appKey 注册的 appkey
 */
+ (void)registerApp:(NSString *)appKey;

/**
 *  美拍是否安装
 */
+ (BOOL)isMeipaiInstalled;

/**
 *  当前版本美拍是否支持视频分享
 */
+ (BOOL)isMeipaiSupportVideoSharing;

/**
 *  当前版本美拍是否支持照片分享
 */
+ (BOOL)isMeipaiSupportPhotoSharing;

/**
 *  分享视频到美拍
 *
 *  @param pathUrl 视频在相册中的 url
 *  一个 url 的地址实例:assets-library://asset/asset.m4v?id=E5A30D8D-77AE-40D2-8755-8CA43CAA19EB&ext=m4v
 */
+ (void)shareVideoAtPathToMeiPai:(NSURL *)pathURL;

/**
 *  分享照片到美拍
 *
 *  @param pathURL 照片在相册中的 url
 *  一个 url 的地址实例:assets-library://asset/asset.JPG?id=B003D0A0-B1E4-40C9-9864-EFA9CD39597C&ext=JPG
 */
+ (void)sharePhotoAtPathToMeiPai:(NSURL *)pathURL;

/**
 *  处理美拍客户端程序通过 url 启动第三方应用时传递的数据
 *  需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用
 *
 *  @param url 启动第三方应用的URL
 *  @param delegate 用来接收分享成功或失败的代理
 */
+ (BOOL)handleOpenURL:(NSURL *)url delegate:(id<MPSDKProtocol>)delegate;

#pragma mark - Deprecated

/**
 *  Deprecated
 *  当前安装的美拍是否支持第三方的视频分享
 @see Use isMeipaiSupportVideoSharing instead
 */
+ (BOOL)isMeipaiSupportSharing __attribute__((deprecated("Use isMeipaiSupportVideoSharing instead. Deprecated in version 1.0")));

@end
