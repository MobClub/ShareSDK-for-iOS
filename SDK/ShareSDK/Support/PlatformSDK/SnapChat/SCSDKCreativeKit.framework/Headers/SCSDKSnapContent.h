//
//  SCSDKSnapContent.h
//  SCSDKCreativeKit
//
//  Copyright © 2017 Snap, Inc. All rights reserved.
//

#import "SCSDKCreativeKitModelValidating.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SCSDKSnapSticker;
@class SCSDKContentTopics;
@protocol SCSDKCreativeKitModelValidating;

@protocol SCSDKSnapContent <SCSDKCreativeKitModelValidating>

/**
 * @property caption
 * @brief Caption text to be placed on a Snap content
 */
@property (nonatomic, copy) NSString * _Nullable caption;

/**
 * @property attachmentUrl
 * @brief Web attachment URL for a Snap swipe up view
 */
@property (nonatomic, copy) NSString * _Nullable attachmentUrl;

/**
 * @property stickers
 * @brief Array of SCSDKSnapSticker
 */
@property (nonatomic, strong) SCSDKSnapSticker * _Nullable sticker;

/**
 * @property topics
 * @brief Array of Spotlight Topics to be auto filled for eligible content in Send-To.
 */
@property (nonatomic, strong) SCSDKContentTopics * _Nullable topics;

/**
 * @property isPostToSpotlightPermitted
 * @brief If false the content will not be postable to Spotlight. (Default value is true).
 */
@property (nonatomic, assign) BOOL isPostToSpotlightPermitted;

@end
