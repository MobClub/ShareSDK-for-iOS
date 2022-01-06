//
//  MOBPolicyViewController.h
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/14.
//  Copyright © 2020 mob. All rights reserved.
//

#import "SSDKCommonViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOBPolicyViewController : SSDKCommonViewController

@property (nonatomic, copy) void (^ policyStaus) (BOOL status);

@end

NS_ASSUME_NONNULL_END
