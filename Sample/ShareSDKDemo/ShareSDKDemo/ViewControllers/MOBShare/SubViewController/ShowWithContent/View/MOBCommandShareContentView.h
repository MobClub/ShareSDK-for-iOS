//
//  MOBCommandShareContentView.h
//  ShareSDKDemo
//
//  Created by cl on 2020/7/31.
//  Copyright © 2020 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MOBShareCommandAlertView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBCommandShareContentView : UIView

+ (MOBCommandShareContentView *)sharedView;

- (void)showWithAlertView:(MOBShareCommandAlertView *)alert;

@end

NS_ASSUME_NONNULL_END
