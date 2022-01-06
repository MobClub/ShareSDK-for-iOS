//
//  SVDPolicyViewController.h
//  SecVerifyDemo
//
//  Created by 李树志 on 2020/2/7.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVDPolicyViewController : UIViewController

// 是否接受协议状态回调
@property (nonatomic, copy) void (^ policyAcceptedStatus) (BOOL acceptedStatus);

@end

NS_ASSUME_NONNULL_END
