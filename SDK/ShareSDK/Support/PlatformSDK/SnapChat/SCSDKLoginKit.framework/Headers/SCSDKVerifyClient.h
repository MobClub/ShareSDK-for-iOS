//
//  SCSDKVerifyClient.h
//  SCSDKLoginKit
//
//  Copyright © 2017 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
* Callback to trigger when verify only flow completes.
*
* @param phoneId The phone id generated for the phone number, used to check if the number was successfully verified
* @param verifyId The verify id generated for the verify request, used with the phoneId to check if the number was successfully verified
* @param error If there was a problem with the verify request, this will be populated with the error code
*/
typedef void (^SCSDKVerifyCompletionBlock)(NSString * _Nullable phoneId, NSString * _Nullable verifyId, NSError * _Nullable error);

/**
* Callback to trigger when verify and login flow completes.
*
* @param success Boolean signifying if the login request completed successfully
* @param phoneId The phone id generated for the phone number, used to check if the number was successfully verified
* @param verifyId The verify id generated for the verify request, used with the phoneId to check if the number was successfully verified
* @param error If there was a problem with the verify request, this will be populated with the error code
*/
typedef void (^SCSDKVerifyAndLoginCompletionBlock)(BOOL success, NSString * _Nullable phoneId, NSString * _Nullable verifyId, NSError * _Nullable error);


@interface SCSDKVerifyClient : NSObject

/**
* Finish verify with Snapchat.
*
* @param application for singleton app object of calling app
* @param url created by Snapchat.
* @param options for the url to handle
* @return YES if Snapchat can open the the url, NO if it cannot
*/
+ (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

/**
 Start Verify and Login with Snapchat
*/
+ (void)verifyFromViewController:(nullable UIViewController *)viewController
                           phone:(NSString *)phone
                          region:(NSString *)region
                      completion:(SCSDKVerifyCompletionBlock)completion;


/**
  Start Verify and Login with Snapchat
 */
+ (void)verifyAndLoginFromViewController:(nullable UIViewController *)viewController
                           phone:(NSString *)phone
                          region:(NSString *)region
                      completion:(SCSDKVerifyAndLoginCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
