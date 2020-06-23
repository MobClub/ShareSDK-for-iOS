//
//  UIViewController+SSDK.m
//  ShareSDKDemo
//
//  Created by maxl on 2020/6/8.
//  Copyright © 2020 mob. All rights reserved.
//

#import "UIViewController+SSDK.h"

@implementation UIViewController (SSDK)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod([UIViewController class], @selector(mob_presentViewController:animated:completion:)), class_getInstanceMethod([UIViewController class], @selector(presentViewController:animated:completion:)));
    });
}

- (void)mob_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    [self mob_presentViewController:viewControllerToPresent animated:flag completion:completion];
}
@end
