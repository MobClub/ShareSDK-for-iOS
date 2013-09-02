//
//  SSLinkedInCredential.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	授权凭证
 */
@interface SSLinkedInCredential : SSCDataObject

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	Access Token
 */
@property (nonatomic,readonly) NSString *accessToken;

/**
 *	@brief	过期时间
 */
@property (nonatomic,readonly) NSDate *expiresIn;

/**
 *	@brief	判断授权数据是否有效
 */
@property (nonatomic,readonly) BOOL available;

/**
 *	@brief	初始化授权凭证
 *
 *	@param 	sourceData 	源授权数据
 *
 *	@return	授权信息
 */
- (id)initWithData:(NSDictionary *)sourceData;

/**
 *	@brief	初始化授权凭证
 *
 *	@param 	credentialData 	授权凭证数据
 *
 *	@return	授权凭证
 */
- (id)initWithCredentialData:(NSDictionary *)credentialData;

@end
