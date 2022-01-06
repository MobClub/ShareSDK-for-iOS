//
//  MOBPlatformDataSource.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/16.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBShareExample.h"
NS_ASSUME_NONNULL_BEGIN

@interface MOBPlatformDataSource : NSObject

+ (MOBPlatformDataSource *)dataSource;

//按平台分享数据源
@property (nonatomic, strong, readonly) NSArray *shareWithPlatformsData;

//按内容分享数据源
@property (nonatomic, strong, readonly) NSArray *shareWithContentData;

//授权数据源
@property (nonatomic, strong, readonly) NSArray *authPlatform;


@end

NS_ASSUME_NONNULL_END
