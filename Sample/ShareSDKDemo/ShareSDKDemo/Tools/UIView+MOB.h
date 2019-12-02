//
//  UIView+MOB.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/10/29.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MOB)

//接收响应事件的NavigationController
- (UINavigationController *)navigationController;

//接收响应事件的ViewController
- (UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
