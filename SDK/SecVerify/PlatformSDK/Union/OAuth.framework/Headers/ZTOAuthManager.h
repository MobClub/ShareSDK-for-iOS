//
//  ZTOAuthManager 电信能力接入管理者
//  OAuthSDKApp
//
//  Created by zhangQY on 2019/5/13.
//  Copyright © 2019 com.zzx.sdk.ios.test. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZOAuthManager.h"

@interface ZTOAuthManager : ZOAuthManager

/**
 *  获取电信能力接入单例对象
 */
+ (instancetype)getInstance;


/**
 * 初始化-电信
 */
- (void) init:(NSString*) apiKey pubKey:(NSString*)pubKey;


/**
 * 取号-电信
 */
- (void) login:(double)timeout resultListener:(void (^)(NSDictionary *data))listener;


/**
 * 清除缓存 ***注意***：SDK取号默认会使用缓存机制，请及时清理缓存；
 */
+ (BOOL)clearCTLoginCache;


/**
    不推荐使用
  中断取号登录流程(按需使用)
  取消取号请求
 */
- (void)tryToInterruptTheCTLoginFlow;


/**
 *  认证-电信 ***注意***：在不手动关闭缓存的时，请及时调用清除缓存方法；
 */
- (void) oauth:(double)timeout resultListener:(void (^)(NSDictionary *data))listener;


/** 电信认证：是否关闭缓存策略（默认开启）
 请注意及时调用clearOauthCache方法清除缓存；
 手动关闭后，不必调用clearOauthCache；
 @param  yesOrNo 是否关闭电信认证缓存策略
 */
- (void) closeCTOauthCachingStrategy:(BOOL)yesOrNo;


/**
 电信认证：
 清除电信认证缓存策略中产生的缓存数据；
 在手动关闭缓存策略时，不必调用；
 */
+ (BOOL) clearCTOauthCache;


/**
 *  （测试接口）获取登录/认证结果
 */
- (void) gmbc:(NSString*)accessCode mobile:(NSString *)mobile listener:(void (^)(NSDictionary *data))listener;



//释放SDK内部单例对象 不推荐使用
-(void)ZOAURelease;


@end
