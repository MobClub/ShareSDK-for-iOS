//
//  ZUOAuthManager 联通能力接入管理者
//  OAuthSDKApp
//
//  Created by zhangQY on 2019/5/13.
//  Copyright © 2019 com.zzx.sdk.ios.test. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZOAuthManager.h"

@interface ZUOAuthManager : ZOAuthManager


/**
 *  获取联通能力接入单例对象
 */
+ (instancetype)getInstance;


/**
 *  初始化-联通
 */
- (void) init:(NSString*) apiKey pubKey:(NSString*)pubKey;


/**
 *  取号-联通
 */
- (void)login:(double)timeout resultListener:(void (^)(NSDictionary *data))listener;


/**
 * 清除缓存 ***注意***：SDK取号默认会使用缓存机制，请及时清理缓存；
 */
+ (BOOL)clearCULoginCache;


/**
 不推荐使用
 中断取号登录流程(按需使用)
 取消取号请求
 */
- (void)tryToInterruptTheCULoginFlow;


/**
 *  认证-联通
 注意***：在不手动关闭缓存的时，请及时调用清除缓存方法
 */
- (void) oauth:(double)timeout resultListener:(void (^)(NSDictionary *data))listener;


/** 联通认证：是否关闭缓存策略（默认开启）
 请注意及时调用clearOauthCache方法清除缓存；
 手动关闭后，不必调用clearOauthCache；
 @param  yesOrNo 是否关闭联通认证缓存策略
 */
- (void) closeCUOauthCachingStrategy:(BOOL)yesOrNo;


/**
 联通认证：
 清除联通认证缓存策略中产生的缓存数据；
 在手动关闭缓存策略时，不必调用；
 */
+ (BOOL) clearCUOauthCache;


/**
 *  获取登录/认证结果
 *  测试接口
 */
- (void) gmbc:(NSString*)accessCode mobile:(NSString *)mobile listener:(void (^)(NSDictionary *data))listener;


//释放SDK内部单例对象 不推荐使用
-(void)ZOAURelease;

@end
