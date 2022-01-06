//
//  SCSDKLensLaunchData.h
//  SCSDKCreativeKit
//
//  Created by Madison Westergaard on 2/10/20.
//Copyright © 2020 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SCSDKLensLaunchDataBuilder;

NS_ASSUME_NONNULL_BEGIN

@interface SCSDKLensLaunchData : NSObject

/**
 * @property lensLaunchData
 * @brief Lens launch data attributes to be used in lens view
 */
@property (nonatomic, copy, readonly) NSString *lensLaunchData;

- (instancetype)initWithBuilder:(SCSDKLensLaunchDataBuilder *)lensBuilder;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
