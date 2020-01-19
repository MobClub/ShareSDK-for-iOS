//
//  MOBSharePlatformTableViewCell.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseTableViewCell.h"
#import "MOBPlatformBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBSharePlatformTableViewCell : SSDKBaseTableViewCell

@property (nonatomic, strong) MOBPlatformBaseModel *model;

@property (nonatomic, strong, readonly) UIView *line;


@end

NS_ASSUME_NONNULL_END
