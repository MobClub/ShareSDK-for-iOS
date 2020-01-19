//
//  UIViewController+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/21.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIViewController+SSDKCategory.h"

#import "UIApplication+SSDKCategory.h"

@implementation UIViewController (SSDKCategory)

- (UINavigationController *)ssdk_navigationController{
    UIResponder * responder = self.view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return  (UINavigationController *)responder;
}

- (void)presentTransparentViewController:(UIViewController *)vc{
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)presentedTransparentViewController:(UIViewController *)vc{
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [vc presentViewController:self animated:NO completion:nil];
}
- (void)presentedFromViewController:(UIViewController *)vc{
    [vc presentViewController:self animated:YES completion:nil];
}

- (void)showInRootViewController{
    UIViewController *vc = [UIApplication currentTopViewController];
    [self presentedFromViewController:vc];
}

- (void)showAndDissmissAfterTime:(NSTimeInterval)time{
    if (time > 0) {
        UIViewController *vc = [UIApplication currentTopViewController];
        [vc presentViewController:self animated:YES completion:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:nil];
            });
        }];
    }
}

- (UIViewController * _Nonnull (^)(UIViewController * _Nonnull))showFromViewController{
    return  ^ (UIViewController *vc){
        [vc presentViewController:self animated:YES completion:nil];
        return self;
    };
}



@end
