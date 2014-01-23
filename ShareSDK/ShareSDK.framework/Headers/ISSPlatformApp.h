//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSContent.h"

@protocol ISSPlatform;
@protocol ISSPlatformUser;
@protocol ISSPlatformCredential;
@protocol ISSPlatformShareInfo;
@protocol ISSPlatformShareContentEntity;
@protocol ISSPlatformAuthSession;

/**
 *	@brief	Get user info result event.
 */
typedef void(^SSGetUserInfoResultEvent) (SSResponseState state, id<ISSPlatformUser> user, CMErrorInfo *error);

/**
 *	@brief	Add friend result event.
 */
typedef void(^SSAddFriendResultEvent) (SSResponseState state, id<ISSPlatformUser> user, CMErrorInfo *error);

/**
 *	@brief	Get friends list result event
 */
typedef void(^SSFriendsResultEvent) (SSResponseState state, NSArray *users, long long curr, long long prev, long long next, BOOL hasNext, NSDictionary *extInfo, id<ICMErrorInfo> error);

/**
 *	@brief	Share result event
 */
typedef void(^SSShareResultEvent) (SSResponseState state, id<ISSPlatformShareInfo> status, CMErrorInfo *error);

/**
 *	@brief	App protocol
 */
@protocol ISSPlatformApp <NSObject>

@required

/**
 *	@brief	Get ShareSDK registered app information
 *
 *	@return	App information
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	Get an app platform
 *
 *	@return	Platform object.
 */
- (id<ISSPlatform>)platform;

/**
 *	@brief	Get app key
 *
 *	@return	App key.
 */
- (NSString *)key;

/**
 *	@brief	Get an app platform type
 *
 *	@return	Platform type
 */
- (ShareType)type;

/**
 *	@brief	Get whether to support a key sharing identity. If YES indicates the content editing interface can be opened and share it with other platforms.
 *
 *	@return	YES indicate support，NO indicate not support
 */
- (BOOL)isSupportOneKeyShare;

/**
 *	@brief	The need for obtaining authorization to share.If YES then you need to detect whether sharing user has authorized.Not yet authorized the need for authorization. For client platforms to share this property generally returns NO
 *
 *  @param  clientShare Sharing client identity，YES indicates priority for the client to share.
 *
 *	@return	YES indicates need, NO indicates that no
 */
- (BOOL)isSharingNeedAuthWithClientShare:(BOOL)clientShare;

/**
 *	@brief	Get current user
 *
 *	@return	User info
 */
- (id<ISSPlatformUser>)currentUser;

/**
 *	@brief	Set current user
 *
 *	@param 	currentUser 	User info
 */
- (void)setCurrentUser:(id<ISSPlatformUser>)currentUser;

/**
 *	@brief	Get whether to convert the link enabled
 *
 *	@return	YES indicates need convert link before sharing, NO indicates no conversion link
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	Get SSO authorized enabled.
 *
 *	@return	YES indicates allowing SSO priority for authorization, NO indicates disable use SSO authorization
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	Set SSO authorized enabled
 *
 *	@param 	enabled 	YES indicates allowing SSO priority for authorization, NO indicates disable use SSO authorization
 */
- (void)setSsoEnabled:(BOOL)enabled;

/**
 *	@brief	Create an authorized credential object
 *
 *	@param 	uid 	User id
 *	@param 	token 	In OAuth, is oauth_token. In OAuth2, is access_token.
 *	@param 	secret 	Token secret，Only for OAuth authorization is oauth_token_secret.
 *	@param 	expired 	Expiration time, only for OAuth2 authorization, you need to return to a time in seconds.
 *	@param 	extInfo 	Extended information. Used to store other information in addition to the above information away.
 *
 *	@return	Credential object.
 */
- (id<ISSPlatformCredential>)credentialWithUid:(NSString *)uid
                                         token:(NSString *)token
                                        secret:(NSString *)secret
                                       expired:(NSDate *)expired
                                       extInfo:(NSDictionary *)extInfo;

/**
 *	@brief	To create a user through authorized credential
 *
 *	@param 	credential 	Credential
 *
 *	@return	User object.
 */
- (id<ISSPlatformUser>)userWithCredential:(id<ISSPlatformCredential>)credential;

/**
 *	@brief	To create a user through the user's raw data
 *
 *	@param 	data 	Raw data. Platform users the same structure definition
 *
 *	@return	User object.
 */
- (id<ISSPlatformUser>)userWithData:(NSDictionary *)data;

/**
 *	@brief	To create a share info through the raw data
 *
 *	@param 	data 	Raw data. Platform share info the same structure definition
 *
 *	@return	Share info.
 */
