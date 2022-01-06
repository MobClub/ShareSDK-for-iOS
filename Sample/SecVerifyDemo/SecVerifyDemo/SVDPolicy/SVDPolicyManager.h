//
//  SVDPolicyManager.h
//  SecVerifyDemo
//
//  Created by 李树志 on 2020/2/7.
//  Copyright © 2020 yoozoo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SVDPolicyManager : NSObject

+ (SVDPolicyManager *)defaultManager;

@property (nonatomic, assign, readonly) BOOL isAllowPolicy;

- (void)show;

- (void)clearCache;


@end

NS_ASSUME_NONNULL_END
