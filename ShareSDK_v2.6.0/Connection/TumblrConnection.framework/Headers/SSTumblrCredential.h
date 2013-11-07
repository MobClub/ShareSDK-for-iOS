//
//  SSTumblrCredential.h
//  TumblrConnection
//
//  Created by 冯 鸿杰 on 13-9-5.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Tumblr授权凭证
 */
@interface SSTumblrCredential : NSObject <ISSPlatformCredential,
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
 *	@brief	过期时间
 */
@property (nonatomic,retain) NSString *secret;

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
+ (SSTumblrCredential *)credentialWithSourceData:(NSDictionary *)sourceData;

@end
