//
//  MOBShareVideoAlertView.h
//  ShareSDKDemo
//
//  Created by yoozoo on 2020/9/7.
//  Copyright © 2020 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/SSDKShareVideoModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface MOBShareVideoAlertView : UIView
- (void)showWithModel:(SSDKShareVideoModel *)model modelView:(UIView *)modelView;
@end

NS_ASSUME_NONNULL_END
