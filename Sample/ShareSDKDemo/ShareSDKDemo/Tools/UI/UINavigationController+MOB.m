//
//  UINavigationController+MOB.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/16.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UINavigationController+MOB.h"
#import <objc/runtime.h>
@implementation UINavigationController (MOB)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod([UINavigationController class], @selector(mob_pushViewController:animated:)), class_getInstanceMethod([UINavigationController class], @selector(pushViewController:animated:)));
    });
}


- (void)mob_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self mob_pushViewController:viewController animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (self.viewControllers.count > 0)
    {
        return [self.viewControllers.lastObject preferredStatusBarStyle];
    }
    
    return [super preferredStatusBarStyle];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if (self.viewControllers.count > 0)
    {
        return [self.viewControllers.lastObject supportedInterfaceOrientations];
    }
    
    return [super supportedInterfaceOrientations];
}

@end
