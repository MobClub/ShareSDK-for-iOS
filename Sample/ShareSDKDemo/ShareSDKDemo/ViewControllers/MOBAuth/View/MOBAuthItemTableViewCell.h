//
//  MOBAuthItemTableViewCell.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseTableViewCell.h"
#import "MOBAuthItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBAuthItemTableViewCell : SSDKBaseTableViewCell

@property (nonatomic, strong) MOBAuthItemModel *model;

@property (nonatomic, strong, readonly) UIView *line;

@end

NS_ASSUME_NONNULL_END
