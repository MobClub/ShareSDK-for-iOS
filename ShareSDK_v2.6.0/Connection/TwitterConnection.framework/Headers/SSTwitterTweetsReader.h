//
//  SSTwitterTweetsReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTwitterCoordinatesReader.h"
#import "SSTwitterEntitiesReader.h"
#import "SSTwitterPlacesReader.h"

@class SSTwitterUserReader;

/**
 *	@brief	Tweets信息读取器
 */
@interface SSTwitterTweetsReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

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
@property (nonatomic,readonly) SSTwitterCoordinatesReader *coordinates;

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
@property (nonatomic,readonly) SSTwitterEntitiesReader *entities;

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
@property (nonatomic,readonly) SSTwitterPlacesReader *place;

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
@property (nonatomic,readonly) SSTwitterUserReader *user;

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
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建Tweets信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterTweetsReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
