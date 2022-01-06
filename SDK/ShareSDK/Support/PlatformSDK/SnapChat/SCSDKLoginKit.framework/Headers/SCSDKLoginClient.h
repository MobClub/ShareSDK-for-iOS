//
//  SCSDKLoginClient.h
//  SCSDKLoginKit
//
//  Copyright © 2017 Snap, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Callback to trigger when fetch resource success.
 *
 * @param resources that contain user data.
 */
typedef void(^SCOAuth2GetResourcesSuccessCompletionBlock)(NSDictionary * _Nullable resources);

/**
 * Callback to trigger when fetch resource failed.
 *
 * @param error Error responsible for user data fetchinf failure
 * @param isUserLoggedOut Set to YES if the connection between 3PA and Snapchat is broken or user is not logged in to
 *                        3PA using Snapchat. Set to NO if other errors occur while fetching data from Snapchat
 */
typedef void(^SCOAuth2GetResourcesFailureCompletionBlock)(NSError * _Nullable error, BOOL isUserLoggedOut);

/**
 * The completion handler to when getting a refreshed access token is complete. The access token returned, if present,
 * is valid.
 *
 * @param accessToken Refreshed access token
 * @param error       Error returned in case of a failure refreshing the access token.
 */
typedef void(^SCOAuth2RefreshAccessTokenCompletionBlock)(NSString *_Nullable accessToken, NSError *_Nullable error);

/**
 * The completion handler which SCFetchCodeVerifierBlock must invoke to report its result,
 * either a code verifier or an error.
 * @param codeVerifier The code verifier
 * @param error  The error returned when the code verifier could not be fetched
 */
typedef void(^SCFetchCodeVerifierCompletionBlock)(NSString *_Nullable codeVerifier, NSError *_Nullable error);

/**
 * A block which uses the state to fetch a code verifier and communicates this result via the completion block.
*
 * @param state  The oAuth2 state which is needed to fetch the code verifier
 * @param completionBlock A block to be used to communicate the result of fetching the code verifier,
 * whether it is the code verifier or an error.
 */
typedef void(^SCFetchCodeVerifierBlock)(NSString *state, SCFetchCodeVerifierCompletionBlock completionBlock);

/**
 * Protocol for observing all changes that occur for a user's login status. Notifications will always occur
 * on the main queue.
 */
@protocol SCSDKLoginStatusObserver <NSObject>

@optional
/**
 * Called whenever a user begins to authorize with their Snapchat account. This can happen when calling
 * {@link +loginFromViewController:completion:} or when tapping a login button, like {@link SCSDKLoginButton}.
 */
- (void)scsdkLoginLinkDidStart;

/**
 * Called whenever a user successfully authorizes with their Snapchat account.
 */
- (void)scsdkLoginLinkDidSucceed;

/**
 * Called whenever a user's authorization process fails.
 */
- (void)scsdkLoginLinkDidFail;

/**
 * Called whenever a user either explicitly unlinks their Snapchat account, or access to the user's account
 * is revoked.
 */
- (void)scsdkLoginDidUnlink;

@end

@class SCSnapKitFeatureOptions;

@interface SCSDKLoginClient : NSObject

@property (class, assign, readonly) BOOL isUserLoggedIn;

/**
 * Start Auth with Snapchat.
 *
 * @param viewController that shows the in-app auth page.
 */
+ (void)loginFromViewController:(nullable UIViewController *)viewController
                     completion:(nullable void (^)(BOOL success, NSError * _Nullable error))completion;

/**
* Start Auth with Snapchat with options.
*
*  @param viewController that shows the in-app auth page.
*/
+ (void)loginFromViewController:(nullable UIViewController *)viewController
                        options:(SCSnapKitFeatureOptions *)options
                     completion:(void (^)(BOOL success, NSError *error))completion;

extern NSString *const SCSDKLoginKitFirebaseErrorDomain;

typedef NS_ENUM(NSInteger, SCSDKLoginKitFirebaseErrorCode) {
   SCSDKLoginKitFirebaseErrorCodeUnknown,
   SCSDKLoginKitFirebaseErrorCodeAuthorizationFailure,
   SCSDKLoginKitFirebaseErrorCodeCustomTokenFetchFailure,
};

