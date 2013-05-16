//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTwitterEntities.h"
#import "SSTwitterPlaces.h"
#import "SSTwitterCoordinates.h"

@class SSTwitterUser;

/**
 *	@brief	Tweets信息
 */
@interface SSTwitterTweets : NSObject <NSCoding>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	未使用
 */
@property (nonatomic,readonly) id annotations;

/**
 *	@brief	一个贡献用户对象的集合
 */
@property (nonatomic,readonly) NSArray *contributors;

/**
 *	@brief	表示由用户或客户端应用程序报告该Tweets的地理位置
 */
@property (nonatomic,readonly) SSTwitterCoordinates *coordinates;

/**
 *	@brief	Tweets的创建时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	当前用户转发Tweet，仅当支持include_my_retweet参数的接口中设置该参数为true时显示，
 */
@property (nonatomic,readonly) id currentUserRetweet;

/**
 *	@brief	实体信息
 */
@property (nonatomic,readonly) SSTwitterEntities *entities;

/**
 *	@brief	是否收藏
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	已过期，用coordinates代替
 */
@property (nonatomic,readonly) id geo;

/**
 *	@brief	Tweet ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	Tweet ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	源Tweet的用户屏幕名称
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	源Tweet的ID
 */
@property (nonatomic,readonly) long long inReplyToStatusId;

/**
 *	@brief	源Tweet的ID字符串
 */
@property (nonatomic,readonly) NSString *inReplyToStatusIdStr;

/**
 *	@brief	源Tweet的用户ID
 */
@property (nonatomic,readonly) long long inReplyToUserId;

/**
 *	@brief	源Tweet的用户ID字符串
 */
@property (nonatomic,readonly) NSString *inReplyToUserIdStr;

/**
 *	@brief	Tweet关联地点
 */
@property (nonatomic,readonly) SSTwitterPlaces *place;

/**
 *	@brief	指示内容是否包含敏感内容
 */
@property (nonatomic,readonly) BOOL possiblySensitive;

/**
 *	@brief	A set of key-value pairs indicating the intended contextual delivery of the containing Tweet. Currently used by Twitter's Promoted Products
 */
@property (nonatomic,readonly) id scopes;

/**
 *	@brief	转推数量
 */
@property (nonatomic,readonly) NSInteger retweetCount;

/**
 *	@brief	转推标识，表示当前用户是否转推该Tweet
 */
@property (nonatomic,readonly) BOOL retweeted;

/**
 *	@brief	Tweet来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	表示text参数的值是否被截断
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	发布用户
 */
@property (nonatomic,readonly) SSTwitterUser *user;

/**
 *	@brief	When present and set to "true", it indicates that this piece of content has been withheld due to a DMCA complaint
 */
@property (nonatomic,readonly) BOOL withheldCopyright;

/**
 *	@brief When present, indicates a list of uppercase two-letter country codes this content is withheld from.
 */
@property (nonatomic,readonly) NSArray *withheldInCountries;

/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
@property (nonatomic,readonly) NSString *withheldScope;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;


/**
 *	@brief	创建Tweet信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	Tweet信息
 */
+ (SSTwitterTweets *)tweetsInfoWithResponse:(NSDictionary *)response;

@end
