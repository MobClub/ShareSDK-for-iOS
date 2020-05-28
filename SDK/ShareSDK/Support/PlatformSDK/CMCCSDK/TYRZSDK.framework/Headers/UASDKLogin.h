//
//  UASDKLogin.h
//  TYRZSDK
//
//  Created by 谢鸿标 on 2018/10/11.
//  Copyright © 2018 com.CMCC.iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UASDKVERSION @"quick_login_iOS_5.7.1"

@class UACustomModel;
NS_ASSUME_NONNULL_BEGIN

@interface UASDKLogin : NSObject

/**
 SDK登录单例管理
 */
@property (nonatomic,class,readonly) UASDKLogin *shareLogin;

/**
 网络类型及运营商（双卡下，获取上网卡的运营商）
 "carrier"     运营商： 0.未知 / 1.中国移动 / 2.中国联通 / 3.中国电信
 "networkType" 网络类型： 0.无网络/ 1.数据流量 / 2.wifi / 3.数据+wifi
 @return  @{NSString : NSNumber}
 */
@property (nonatomic,readonly) NSDictionary<NSString *, NSNumber *> *networkInfo;

/**
 初始化SDK参数
 
 @param appId 申请能力平台成功后，分配的appId
 @param appKey 申请能力平台成功后，分配的appKey
 */
- (void)registerAppId:(NSString *)appId AppKey:(NSString *)appKey;

/**
 设置超时

 @param timeout 超时
 */
- (void)setTimeoutInterval:(NSTimeInterval)timeout;

/**
 取号

 @param completion 回调
 */
- (void)getPhoneNumberCompletion:(void(^)(NSDictionary *_Nonnull result))completion;

/**
 一键登录，获取到的token，可传给移动认证服务端获取完整手机号
 
 @param model 需要配置的Model属性（控制器必传）
 @param completion 回调
 */
- (void)getAuthorizationWithModel:(UACustomModel *)model complete:(void (^)(id sender))completion;

/**
 获取本机号码校验token

 @param completion 回调
 */
- (void)mobileAuthCompletion:(void(^)(NSDictionary *_Nonnull result))completion;

/**
 删除取号缓存数据 + 重置网络开关（自定义按钮事件里dimiss授权界面需调用）
 
 @return YES：有缓存已执行删除操作，NO：无缓存不执行删除操作
 */
- (BOOL)delectScrip;

/**
 控制台日志输出控制（默认关闭）
 
 @param enable 开关参数
 */
- (void)printConsoleEnable:(BOOL)enable;


/**
 关闭授权界面
 @param flag 动画开关
 @param completion 回调参数

 */
- (void)ua_dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
