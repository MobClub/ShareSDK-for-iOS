//
//  UIViewController+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/21.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIViewController+SSDKCategory.h"

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

@end
