//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSInstapaperCredential.h"

/**
 *	@brief	用户信息
 */
@interface SSInstapaperUser : NSObject <NSCoding>
{
@private
    NSMutableDictionary *_sourceData;
    SSInstapaperCredential *_credential;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief  授权凭证
 */
@property (nonatomic,retain) SSInstapaperCredential *credential;


/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) long long userId;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *userName;

/**
 *	@brief	是否为订阅用户
 */
@property (nonatomic,readonly) BOOL subscriptionIsActive;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复信息
 *
 *	@return	用户信息
 */
+ (SSInstapaperUser *)userWithResponse:(NSDictionary *)response;

@end
