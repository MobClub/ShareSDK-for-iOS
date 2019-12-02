//
//  TikTokOpenPlatformAuth.h
//
//  Created by TikTok on 2019/7/8.
//  Copyright (c) 2018年 TikTok. All rights reserved.
//

#import "TikTokOpenPlatformObjects.h"
#import "TiktokOpenPlatformApplicationDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@class TikTokOpenPlatformAuthResponse;

typedef void(^TikTokAuthCompleteBlock)(TikTokOpenPlatformAuthResponse *resp);//!< Auth Result callback block

#pragma mark - Auth Request
@interface TikTokOpenPlatformAuthRequest : TikTokOpenPlatformBaseRequest

- (instancetype)init  __attribute__((unavailable("use -initWithAppType: for initialization")));

/**
 * @brief Designated Initization
 *
 * @param appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
 */
- (instancetype)initWithAppType:(TikTokOpenPlatformAppType)appType NS_DESIGNATED_INITIALIZER;

@property (nonatomic, assign, readonly) TikTokOpenPlatformAppType appType; //!< Request app Type

/**
The type of required permission applied by the third-party application to Tiktok is finally returned to the third-party application based on the actual authorization result after the TiktokApp authorization is completed
 e.g. [NSOrderedSet orderedSetWithObjects:@"user_info", ..., nil]
 
 */
@property (nonatomic, strong, nullable) NSOrderedSet<NSString *> *permissions;

/**
The additional permission type that the third-party application applies to Tiktok, the user can check whether to grant this part of the permission, and finally return to the third-party application according to the actual authorization result after the TiktokApp authorization is completed;
 @key permission
 @key defaultChecked Initial check state, @"1" means check, @"0" means unchecked
 e.g. [NSOrderedSet orderedSetWithObjects:@{@"permission":@"user_info",@"defaultChecked":@"0"}, ..., nil]
 */
@property (nonatomic, strong, nullable) NSOrderedSet<NSDictionary<NSString *,NSString *> *> *additionalPermissions;

/**
 Used to identify the uniqueness of the request, and finally returned by TiktokApp when jumping back to the third-party program
 */
@property (nonatomic, copy, nullable) NSString *state;

/**
 * @brief Send authorization request to Tiktok. If not install TikTok App will open authorized web page.

 *
 * @param viewController The view controller which show authorized web page
 * @param completed      The async result call back. You can get reslut via resp.isSucceed.
 *
 * @return Authorization request is valid will return YES;
 */
- (BOOL)sendAuthRequestViewController:(UIViewController *)viewController completeBlock:(TikTokAuthCompleteBlock)completed;

@end


#pragma mark - Auth Response
@interface TikTokOpenPlatformAuthResponse : TikTokOpenPlatformBaseResponse

/**
 You apply for certain permissions to Tiktok, and finally return to the third-party application based on the actual authorization result after the TiktokApp authorization is completed.
 */
@property (nonatomic, copy, readonly, nullable) NSString *code;

/**
 State can be used to identify the uniqueness of the request, and finally returned by Tiktok when jumping back to a third-party program
 */
@property (nonatomic, copy, readonly, nullable) NSString *state;

/**
 Tiktok users agree to give your applications permission, if the authorization is successful, all necessary permissions and additional permissions checked by the user;
 */
@property (nonatomic, strong, nullable) NSOrderedSet<NSString *> *grantedPermissions;

@end


NS_ASSUME_NONNULL_END
