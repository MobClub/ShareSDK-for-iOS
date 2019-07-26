//
//  ISSERestoreDelegate.h
//  ShareSDKExtension
//
//  Created by wkx on 2019/7/22.
//  Copyright © 2019年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SSERestoreScene;

@protocol ISSERestoreSceneDelegate <NSObject>

@optional

/**
 即将进行场景还原(注意: 一旦实现该方法,请务必执行restoreHandler)
 
 @param scene 场景参数
 @param restoreHandler 恢复回调 回调参数YES,或者不实现本方法,将会进行自动场景恢复;回调参数 NO,则不会进行自动恢复场景,请自行根据场景对象scene进行处理;
 */
- (void)ISSEWillRestoreScene:(SSERestoreScene *)scene Restore:(void (^)(BOOL isRestore))restoreHandler;

/**
 完成场景恢复
 
 @param scene 场景参数
 */
- (void)ISSECompleteRestoreScene:(SSERestoreScene *)scene;

/**
 无法进行场景恢复,原因可能是以下几个: 1.需要恢复的控制器,没有实现 UIViewController+SSERestoresScene 中的相关方法; 2.没有找到场景对应的控制器;
 
 @param scene 场景参数
 */
- (void)ISSENotFoundScene:(SSERestoreScene *)scene;

@end

