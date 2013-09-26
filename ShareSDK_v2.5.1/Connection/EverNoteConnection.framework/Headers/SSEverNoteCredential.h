//
//  SSEverNoteCredential.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-7.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	授权凭证
 */
@interface SSEverNoteCredential : NSObject <NSCoding>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	OAuth令牌
 */
@property (nonatomic,readonly) NSString *oauthToken;

/**
 *	@brief	OAuth令牌密钥
 */
@property (nonatomic,readonly) NSString *oauthTokenSecret;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *edamShard;

/**
 *	@brief	NoteStore URL
 */
@property (nonatomic,readonly) NSString *edamNoteStoreUrl;

/**
 *	@brief	云API前缀
 */
@property (nonatomic,readonly) NSString *edamWebApiUrlPrefix;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *edamUserId;

/**
 *	@brief	过期时间
 */
@property (nonatomic,readonly) NSDate *edamExpires;

/**
 *	@brief	凭证有效性
 */
@property (nonatomic,readonly) BOOL available;


/**
 *	@brief	初始化授权信息
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
