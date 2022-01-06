//
//  SCSDKLensLaunchDataBuilder.h
//  SCSDKCreativeKit
//
//  Created by Madison Westergaard on 2/11/20.
//Copyright © 2020 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCSDKLensLaunchData;

NS_ASSUME_NONNULL_BEGIN

@interface SCSDKLensLaunchDataBuilder : NSObject

/**
 * @property lensLaunchData
 * @brief Lens launch data attributes to be used in lens view
 */
@property (nonatomic, copy, readonly) NSString *lensLaunchData;

- (instancetype)init;

/**
 * adds a key value pair for lens launch data
 * @param key String key for lens launch data
 * @param value String, int, float, or array of any of those types value for lens launch data
 */
- (void)addNSStringKeyPair:(NSString *)key
                     value:(NSString *)value;

/**
 * adds a key value pair for lens launch data
 * @param key String key for lens launch data
 * @param value String, int, float, or array of any of those types value for lens launch data
 */
- (void)addNSNumberKeyPair:(NSString *)key
                     value:(NSNumber *)value;

/**
 * adds a key value pair for lens launch data
 * @param key String key for lens launch data
 * @param value String, int, float, or array of any of those types value for lens launch data
 */
- (void)addNSStringArrayKeyPair:(NSString *)key
                          value:(NSArray<NSString *> *)value;

/**
 * adds a key value pair for lens launch data
 * @param key String key for lens launch data
 * @param value String, int, float, or array of any of those types value for lens launch data
 */
- (void)addNSNumberArrayKeyPair:(NSString *)key
                          value:(NSArray<NSNumber *> *)value;

/**
 * Build the SCSDKLensLaunchData object and converts the NSMutable Dictionary to a JSON string
 * for the lens
 */
- (void)build;

@end

NS_ASSUME_NONNULL_END
