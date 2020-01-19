//
//  SceneDelegate.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#ifndef __IPHONE_13_0

@protocol UIWindowSceneDelegate <NSObject>

@end

#endif
@interface SceneDelegate : NSObject

@property (nonatomic, strong) UIWindow * window;

@end

NS_ASSUME_NONNULL_END
