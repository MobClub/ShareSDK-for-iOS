//
//  UIWindow+SSDKCategory.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIWindow+SSDKCategory.h"
#import "UIApplication+SSDKCategory.h"
#import <objc/message.h>
@implementation UIWindow (SSDKCategory)

- (void)showOnCurrentScene{
    [self showOnScene:[UIApplication currentScene]];
}

- (void)showOnScene:(id)scene{
    if (UIApplication.isSceneApp) {
        if (scene && [scene isKindOfClass:NSClassFromString(@"UIWindowScene")]) {
            ((void (*)(id, SEL,id))objc_msgSend)(self,sel_registerName("setWindowScene:"),scene);
        }
    }
}

@end
