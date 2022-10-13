//
//  MOBAuthItemModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/15.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBPlatformBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MOBAuthStatus) {
    MOBAuthStatusUnAuthor,
    MOBAuthStatusAuthoring,
    MOBAuthStatusAuthored,
    MOBAuthStatusUserInfoing,
};

@interface MOBAuthItemModel : NSObject

@property (nonatomic, strong) MOBPlatformBaseModel *model;

@property (nonatomic, strong, readonly) MOBShareItemUI * itemUI;


@property (nonatomic, copy) void (^ handler) (MOBAuthStatus authorStatus);

- (void)author;

- (void)changeView;
- (void)revokeUser;

@end

NS_ASSUME_NONNULL_END
