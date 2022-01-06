//
//  SCSDKContentTopics.h
//  SCSDKCreativeKit
//
//  Created by Melissa O'Sullivan on 3/10/21.
//  Copyright © 2021 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCSDKContentTopics : NSObject

/**
 * @property topics
 * @brief Array of Spotlight Topics to be auto filled for eligible content in Send-To.
 */
@property (nonatomic, copy, readonly) NSArray<NSString *> * topics;

- (instancetype)initWithTopics:(NSArray<NSString *> *)topics;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
