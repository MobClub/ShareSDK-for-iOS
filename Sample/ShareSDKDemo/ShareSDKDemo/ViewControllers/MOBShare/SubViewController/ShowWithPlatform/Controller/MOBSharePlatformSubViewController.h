//
//  MOBSharePlatformSubViewController.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKCommonViewController.h"
#import "MOBPlatformBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBSharePlatformSubViewController : MOBNavigationViewController

@property (nonatomic, strong) NSArray <MOBSharePlatformShareItemModel *>*dataSource;

@end

NS_ASSUME_NONNULL_END
