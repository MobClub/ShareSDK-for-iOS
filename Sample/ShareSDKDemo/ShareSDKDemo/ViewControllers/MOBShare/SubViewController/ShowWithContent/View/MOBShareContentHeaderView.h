//
//  MOBShareContentHeaderView.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseView.h"
#import "MOBShareContentActionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBShareContentHeaderView : SSDKBaseView

@property (nonatomic, strong) NSArray <MOBShareContentActionModel *>*dataSource;

@property (nonatomic, copy) void (^ currentSelectedHandler) (MOBShareContentActionModel * model);

@end

NS_ASSUME_NONNULL_END
