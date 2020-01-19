//
//  UIWindow+SSDKCategory.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/9.
//  Copyright © 2019 mob. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (SSDKCategory)

- (void)showOnCurrentScene;

- (void)showOnScene:(id)scene;

@end

NS_ASSUME_NONNULL_END
