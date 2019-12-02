//
//  SceneDelegate.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SceneDelegate.h"
@protocol UIWindowSceneDelegate;
@class UIScene,UISceneSession,UISceneConnectionOptions, UIOpenURLContext;

@interface SceneDelegate ()<UIWindowSceneDelegate>

@end

@implementation SceneDelegate

- (void)scene:(id)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions API_AVAILABLE(ios(13.0)){
    _window.backgroundColor = [UIColor whiteColor];
}
- (void)sceneDidDisconnect:(UIScene *)scene API_AVAILABLE(ios(13.0)){
    
}

- (void)sceneDidBecomeActive:(UIScene *)scene API_AVAILABLE(ios(13.0)){
    
}
- (void)sceneWillResignActive:(UIScene *)scene API_AVAILABLE(ios(13.0)){
    
}

- (void)sceneWillEnterForeground:(UIScene *)scene API_AVAILABLE(ios(13.0)){
    
}
- (void)sceneDidEnterBackground:(UIScene *)scene API_AVAILABLE(ios(13.0)){
    
}
- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0)){
    
}
- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity API_AVAILABLE(ios(13.0)){
    
}

@end
