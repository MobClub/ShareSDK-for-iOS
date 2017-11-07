//
//  ISSDKAuthSession.h
//  ShareSDK
//
//  Created by fenghj on 15/12/2.
//  Copyright © 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __INNER_HEAD__

#import "SSDKTypeDefine.h"

#else

#import <ShareSDK/SSDKTypeDefine.h>

#endif

/**
 *  授权绘画协议
 */
@protocol ISSDKAuthSession <NSObject>

/**
 *  获取会话标识
 *
 *  @return 会话标识
 */
- (NSString *)sessionId;

/**
 *  获取平台类型
 *
 *  @return 平台类型
 */
- (SSDKPlatformType)platformType;

/**
 *  获取授权设置
 *
 *  @return 授权设置
 */
- (NSDictionary *)settings;

/**
 *  获取状态变更事件
 *
 *  @return 状态变更事件
 */
- (SSDKAuthorizeStateChangedHandler)stateChangedHandler;

/**
 *  设置状态变更事件
 *
 *  @param stateChangedHandler 状态变更事件
 */
- (void)setStateChangedHandler:(SSDKAuthorizeStateChangedHandler)stateChangedHandler;

@end
