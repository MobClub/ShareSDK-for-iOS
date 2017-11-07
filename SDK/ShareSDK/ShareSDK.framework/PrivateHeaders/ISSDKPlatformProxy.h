//
//  ISSDKPlatformProxy.h
//  ShareSDK
//
//  Created by fenghj on 15/12/2.
//  Copyright © 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSDKAuthSession.h"

#ifdef __INNER_HEAD__

#import "ISSDKAuthView.h"

#else

#import <ShareSDK/ISSDKAuthView.h>

#endif

/**
 *  社交平台代理
 */
@protocol ISSDKPlatformProxy <NSObject>

/**
 *  获取授权视图对象
 *
 *  @param session  授权会话
 *  @param userData 用户数据，用于传递給授权视图的数据
 *  @param callback 回调
 *
 *  @return 授权视图，如果为nil，则表示使用默认的授权视图
 */
- (UIView<ISSDKAuthView> *)authViewWithSession:(id<ISSDKAuthSession>)session userData:(id)userData callback:(NSString *)callback;

@end
