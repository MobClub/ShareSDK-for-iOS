//
//  SSDKSession.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/3/16.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  会话基础类
 */
@interface SSDKSession : NSObject

/**
 *  会话标志
 */
@property (nonatomic, copy, readonly) NSString *sessionId;

/**
 *  开始会话
 */
- (void)start;

@end
