//
//  TikTokOpenPlatformShareRequest.h
//  AFgzipRequestSerializer
//
//  Created by TikTok on 2019/7/8.
//  Copyright (c) 2018年 TikTok. All rights reserved.

#import "TikTokOpenPlatformObjects.h"
#import "TiktokOpenPlatformApplicationDelegate.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TiktokOpenPlatformShareMediaType) {
    TiktokOpenPlatformShareMediaTypeImage = 0, //!< Map to PHAssetMediaTypeImage
    TiktokOpenPlatformShareMediaTypeVideo, //!< Map to PHAssetMediaTypeVideo
};
@class TikTokOpenPlatformShareResponse;

typedef void(^TikTokShareCompleteBlock)(TikTokOpenPlatformShareResponse *Response);

@interface TikTokOpenPlatformShareRequest : TikTokOpenPlatformBaseRequest

- (instancetype)init  __attribute__((unavailable("use -initWithAppType: for initialization")));

/**
 * @brief Designated Initization
 *
 * @param appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
 */
- (instancetype)initWithAppType:(TikTokOpenPlatformAppType)appType NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) TikTokOpenPlatformAppType appType;//!< Request app Type
/**
 The local identifier of the video or image shared by the your application to TikTok in the **Photo Album**. The content must be all images or video.

 - The aspect ratio of the images or videos should between: [1/2.2, 2.2]
 - If mediaType is Image:
    - The number of images should be more than one and up to 12.
 - If mediaType is Video:
    - Total video duration should be longer than 3 seconds.
    - No more than 12 videos can be shared
 - Video with brand logo or watermark will lead to video deleted or account banned. Make sure your applications share contents without watermark.
 */
@property (nonatomic, strong) NSArray *localIdentifiers;

/**
 To associate your video with a hashtag, set the hashtag property on the request. The length cannot exceed 35
 */
@property (nonatomic, copy) NSString *hashtag;

/**
 The Media type of localIdentifiers in Album, All attachment localIdentifiers must be the same type
 */
@property (nonatomic, assign) TiktokOpenPlatformShareMediaType mediaType;

/**
 Used to identify the uniqueness of the request, and finally returned by TiktokApp when jumping back to the third-party program
 */
@property (nonatomic, copy, nullable) NSString *state;

/**
 Passing additional sharing requests param;
 */
@property (nonatomic, copy, nullable) NSDictionary *extraInfo;

/**
 * @brief Send share request to TikTok.
 *
 * @param completed  The async result call back. You can get result in share response.isSucceed;
 *
 * @return Share request is valid will return YES;
 */
- (BOOL)sendShareRequestWithCompleteBlock:(TikTokShareCompleteBlock) completed;
@end

@interface TikTokOpenPlatformShareResponse : TikTokOpenPlatformBaseResponse
/**
 Used to identify the uniqueness of the request, and finally returned by TiktokApp when jumping back to the third-party program
 */
@property (nonatomic, copy, nullable) NSString *state;

@property (nonatomic, strong, nullable) NSString *shareState;
@end

NS_ASSUME_NONNULL_END
