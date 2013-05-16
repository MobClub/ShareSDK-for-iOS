//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SS163WeiboCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

@class SS163WeiboStatus;

/**
 *	@brief	用户信息
 */
@interface SS163WeiboUser : NSObject <NSCoding,
                                      ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SS163WeiboCredential *_credential;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SS163WeiboCredential *credential;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSInteger columnIdNameWithCounts;

/**
 *	@brief	用户注册时间
 */
@property (nonatomic,readonly) NSDate *createdAt;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *darenRec;

/**
 *	@brief	用户描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	邮箱地址
 */
@property (nonatomic,readonly) NSString *email;

/**
 *	@brief	收藏数
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	被关注数
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	关注数
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	性别，0为保密，1为男性，2为女性
 */
@property (nonatomic,readonly) NSInteger gender;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL geoEnable;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSInteger icorp;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSArray *inGroups;

/**
 *	@brief	用户地址
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户头像URL，最大长度为255
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *realName;

/**
 *	@brief	个性网址
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	发微博数
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *sysTag;

/**
 *	@brief	个人博客地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *userTag;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	最新一条微博
 */
@property (nonatomic,readonly) SS163WeiboStatus *status;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	用户信息
 */
+ (SS163WeiboUser *)userInfoWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
