//
//  MOBCustomeShareCell.h
//  ShareSDKDemo
//
//  Created by cl on 2021/5/24.
//  Copyright © 2021 mob. All rights reserved.
//

#import "SSDKBaseTableViewCell.h"
#import "MOBCustomShareModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBCustomeShareCell : SSDKBaseTableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) MOBCustomShareModel *model;

@end

NS_ASSUME_NONNULL_END
