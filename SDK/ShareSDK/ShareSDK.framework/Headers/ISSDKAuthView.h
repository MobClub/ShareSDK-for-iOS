//
//  ISSDKAuthView.h
//  ShareSDK
//
//  Created by fenghj on 15/12/2.
//  Copyright © 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDKTypeDefine.h"


@protocol ISSDKAuthView <NSObject>

/**
 *  取消授权
 */
- (void)cancel;

/**
 *  授权状态变更时触发
 *
 *  @param stateChangedHandler 授权状态变更处理器
 */
- (void)onAuthStateChanged:(SSDKAuthorizeStateChangedHandler)stateChangedHandler;

@end
