//
//  TikTokOpenPlatformObjects.h
//  AFgzipRequestSerializer
//
//  Created by TikTok on 2019/7/8.
//  Copyright (c) 2018年 TikTok. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TikTokOpenPlatformBaseResponse;

typedef NS_ENUM(NSInteger, TiktokOpenPlatformErrorCode) {
    TiktokOpenPlatformSuccess                = 0,
    TiktokOpenPlatformErrorCodeCommon        = -1,
    TiktokOpenPlatformErrorCodeUserCanceled  = -2,
    TiktokOpenPlatformErrorCodeSendFailed    = -3,
    TiktokOpenPlatformErrorCodeAuthDenied    = -4,
    TiktokOpenPlatformErrorCodeUnsupported   = -5,
};

NS_ASSUME_NONNULL_BEGIN
typedef void(^TikTokRequestCompletedBlock) (TikTokOpenPlatformBaseResponse *resp);

@interface TikTokOpenPlatformBaseRequest : NSObject

@end

@interface TikTokOpenPlatformBaseResponse : NSObject

@property (nonatomic, readonly, assign) BOOL isSucceed;//!< YES for succeess

@property (nonatomic, assign) TiktokOpenPlatformErrorCode errCode;//!< if failed failed error code

@property (nonatomic, copy, nullable) NSString *errString;//!< if failed error description

@end

NS_ASSUME_NONNULL_END
