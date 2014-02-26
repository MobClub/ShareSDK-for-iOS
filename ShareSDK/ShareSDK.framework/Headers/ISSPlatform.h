//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ShareSDKTypeDef.h"

@protocol ISSPlatformApp;

/**
 *	@brief	Platform protocol
 */
@protocol ISSPlatform <NSObject>

@required

/**
 *	@brief	Initialize platform
 *
 *	@param 	type 	Platform type
 *
 *	@return	Platform object
 */
- (id)initWithType:(ShareType)type;

/**
 *	@brief	Get platform name
 *
 *	@return	Name
 */
- (NSString *)name;

/**
 *	@brief	Get platform type
 *
 *	@return	Platform type
 */
- (ShareType)type;

/**
 *	@brief	Get current app.
 *
 *	@return	Current app object.
 */
- (id<ISSPlatformApp>)currentApp;

/**
 *	@brief	Set current app.
 *
 *	@param 	app 	app object.
 */
- (void)setCurrentApp:(id<ISSPlatformApp>)app;

/**
 *	@brief	Register app.
 *
 *	@param 	account     ShareSDK registered app information object.
 *	@param 	appInfo 	App information, you need to be registered in each platform app to get
 *
 *	@return	App object
 */
- (id<ISSPlatformApp>)registerAppWithAccount:(id<ISSCAccount>)account
                                     appInfo:(NSDictionary *)appInfo;

/**
 *	@brief	Unregister app
 *
 *	@param 	app 	App object
 *
 */
- (void)unregisterApp:(id<ISSPlatformApp>)app;

/**
 *	@brief	Determine whether the application has been registered
 *
 *	@param 	appInfo 	Application information
 *
 *	@return	YES said it had registered, NO indicates not registered
 */
- (BOOL)hasRegisteredWithAppInfo:(NSDictionary *)appInfo;

/**
 *	@brief	Get registered application
 *
 *	@param 	key 	App key.
 *
 *	@return	App object, returns nil indicates the app has not been registered
 */
- (id<ISSPlatformApp>)appForKey:(NSString *)key;

/**
 *	@brief	Get a list of registered applications
 *
 *	@return	App list array, whose elements are the object id<ISSPlatformApp>
 */
- (NSArray *)registeredApps;


@end