/**
* Callback triggered when OAuth Authorization for Firebase Authentication is complete.
*
* @param customToken that can be used to authentication with Firebase
* @param error indicating that something went wrong
*/
typedef void(^SCFirebaseAuthCompletionBlock)(NSString * _Nullable customToken, NSError * _Nullable error);

/**
* Start Snapchat OAuth 2.0 authorization for Firebase Authentication
*
* @param viewController that the in-app auth web view is presented on top of in case Snapchat is not installed or
                        deep-linking fails more than 3 consecutive times. The current top view controller is used
                        if not provided.
* @param completion callback triggered when OAuth Authorization for Firebase Authentication is complete.
*/
+ (void)startFirebaseAuthFromViewController:(nullable UIViewController *)viewController
                                 completion:(SCFirebaseAuthCompletionBlock)completion;

/**
 * Finish auth with Snapchat.
 *
 * @param application for singleton app object of calling app
 * @param url created by Snapchat.
 * @param options for the url to handle
 * @return YES if Snapchat can open the the url, NO if it cannot
 */
+ (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;

/**
* Finish auth with Snapchat.
*
* @param application for singleton app object of calling app
* @param url created by Snapchat.
* @param options for the url to handle
* @param completion a block on which the result of the auth is returned
* @return YES if Snapchat can open the the url, NO if it cannot
*/
+ (BOOL)application:(UIApplication *)application
   openURL:(NSURL *)url
   options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
completion:(void (^)(BOOL success, NSError *error))completion;

/**
 * Handle Connect From Snapchat deeplink.
 *
 * @param url created by Snapchat.
 * @param fetchCodeVerifierBlock a block which is responsible for fetching the code verifier
 * given the state, and notifying the SDK of the result via the SCFetchCodeVerifierCompletionBlock
 * @param completion a block on which the result of the auth is returned, this handler will be invoked if this function returns YES
 * @return YES if this is a Connect From Snapchat deeplink and is handled, NO otherwise
 */
+ (BOOL)handleConnectFromSnapchatURL:(NSURL *)url
              fetchCodeVerifierBlock:(SCFetchCodeVerifierBlock)fetchCodeVerifierBlock
                          completion:(nullable void (^)(BOOL success, NSError * _Nullable error))completion;

/**
 * Clears the local access token and refresh token if they exist.
 */
+ (void)clearToken;

/**
 * Interface to fetch user data from resource server.
 *
 * @param query GraphQL query to fetch user data.
 * @param success Success block when fetch data succeed.
 * @param failure Failure block when fetch data failed.
 */
+ (void)fetchUserDataWithQuery:(NSString *)query
                     variables:(nullable NSDictionary<NSString *, id> *)variables
                       success:(SCOAuth2GetResourcesSuccessCompletionBlock)success
                       failure:(SCOAuth2GetResourcesFailureCompletionBlock)failure;

/**
 * Gets the access token cached locally.
 */
+ (NSString *)getAccessToken;

/**
 * Refreshes the access token.
 *
 * @param completion The completion handler to call when tak to refresh the access token is complete.
 */
+ (void)refreshAccessTokenWithCompletion:(nullable SCOAuth2RefreshAccessTokenCompletionBlock)completion;

/**
 * Determines whether the user has authorized the current session to have access to resources
 * with the requested scope
 *
 * @param scope The scope
 * @return YES if the current session has access to resources with the scope, NO otherwise
 */
+ (BOOL)hasAccessToScope:(NSString *)scope;

/**
 * Add an observer to receive updates to the user's login status
 *
 * @param observer The object that will receive updates
 */
+ (void)addLoginStatusObserver:(id<SCSDKLoginStatusObserver>)observer NS_SWIFT_NAME(addLoginStatusObserver(_:));

/**
 * Remove an observer to stop receiving updates to the user's login status
 *
 * @param observer The object currently receiving updates
 */
+ (void)removeLoginStatusObserver:(id<SCSDKLoginStatusObserver>)observer NS_SWIFT_NAME(removeLoginStatusObserver(_:));

@end

NS_ASSUME_NONNULL_END