- (id<ISSPlatformShareInfo>)shareInfoWithData:(NSDictionary *)data;

/**
 *	@brief	To authorize.
 *
 *	@return	Authorized session，Returns nil indicates that the platform does not support the authorization
 */
- (id<ISSPlatformAuthSession>)authorize;

/**
 *	@brief	Register user.
 *
 *	@param 	user 	User object.
 *
 *	@return	YES indicates the registration is successful, NO indicates registration failure
 */
- (BOOL)registerUser:(id<ISSPlatformUser>)user;

/**
 *	@brief	Unregister user.
 *
 *	@param 	user 	User object.
 *
 *	@return	YES indicates the unregistration is successful, NO indicates unregistration failure
 */
- (BOOL)unregisterUser:(id<ISSPlatformUser>)user;

/**
 *	@brief	Get a list of registered users.
 *
 *	@return	Users list array，whose elements are the object id<ISSPlatformUser>
 */
- (NSArray *)registeredUsers;

/**
 *	@brief	Get a registered user.
 *
 *	@param 	uid 	User id.
 *
 *	@return	User object.
 */
- (id<ISSPlatformUser>)registeredUserForUid:(NSString *)uid;

/**
 *	@brief	Detecting whether the user needs to re-authorize.
 *
 *	@param 	error 	Error info.
 *
 *	@return	YES indicates need for re-authorization, NO indicates that no re-authorization
 */
- (BOOL)checkNeedReAuth:(id<ICMErrorInfo>)error;

/**
 *	@brief	Determine whether the user-level error, this error can be displayed to the users
 *
 *	@param 	error 	Error info.
 *
 *	@return	YES indicates a user-level error, NO if not.
 */
- (BOOL)isUserError:(id<ICMErrorInfo>)error;

/**
 *	@brief	Get authorized user object.
 *
 *  @param  resultHandler   Result handler
 */
- (void)getAuthUserInfo:(SSGetUserInfoResultEvent)resultHandler;

/**
 *	@brief	Get user info.
 *
 *	@param 	uid 	User ID. Based on user identity to find user information. Parameters highest priority
 *	@param 	name 	User name. Based on the user name to find the user information. Parameters priority second only to the user identity
 *	@param 	url 	User home path. Based on the user home path to find the user information. Parameters lowest priority
 *  @param  resultHandler   Result handler
 */
- (void)getUserInfoWithUid:(NSString *)uid
                    orName:(NSString *)name
                     orUrl:(NSString *)url
             resultHandler:(SSGetUserInfoResultEvent)resultHandler;

/**
 *	@brief	Add Friend / concerns Users
 *
 *	@param 	uid 	User Id.
 *	@param 	name 	User name.
 *  @param  url     User path (only for WeChat concerned)
 *  @param  resultHandler   Result handler
 */
- (void)addFriendWithUid:(NSString *)uid
                  orName:(NSString *)name
                   orUrl:(NSString *)url
           resultHandler:(SSAddFriendResultEvent)resultHandler;

/**
 *	@brief	Get friends list
 *
 *	@param 	cursor 	Cursor
 *	@param 	count 	Friends quantity
 *	@param 	resultHandler 	Result handler
 */
- (void)friendsWithCursor:(long long)cursor
                  count:(NSInteger)count
          resultHandler:(SSFriendsResultEvent)resultHandler;

/**
 *	@brief	Share content
 *
 *	@param 	contentEntity 	Share content entity
 *  @param  clientShare     Sharing client flag, YES indicates share content by client. Otherwise, the sharing in app.
 *	@param 	resultHandler 	Result handler
 */
- (void)shareContent:(id<ISSPlatformShareContentEntity>)contentEntity
         clientShare:(BOOL)clientShare
       resultHandler:(SSShareResultEvent)resultHandler;

/**
 *	@brief	Through a dictionary type to construct a share content entity.
 *
 *	@param 	dictonary 	Dicationary data.
 *
 *	@return	Share content entity.
 */
- (id<ISSPlatformShareContentEntity>)shareContentEntityWithDictonary:(NSDictionary *)dictonary;

/**
 *	@brief	Convert share content to share entity。In this method, Attributes of the entity needs to be converted.
 *
 *	@param 	content 	Share content object
 *
 *	@return	Share content entity object
 */
- (id<ISSPlatformShareContentEntity>)convertShareContentEntityByContent:(id<ISSContent>)content;

/**
 *	@brief	Handle open url.
 *
 *	@param 	url 	url object
 *	@param 	sourceApplication 	source application
 *	@param 	annotation 	annotation
 *
 *	@return	YES indicates to accept the request, NO indicates did not accept the request
 */
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

@end
