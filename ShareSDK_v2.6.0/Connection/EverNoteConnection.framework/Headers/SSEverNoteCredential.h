//
//  SSEverNoteCredential.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-7.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	授权凭证
 */
@interface SSEverNoteCredential : NSObject <ISSPlatformCredential,
                                            NSCoding>
{
@private
    NSString *_uid;
    NSString *_token;
    NSString *_secret;
    NSDictionary *_extInfo;
}

/**
 *	@brief	扩展数据
 */
@property (nonatomic,retain) NSDictionary *extInfo;

/**
 *	@brief	用户ID
 */
@property (nonatomic,copy) NSString *uid;

/**
 *	@brief	Access Token
 */
@property (nonatomic,copy) NSString *token;

/**
 *	@brief	密钥
 */
@property (nonatomic,copy) NSString *secret;

/**
 *	@brief	过期时间
 */
@property (nonatomic,retain) NSDate *expired;

/**
 *	@brief	判断授权数据是否有效
 */
@property (nonatomic,readonly) BOOL available;

/**
 *	@brief	使用原始数据创建授权凭证
 *
 *	@param 	sourceData 	原始数据
 *
 *	@return	授权凭证
 */
+ (SSEverNoteCredential *)credentialWithSourceData:(NSDictionary *)sourceData;

@end
