//
//  SSKakaoStoryCredential.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/17.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDKPlugin.h>

@interface SSKakaoStoryCredential : NSObject <ISSPlatformCredential,
                                             NSCoding>
///#begin zh-cn
/**
 *	@brief	扩展数据
 */
///#end
///#begin en
/**
 *	@brief	Extended data.
 */
///#end
@property (nonatomic, strong) NSDictionary *extInfo;

///#begin zh-cn
/**
 *	@brief	用户ID
 */
///#end
///#begin en
/**
 *	@brief	User id.
 */
///#end
@property (nonatomic, copy) NSString *uid;

///#begin zh-cn
/**
 *	@brief	Access Token
 */
///#end
///#begin en
/**
 *	@brief	Access Token
 */
///#end
@property (nonatomic, copy) NSString *token;

///#begin zh-cn
/**
 *	@brief	过期时间
 */
///#end
///#begin en
/**
 *	@brief	Expires.
 */
///#end
@property (nonatomic, strong) NSDate *expired;

///#begin zh-cn
/**
 *	@brief	判断授权数据是否有效
 */
///#end
///#begin en
/**
 *	@brief	Determine the validity of the authorization data
 */
///#end
@property (nonatomic,readonly) BOOL available;

///#begin zh-cn
/**
 *	@brief	使用原始数据创建授权凭证
 *
 *	@param 	sourceData 	原始数据
 *
 *	@return	授权凭证
 */
///#end
///#begin en
/**
 *	@brief	Create a credential.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Credential object.
 */
///#end
+ (SSKakaoStoryCredential *)credentialWithSourceData:(NSDictionary *)sourceData;



@end
