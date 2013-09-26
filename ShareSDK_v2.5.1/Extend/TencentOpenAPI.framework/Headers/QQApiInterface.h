///
/// \file QQApiInterface.h
/// \brief QQApi接口简化封装
///
/// Created by Tencent on 12-5-15.
/// Copyright (c) 2012年 Tencent. All rights reserved.
///

#import <Foundation/Foundation.h>
#import "QQApi.h"
#import "QQApiInterfaceObject.h"

/**
 \brief 处理来至QQ的请求及响应的回调协议
 */
@protocol QQApiInterfaceDelegate <NSObject>

/**
 处理来至QQ的请求
 */
- (void)onReq:(QQBaseReq *)req;

/**
 处理来至QQ的响应
 */
- (void)onResp:(QQBaseResp *)resp;

@end

/**
 \brief 对QQApi的简单封装类
 */
@interface QQApiInterface : NSObject

/**
 处理由手Q唤起的跳转请求
 \param url 待处理的url跳转请求
 \param delegate 第三方应用用于处理来至QQ请求及响应的委托对象
 \return 跳转请求处理结果，YES表示成功处理，NO表示不支持的请求协议或处理失败
 */
+ (BOOL)handleOpenURL:(NSURL *)url delegate:(id<QQApiInterfaceDelegate>)delegate;

/**
 向手Q发起分享请求
 \param req 分享内容的请求
 \return 请求发送结果码
 */
+ (QQApiSendResultCode)sendReq:(QQBaseReq *)req;

/**
 向手Q发送应答消息
 \param resp 应答消息
 \return 应答发送结果码
 */
+ (QQApiSendResultCode)sendResp:(QQBaseResp *)resp;

/**
 检测是否已安装QQ
 \return 如果QQ已安装则返回YES，否则返回NO
 */
+ (BOOL)isQQInstalled;

/**
 检测QQ是否支持API调用
 \return 如果当前安装QQ版本支持API调用则返回YES，否则返回NO
 */  
+ (BOOL)isQQSupportApi;

/**
 启动QQ
 \return 成功返回YES，否则返回NO
 */
+ (BOOL)openQQ;

/**
 获取QQ下载地址
 
 如果App通过<code>QQApiInterface#isQQInstalled</code>和<code>QQApiInterface#isQQSupportApi</code>检测发现QQ没安装或当前版本QQ不支持API调用，可引导用户通过打开此链接下载最新版QQ。
 \return iPhoneQQ下载地址
 */
+ (NSString *)getQQInstallUrl;

@end
