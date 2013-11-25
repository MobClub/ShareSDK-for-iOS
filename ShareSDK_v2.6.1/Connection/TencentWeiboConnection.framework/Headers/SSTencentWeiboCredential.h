//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	授权凭证
 */
@interface SSTencentWeiboCredential : NSObject <ISSPlatformCredential,
                                                NSCoding>
{
@private
    NSString *_uid;
    NSString *_token;
    NSDate *_expired;
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
+ (SSTencentWeiboCredential *)credentialWithSourceData:(NSDictionary *)sourceData;


@end
