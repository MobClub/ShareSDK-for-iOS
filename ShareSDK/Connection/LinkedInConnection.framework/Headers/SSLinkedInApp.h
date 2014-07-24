///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "ISSLinkedInApp.h"
#import "SSLinkedInUserManager.h"
#import "SSLinkedInAuthSession.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	LinkedIn应用对象
 */
///#end
///#begin en
/**
 *	@brief	LinkedIn App.
 */
///#end
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

///#begin zh-cn
/**
 *	@brief	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Api key.
 */
///#end
@property (nonatomic,readonly) NSString *apiKey;

///#begin zh-cn
/**
 *	@brief	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Secret key.
 */
///#end
@property (nonatomic,readonly) NSString *secretKey;

///#begin zh-cn
/**
 *	@brief	回调地址
 */
///#end
///#begin en
/**
 *	@brief	Redirect uri.
 */
///#end
@property (nonatomic,readonly) NSString *redirectUri;

///#begin zh-cn
/**
 *	@brief	登录帐号
 */
///#end
///#begin en
/**
 *	@brief	Acouunt object.
 */
///#end
@property (nonatomic,retain) id<ISSCAccount> account;

///#begin zh-cn
/**
 *	@brief	所属平台
 */
///#end
///#begin en
/**
 *	@brief	The platform object.
 */
///#end
@property (nonatomic,readonly) id<ISSPlatform> platform;

///#begin zh-cn
/**
 *	@brief	转换URL标识
 */
///#end
///#begin en
/**
 *	@brief	Convert URL enabled.
 */
///#end
@property (nonatomic) BOOL convertUrlEnabled;

///#begin zh-cn
/**
 *	@brief	默认注册用户
 */
///#end
///#begin en
/**
 *	@brief	Current user.
 */
///#end
@property (nonatomic,retain) id<ISSPlatformUser> currentUser;

///#begin zh-cn
/**
 *	@brief	初始化应用
 *
 *  @param  platform    平台
 *  @param  account 帐号
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用对象
 */
///#end
///#begin en
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
///#end
- (id)initWithPlatform:(id<ISSPlatform>)platform
               account:(id<ISSCAccount>)account
                apiKey:(NSString *)apiKey
             secretKey:(NSString *)secretKey
           redirectUri:(NSString *)redirectUri;

@end
