//
//  DouyinOpenSDKApi.h
//  所有Api接口
//
//  Created by 抖音短视频 on 18/9/2017.
//  Copyright (c) 2018年 抖音短视频. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DouyinOpenSDKApiObject.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DouyinOpenSDKApiDelegate <NSObject>

@optional

/**
 接收并处理来自抖音短视频的请求消息
 
 @param req 抖音短视频主动发送的具体请求内容
 */
- (void)didReceiveRequest:(DouyinOpenSDKBaseReq * _Nonnull)req;

/**
 第三方应用程序通过sendReq向抖音短视频发送请求后，收到来自抖音短视频的响应
 
 @param resp 抖音短视频回应的具体内容
 */
- (void)didReceiveResponse:(DouyinOpenSDKBaseResp * _Nonnull)resp;

@end

@protocol DouyinOpenSDKLogDelegate <NSObject>

/**
 接收来自抖音短视频的日志，可供调试用
 
 @param log 日志内容
 */
- (void)onLog:(NSString *)log;

@end

@interface DouyinOpenSDKApi : NSObject

/**
 设置SDK日志代理，可供调试
 
 同时仅允许存在一个日志代理，每次调用将覆盖之前的delegate
 
 SDK会弱引用这个logDelegate
 
 @param logDelegate 日志代理
 */
+ (void)registerLogDelegate:(id<DouyinOpenSDKLogDelegate>)logDelegate;

/**
 清除SDK日志代理，停止调试
 
 会清除之前设置的日志代理
 */
+ (void)unregisterLogDelegate;

/**
 向抖音短视频注册第三方应用
 
 需要在每次启动第三方应用程序时调用。第一次调用后，将添加到头条的可用应用列表中
 
 @attention       必须在主线程执行
 
 @param appId       第三方应用在抖音短视频开放平台申请的appId（appId也称ClientKey）
 @return 成功返回YES，否则返回NO
 */
+ (BOOL)registerAppId:(NSString * _Nonnull)appId;

/**
 处理抖音短视频通过URL启动第三方应用时传递的数据，需在[application:openURL:sourceApplication:annotation:]或者[application:handleOpenURL:]中调用
 
 @attention 必须在主线程执行
 
 @param url         启动第三方应用的URL
 @param delegate    DouyinOpenSDKApiDelegate对象，用来接收抖音短视频触发的消息
 @return 成功处理返回YES，否则返回NO
 */
+ (BOOL)handleOpenURL:(NSURL * _Nonnull)url
             delegate:(id<DouyinOpenSDKApiDelegate> _Nullable)delegate;

/**
 获取当前SDK的版本
 
 @return 返回SDK当前版本号
 */
+ (nonnull NSString *)currentVersion;

/**
 判断用户是否安装了抖音短视频
 
 @return 安装返回YES，否则返回NO
 */
+ (BOOL)isAppInstalled;

/**
 判断当前抖音短视频版本是否支持授权登录
 
 @return 支持返回YES，否则返回NO
 */
+ (BOOL)isAppSupportAuthorization;

/**
 判断当前TOREPLACEPRODUCTNAME版本是否支持分享
 
 @return 支持返回YES，否则返回NO
 */
+ (BOOL)isAppSupportShare;

/**
 获取抖音短视频在iTunes上的下载地址
 
 @return 返回抖音短视频的安装地址
 */
+ (nonnull NSString *)getAppiTunesUrl;

/**
 由第三方APP给抖音短视频发送请求，抖音短视频处理完成后通过didReceiveResponse:回调
 
 @attention 必须运行在主线程
 
 @param req 发送给抖音短视频的请求
 @return 发送请求成功返回YES，否则返回NO并终止流程
 */
+ (BOOL)sendReq:(DouyinOpenSDKBaseReq * _Nonnull)req;

/*! @brief 发送Auth请求，唤起抖音短视频客户端，若用户没安装抖音短视频则唤起web授权页，等待抖音短视频返回response
 *
 * 函数调用后，会切换到抖音短视频的界面。第三方应用程序等待抖音短视频返回response
 * @param req 具体的发送请求，在调用函数后，请自己释放。
 * @param viewController 当前界面对象，用于展示抖音短视频的web授权页。
 * @param delegate DouyinOpenSDKApiDelegate对象，用来接收抖音短视频触发的消息。
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)sendAuthReq:(DouyinOpenSDKSendAuthReq*)req viewController:(UIViewController*)viewController delegate:(id<DouyinOpenSDKApiDelegate>)delegate;

/**
 进行web授权页预加载缓存，针对web页展示慢做的优化，使授权请求中展示web页更快
 若无需求可以不调用
 @param req 预加载的授权请求
*/
+ (void)preloadWebAuthWithReq:(DouyinOpenSDKSendAuthReq *)req;

/**
 清理web授权页预加载缓存
 若无需求可以不调用
*/
+ (void)clearPreloadWebAuthCache;

/**
 抖音短视频给第三方APP发送请求后，第三方APP通过didReceiveRequest:接收到请求后，第三方APP使用SendResp:给抖音短视频回送响应
 
 @attention 必须运行在主线程
 
 @param resp 回送给抖音短视频的响应
 @return 发送请求成功返回YES，否则返回NO并终止流程
 */
+ (BOOL)sendResp:(DouyinOpenSDKBaseResp * _Nonnull)resp;

@end

NS_ASSUME_NONNULL_END

