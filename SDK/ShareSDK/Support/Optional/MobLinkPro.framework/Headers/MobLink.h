//
//  MobLink.h
//  MobLink
//
//  Created by chenjd on 16/11/14.
//  Copyright © 2016年 Mob. All rights reserved.
//  Offline

#import <Foundation/Foundation.h>
#import "IMLSDKRestoreDelegate.h"

@class MLSDKScene;

typedef void(^MLSDKResultHandler)(NSString *_Nullable mobid, NSString *_Nullable domain, NSError *_Nullable error);

@interface MobLink : NSObject

/**
 获取MobId

 @param scene 当前场景信息(即传入您需要还原的场景)
 @param resultHandler 回调处理,返回mobid
 */
+ (void)getMobId:(nullable MLSDKScene *)scene result:(MLSDKResultHandler)resultHandler;

/**
 设置场景恢复委托
 
 @param delegate 委托对象
 */
+ (void)setDelegate:(id <IMLSDKRestoreDelegate>)delegate;

/**
 MobLink 版本号

 @return 当前版本号
 */
+ (NSString *)sdkVer;

@end
