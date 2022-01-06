//
//  MOBPolicyManager.h
//  ShareSDKDemo
//
//  Created by maxl on 2020/1/14.
//  Copyright © 2020 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOBPolicyManager : NSObject

+ (MOBPolicyManager *)defaultManager;

@property (nonatomic, assign, readonly) BOOL isAllowPolicy;

- (void)show;

- (void)clearCache;

@end

NS_ASSUME_NONNULL_END
