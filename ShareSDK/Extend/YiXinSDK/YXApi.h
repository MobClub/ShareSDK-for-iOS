//
//  YXApi.h
//  YixinSDK
//
//  Version 2.2
//  Created by yixin ( yixinopen@188.com )
//  Copyright (c) 2013年 yixin.im All rights reserved.
//

#import "YXApiObject.h"

/*! @brief 易信SDK Delegate
 *
 * 接收来至易信客户端的事件消息，接收后唤起第三方App来处理。
 * 易信SDK会在handleOpenURL中根据消息回调YXApiDelegate的方法。
 */
@protocol YXApiDelegate <NSObject>

/*! @brief 收到一个来自易信客户端的请求消息
 *
 * 收到一个来自易信客户端的请求消息。
 * 可能收到的请求消息有GetMessageFromYXReq、ShowMessageFromYXReq等。
 * @param req 请求事件消息的对象
 */
- (void)onReceiveRequest: (YXBaseReq *)req;

/*! @brief 收到一个来自易信客户端的应答消息
 *
 * 收到一个来自易信客户端的应答消息。
 * 可能收到的处理结果有SendMessageToYXResp。
 * @param resp 回应事件消息的对象
 */
- (void)onReceiveResponse: (YXBaseResp *)resp;

@end

/*! @brief 易信Api接口函数
 *
 *  易信SDK的所有接口函数
 */
@interface YXApi : NSObject

/*! @brief 注册第三方App到易信客户端。
 *
 * 启动三方App程序时调用，第一次调用后会在易信客户端的可用应用列表中出现。
 * @param appID 易信开放平台注册的开发者ID
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)registerApp: (NSString *)appID;

/*! @brief 检查易信客户端是否已安装
 *
 * @return 易信已安装返回YES，未安装返回NO。
 */
+ (BOOL)isYXAppInstalled;

/*! @brief 判断当前易信客户端的版本是否支持易信分享
 *
 * @return 支持返回YES，不支持返回NO。
 */
+(BOOL) isYXAppSupportApi;

/*! @brief 判断当前易信客户端的版本是否支持OAuth授权
 *
 * @return 支持返回YES，不支持返回NO。
 */
+(BOOL) isYXAppSupportOAuth;

/*! @brief 判断当前易信客户端的版本是否支持收藏到易信功能
 *
 * @return 支持返回YES，不支持返回NO。
 */
+(BOOL) isYXAppSupportFav;

/*! @brief 打开易信客户端
 *
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)openYXApp;

/*! @brief 第三方App被易信客户端通过URL唤起时的调用
 *
 * 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * @param url 启动第三方App的URL
 * @param delegate  YXApiDelegate对象，用来接收易信客户端触发的消息。
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)handleOpenURL: (NSURL *)url
             delegate: (id<YXApiDelegate>)delegate;

/*! @brief 发送请求消息到易信客户端。
 *
 * 发送消息后，会唤起易信客户端；第三方应用程序等待易信返回响应消息。
 * 可能发送的请求有 SendMessageToYXReq等。
 * @param req 请求事件消息的对象，在调用函数后，请自己释放。
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)sendReq: (YXBaseReq *)req;

/*! @brief 发送应答消息给易信客户端，并唤起易信客户端
 *
 * 函数调用后，会切换到易信的界面。可能发送的相应有
 * GetMessageFromYXResp、ShowMessageFromYXResp等。
 * @param resp 应答事件消息的对象，调用函数后，请自己释放
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)sendResp: (YXBaseResp *)resp;

@end
