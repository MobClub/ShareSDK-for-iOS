//
//  SceneDelegateTwo.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/12.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SceneDelegate.h"
NS_ASSUME_NONNULL_BEGIN
@protocol UIWindowSceneDelegate;
@interface SceneDelegateTwo : NSObject<UIWindowSceneDelegate>
@property (nonatomic, strong) UIWindow * window;
@end

NS_ASSUME_NONNULL_END
