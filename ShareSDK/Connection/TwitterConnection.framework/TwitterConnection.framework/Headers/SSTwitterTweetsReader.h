///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "SSTwitterCoordinatesReader.h"
#import "SSTwitterEntitiesReader.h"
#import "SSTwitterPlacesReader.h"

@class SSTwitterUserReader;

///#begin zh-cn
/**
 *	@brief	Tweets信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Tweets Reader.
 */
///#end
@interface SSTwitterTweetsReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

///#begin zh-cn
/**
 *	@brief	源数据
 */
///#end
///#begin en
/**
 *	@brief	Raw data.
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin zh-cn
/**
 *	@brief	未使用
 */
///#end
///#begin en
/**
 *	@brief	Unused
 */
///#end
@property (nonatomic,readonly) id annotations;

///#begin zh-cn
/**
 *	@brief	一个贡献用户对象的集合
 */
///#end
///#begin en
/**
 *	@brief	a contributors list.
 */
///#end
@property (nonatomic,readonly) NSArray *contributors;

///#begin zh-cn
/**
 *	@brief	表示由用户或客户端应用程序报告该Tweets的地理位置
 */
///#end
///#begin en
/**
 *	@brief	Said the report by the user or client application that Tweets location
 */
///#end
@property (nonatomic,readonly) SSTwitterCoordinatesReader *coordinates;

///#begin zh-cn
/**
 *	@brief	Tweets的创建时间
 */
///#end
///#begin en
/**
 *	@brief	Tweets created time.
 */
///#end
@property (nonatomic,readonly) NSString *createdAt;

///#begin zh-cn
/**
 *	@brief	当前用户转发Tweet，仅当支持include_my_retweet参数的接口中设置该参数为true时显示，
 */
///#end
///#begin en
/**
 *	@brief	Current user retweet, is true only if the interface supports include_my_retweet parameter sets the parameter display,
 */
///#end
@property (nonatomic,readonly) id currentUserRetweet;

///#begin zh-cn
/**
 *	@brief	实体信息
 */
///#end
///#begin en
/**
 *	@brief	Entities information.
 */
///#end
@property (nonatomic,readonly) SSTwitterEntitiesReader *entities;

///#begin zh-cn
/**
 *	@brief	是否收藏
 */
///#end
///#begin en
/**
 *	@brief	Whether favorited.
 */
///#end
@property (nonatomic,readonly) BOOL favorited;

///#begin zh-cn
/**
 *	@brief	已过期，用coordinates代替
 */
///#end
///#begin en
/**
 *	@brief	Deprecated，Instead of using coordinates
 */
///#end
@property (nonatomic,readonly) id geo;

///#begin zh-cn
/**
 *	@brief	Tweet ID
 */
///#end
///#begin en
/**
 *	@brief	Tweet ID
 */
///#end
@property (nonatomic,readonly) long long Id;

///#begin zh-cn
/**
 *	@brief	Tweet ID字符串
 */
///#end
///#begin en
/**
 *	@brief	Tweet ID string.
 */
///#end
@property (nonatomic,readonly) NSString *idStr;

///#begin zh-cn
/**
 *	@brief	源Tweet的用户屏幕名称
 */
///#end
///#begin en
/**
 *	@brief	in reply to screen name.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToScreenName;

///#begin zh-cn
/**
 *	@brief	源Tweet的ID
 */
///#end
///#begin en
/**
 *	@brief	in reply to status id.
 */
///#end
@property (nonatomic,readonly) long long inReplyToStatusId;

///#begin zh-cn
/**
 *	@brief	源Tweet的ID字符串
 */
///#end
///#begin en
/**
 *	@brief	in reply to status id string.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToStatusIdStr;

///#begin zh-cn
/**
 *	@brief	源Tweet的用户ID
 */
///#end
///#begin en
/**
 *	@brief	in reply to user id.
 */
///#end
@property (nonatomic,readonly) long long inReplyToUserId;

///#begin zh-cn
/**
 *	@brief	源Tweet的用户ID字符串
 */
///#end
///#begin en
/**
 *	@brief	in reply to user id string.
 */
///#end
@property (nonatomic,readonly) NSString *inReplyToUserIdStr;

///#begin zh-cn
/**
 *	@brief	Tweet关联地点
 */
///#end
///#begin en
/**
 *	@brief	Place information.
 */
///#end
@property (nonatomic,readonly) SSTwitterPlacesReader *place;

///#begin zh-cn
/**
 *	@brief	指示内容是否包含敏感内容
 */
///#end
///#begin en
/**
 *	@brief	Indicating whether the contents contain sensitive content
 */
///#end
@property (nonatomic,readonly) BOOL possiblySensitive;

///#begin zh-cn
/**
 *	@brief	A set of key-value pairs indicating the intended contextual delivery of the containing Tweet. Currently used by Twitter's Promoted Products
 */
///#end
///#begin en
/**
 *	@brief	A set of key-value pairs indicating the intended contextual delivery of the containing Tweet. Currently used by Twitter's Promoted Products
 */
///#end
@property (nonatomic,readonly) id scopes;

///#begin zh-cn
/**
 *	@brief	转推数量
 */
///#end
///#begin en
/**
 *	@brief	Retweet count.
 */
///#end
@property (nonatomic,readonly) NSInteger retweetCount;

///#begin zh-cn
/**
 *	@brief	转推标识，表示当前用户是否转推该Tweet
 */
///#end
///#begin en
/**
 *	@brief	Retweet flag, which means that the current user Retweet this Tweet
 */
///#end
@property (nonatomic,readonly) BOOL retweeted;

///#begin zh-cn
/**
 *	@brief	Tweet来源
 */
///#end
///#begin en
/**
 *	@brief	Tweet source.
 */
///#end
@property (nonatomic,readonly) NSString *source;

///#begin zh-cn
/**
 *	@brief	内容
 */
///#end
///#begin en
/**
 *	@brief	Content string.
 */
///#end
@property (nonatomic,readonly) NSString *text;

///#begin zh-cn
/**
 *	@brief	表示text参数的值是否被截断
 */
///#end
///#begin en
/**
 *	@brief	Does it mean that the parameter value was truncated text
 */
///#end
@property (nonatomic,readonly) BOOL truncated;

///#begin zh-cn
/**
 *	@brief	发布用户
 */
///#end
///#begin en
/**
 *	@brief	User information.
 */
///#end
@property (nonatomic,readonly) SSTwitterUserReader *user;

///#begin zh-cn
/**
 *	@brief	When present and set to "true", it indicates that this piece of content has been withheld due to a DMCA complaint
 */
///#end
///#begin en
/**
 *	@brief	When present and set to "true", it indicates that this piece of content has been withheld due to a DMCA complaint
 */
///#end
@property (nonatomic,readonly) BOOL withheldCopyright;

///#begin zh-cn
/**
 *	@brief When present, indicates a list of uppercase two-letter country codes this content is withheld from.
 */
///#end
///#begin en
/**
 *	@brief When present, indicates a list of uppercase two-letter country codes this content is withheld from.
 */
///#end
@property (nonatomic,readonly) NSArray *withheldInCountries;

///#begin zh-cn
/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
///#end
///#begin en
/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
///#end
@property (nonatomic,readonly) NSString *withheldScope;

///#begin zh-cn
/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建Tweets信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a tweets reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSTwitterTweetsReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
