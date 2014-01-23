//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSLinkedInApp.h"
#import "SSLinkedInUserManager.h"
#import "SSLinkedInAuthSession.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	LinkedIn App.
 */
@interface SSLinkedInApp : NSObject <ISSLinkedInApp,
                                     SSLinkedInAuthSessionDelegate>
{
@private
    id<ISSPlatform> _platform;
    NSString *_apiKey;
    NSString *_secretKey;
    NSString *_redirectUri;
    id<ISSCAccount> _account;
    
    SSLinkedInUserManager *_userManager;
    NSMutableArray *_authSessions;

    BOOL _convertUrlEnabled;
}

/**
 *	@brief	Api key.
 */
@property (nonatomic,readonly) NSString *apiKey;

/**
 *	@brief	Secret key.
 */
@property (nonatomic,readonly) NSString *secretKey;

/**
 *	@brief	Redirect uri.
 */
@property (nonatomic,readonly) NSString *redirectUri;

/**
 *	@brief	Acouunt object.
 */
@property (nonatomic,retain) id<ISSCAccount> account;

/**
 *	@brief	The platform object.
 */
@property (nonatomic,readonly) id<ISSPlatform> platform;

/**
 *	@brief	Convert URL enabled.
 */
@property (nonatomic) BOOL convertUrlEnabled;

/**
 *	@brief	Current user.
 */
@property (nonatomic,retain) id<ISSPlatformUser> currentUser;

/**
 *	@brief	Initialize App.
 *
 *  @param  platform    Platform object.
 *  @param  account Account object.
 *	@param 	appKey 	App key.
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect uri
 *
 *	@return	App object.
 */
- (id)initWithPlatform:(id<ISSPlatform>)platform
               account:(id<ISSCAccount>)account
                apiKey:(NSString *)apiKey
             secretKey:(NSString *)secretKey
           redirectUri:(NSString *)redirectUri;

@end
