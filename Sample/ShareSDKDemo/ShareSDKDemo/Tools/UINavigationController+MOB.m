//
//  UINavigationController+MOB.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/9/16.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UINavigationController+MOB.h"

@implementation UINavigationController (MOB)
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
