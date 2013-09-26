//
//  SSLinkedInApp.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSLinkedInApp.h"
#import "SSLinkedInUserManager.h"
#import "SSLinkedInAuthSession.h"

/**
 *	@brief	LinkedIn应用对象
 */
@interface SSLinkedInApp : NSObject <ISSLinkedInApp, SSLinkedInAuthSessionDelegate>
{
@private
    NSString *_apiKey;
    NSString *_secretKey;
    NSString *_redirectUri;
    id<ISSCAccount> _account;
    
    SSLinkedInUserManager *_userManager;
    NSMutableArray *_authSessions;

    BOOL _convertUrlEnabled;
}

/**
 *	@brief	应用Key
 */
@property (nonatomic,readonly) NSString *apiKey;

/**
 *	@brief	应用密钥
 */
@property (nonatomic,readonly) NSString *secretKey;

/**
 *	@brief	回调地址
 */
@property (nonatomic,readonly) NSString *redirectUri;

/**
 *	@brief	登录帐号
 */
@property (nonatomic,retain) id<ISSCAccount> account;

/**
 *	@brief	转换URL标识
 */
@property (nonatomic) BOOL convertUrlEnabled;

/**
 *	@brief	默认注册用户
 */
@property (nonatomic,retain) SSLinkedInUser *defaultUser;


/**
 *	@brief	初始化应用
 *
 *  @param  account 帐号
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用对象
 */
- (id)initWithAccount:(id<ISSCAccount>)account
               apiKey:(NSString *)apiKey
            secretKey:(NSString *)secretKey
          redirectUri:(NSString *)redirectUri;

@end
