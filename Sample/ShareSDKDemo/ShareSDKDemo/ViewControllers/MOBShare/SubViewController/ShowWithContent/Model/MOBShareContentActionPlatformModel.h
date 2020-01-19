//
//  MOBShareContentActionTypeModel.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/13.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBPlatformBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBShareContentActionPlatformModel : NSObject

+ (MOBShareContentActionPlatformModel *)modelType:(NSInteger)type;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy, readonly) NSString * platformName;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSArray <MOBSharePlatformShareItemModel *>*dataSource;

- (void)addPlatformItem:(MOBSharePlatformShareItemModel *)model;

@end

NS_ASSUME_NONNULL_END
