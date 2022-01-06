//
//  SCSDKSnapKit.h
//  SCSDKCoreKit
//
//  Created by Duncan Riefler on 10/14/20.
//  Copyright © 2020 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCSDKSnapKit : NSObject

/**
 * Initialize SnapKit SDK.
 *
 */
+ (void)initSDK;

/**
 * Deinitialize SnapKit SDK.
 *
 */
+ (void)deinitialize;

@end

NS_ASSUME_NONNULL_END
