//
//  SCSDKLensSnapContent.h
//  SCSDKCreativeKit
//
//  Created by Madison Westergaard on 2/6/20.
//Copyright © 2020 Snap, Inc. All rights reserved.
//

#import "SCSDKSnapContent.h"

#import <Foundation/Foundation.h>

@class SCSDKLensLaunchData;

NS_ASSUME_NONNULL_BEGIN

@interface SCSDKLensSnapContent : NSObject<SCSDKSnapContent>

/**
 * @property lensUUID
 * @brief Lens UUID to use when sharing content to Snapchat client.
 */
@property (nonatomic, strong, readonly) NSString *lensUUID;

/**
 * @deprecated
 * @property lensID
 * @brief Lens ID to use when sharing content to Snapchat client.
 */
@property (nonatomic, strong, readonly) NSString *lensID;

/**
 * @property launchData
 * @brief Lens launch data to use as lens attributes when sharing content to Snapchat client.
 */
@property (nonatomic, strong) SCSDKLensLaunchData * _Nullable launchData;

/**
 * Initialize SCSDKLensSnapContent with a  Lens UUID
 * @param lensUUID is a String representation of a UUID for the lens to open when sharing content to Snapchat client.
 */
- (instancetype)initWithLensUUID:(NSString *)lensUUID;

/**
 * @deprecated - please use initWithLensUUID
 * Initialize SCSDKLensSnapContent with a  Lens ID
 * @param lensID is the ID for the lens to use when sharing content to Snapchat client.
 */
- (instancetype)initWithLensID:(NSString *)lensID;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
