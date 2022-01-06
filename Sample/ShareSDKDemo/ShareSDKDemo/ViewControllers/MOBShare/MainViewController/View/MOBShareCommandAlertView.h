//
//  MOBShareCommandAlertView.h
//  ShareSDKDemo
//
//  Created by cl on 2020/7/28.
//  Copyright © 2020 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOBShareCommandAlertView : UIView

- (void)showWithCommand:(NSString *)command modelView:(UIView *)modelView;

@end

NS_ASSUME_NONNULL_END
