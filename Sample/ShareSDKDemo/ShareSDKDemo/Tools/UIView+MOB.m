//
//  UIView+MOB.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/10/29.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIView+MOB.h"

@implementation UIView (MOB)

- (UINavigationController *)navigationController{
    id nextResponder = self;
    while (nextResponder) {
        if ([nextResponder isKindOfClass:[UIViewController class]] && [nextResponder navigationController] != nil) {
            nextResponder = [nextResponder navigationController];
            break;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nextResponder;
}

- (UIViewController *)viewController{
    id nextResponder = self;
    while (nextResponder) {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            break;
        }
        nextResponder = [nextResponder nextResponder];
    }
    return nextResponder;
}
@end
