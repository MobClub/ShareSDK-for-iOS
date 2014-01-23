//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSViewDelegate.h"

/**
 *	@brief	Authorize options
 */
@protocol ISSAuthOptions <NSObject,
                          NSCopying>

/**
 *	@brief	Get view style
 *
 *  @return View style
 */
- (SSAuthViewStyle)viewStyle;

/**
 *	@brief	Set view style
 *
 *	@param 	viewStyle 	View style
 */
- (void)setViewStyle:(SSAuthViewStyle)viewStyle;

/**
 *	@brief	Get automatic authorization flag,When authorized expired, Whether SDK has automatic show authorized view let user to completed authorized.
 *
 *  @return Automatic authorization flag. YES indicate enabled. NO indicate disabled.
 */
- (BOOL)autoAuth;

/**
 *	@brief	Set automatic authorization flag,When authorized expired, Whether SDK has automatic show authorized view let user to completed authorized.
 *
 *  @param  autoAuth    Automatic authorization flag. YES indicate enabled. NO indicate disabled.
 */
- (void)setAutoAuth:(BOOL)autoAuth;

/**
 *	@brief	Whether to allow authorized after the callback to the server, the default is YES, for there is no server or application server does not require a callback can be set to NO
 *
 *  @return YES indicate enabled callback. NO indicate disabled callback.
 */
- (BOOL)allowCallback;

/**
 *	@brief	Whether to allow authorized after the callback to the server.
 *
 *	@param 	allowCallback 	YES indicate enabled callback. NO indicate disabled callback.
 */
- (void)setAllowCallback:(BOOL)allowCallback;

/**
 *	@brief	Get authorized view delegate.
 *
 *  @return delegate object.
 */
- (id<ISSViewDelegate>)viewDelegate;

/**
 *	@brief	Set authorized view delegate.
 *
 *	@param 	viewDelegate 	delegate object.
 */
- (void)setViewDelegate:(id<ISSViewDelegate>)viewDelegate;

/**
 *	@brief	Get authroized manager view delegate.
 *
 *  @return delegate object.
 */
- (id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	Set authroized manager view delegate.
 *
 *	@param 	authManagerViewDelegate 	delegate object.
 */
- (void)setAuthManagerViewDelegate:(id<ISSViewDelegate>)authManagerViewDelegate;

/**
 *	@brief	Get authorized scopes.
 *
 *	@return	scopes dictionary. key is platform type number. value is contain scope string's array.
 */
- (NSDictionary *)scopes;

/**
 *	@brief	Set authorized scopes.
 *
 *	@param 	scopes 	scopes dictionary. key is platform type number. value is contain scope string's array.
 */
- (void)setScopes:(NSDictionary *)scopes;

/**
 *	@brief	Get powered by hidden flag.
 *
 *	@return	YES indicate hidden， NO indicate show.
 */
- (BOOL)powerByHidden;

/**
 *	@brief	Set powered by hidden flag.
 *
 *	@param 	powerByHidden 	YES indicate hidden， NO indicate show.
 */
- (void)setPowerByHidden:(BOOL)powerByHidden;

/**
 *	@brief	Get follower accounts.
 *
 *	@return	follower accounts dicationary. key is platform type number. value is ISSUserField's protocol object.
 */
- (NSDictionary *)followAccounts;

/**
 *	@brief	Set follower accounts.
 *
 *	@param 	followAccounts 	follower accounts dicationary. key is platform type number. value is ISSUserField's protocol object.
 */
- (void)setFollowAccounts:(NSDictionary *)followAccounts;

/**
 *	@brief	Clone current authorized options object and return the new object.
 *
 *	@return	The new authorized options object.
 */
- (id<ISSAuthOptions>)clone;


@end
