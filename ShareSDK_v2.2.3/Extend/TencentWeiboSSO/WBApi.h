//
//  WBApi.h
//  WeiboSDK
//
//  Created by iwanglian on 12-12-19.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBApiObject.h"
#pragma mark -
@protocol WBApiDelegate <NSObject>

@optional
/*! @brief 登录错误回调
 *
 * 发生错误时，客户端根据错误码作相应处理，可选择显示SDK返回的错误码
 * @param errCode 错误码
 * @param msg 错误提示信息
 */
-(void)onLoginFailed:(WBErrCode)errCode msg:(NSString*)msg;

/*! @brief 登录成功回调
 *
 * 成功后返回用户openid及token
 * @param name 微博中使用的用户名
 * @param token 凭证，由客户端保存
 */
-(void)onLoginSuccessed:(NSString*)name token:(WBToken*)token;
@end

#pragma mark - 
@interface WBApi : NSObject

/*! @brief 处理微博通过URL启动App时传递的数据
 *
 * 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * @param url 启动App的URL
 * @param delegate  WBApiDelegate对象，用来接收微博触发的消息。
 * @return 成功返回YES，失败返回NO。
 */
+(BOOL) handleOpenURL:(NSURL *) url delegate:(id<WBApiDelegate>) delegate;


/*! @brief 检查腾讯微博是否支持当前版本SDK,如果未安装，或者版本低于预期，则返回NO
 *
 * @return 腾讯微博支持返回YES，不支持返回NO。
 */
+(BOOL) isWeiboAppSupport;


/*! @brief 获取微博的itunes安装地址
 *
 * @return 微博的安装地址字符串。
 */
+(NSString *) getWBAppInstallUrl;

/*! @brief 用户登录
 *
 * @param appid  应用程序在开放平台的appid
 * @param secret 应用程序在开放平台的安全码
 * @param reserver 预留字段, 不用则传入nil.
 * @return 成功返回YES，失败返回NO。
 */
+(BOOL) loginApp:(NSString *)appid secret:(NSString*)secret reserver:(NSString*)reserver;

@end
