//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSTwitterCoordinatesReader.h"
#import "SSTwitterEntitiesReader.h"
#import "SSTwitterPlacesReader.h"

@class SSTwitterUserReader;

/**
 *	@brief	Tweets Reader.
 */
@interface SSTwitterTweetsReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Unused
 */
@property (nonatomic,readonly) id annotations;

/**
 *	@brief	a contributors list.
 */
@property (nonatomic,readonly) NSArray *contributors;

/**
 *	@brief	Said the report by the user or client application that Tweets location
 */
@property (nonatomic,readonly) SSTwitterCoordinatesReader *coordinates;

/**
 *	@brief	Tweets created time.
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	Current user retweet, is true only if the interface supports include_my_retweet parameter sets the parameter display,
 */
@property (nonatomic,readonly) id currentUserRetweet;

/**
 *	@brief	Entities information.
 */
@property (nonatomic,readonly) SSTwitterEntitiesReader *entities;

/**
 *	@brief	Whether favorited.
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	Deprecated，Instead of using coordinates
 */
@property (nonatomic,readonly) id geo;

/**
 *	@brief	Tweet ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	Tweet ID string.
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	in reply to screen name.
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	in reply to status id.
 */
@property (nonatomic,readonly) long long inReplyToStatusId;

/**
 *	@brief	in reply to status id string.
 */
@property (nonatomic,readonly) NSString *inReplyToStatusIdStr;

/**
 *	@brief	in reply to user id.
 */
@property (nonatomic,readonly) long long inReplyToUserId;

/**
 *	@brief	in reply to user id string.
 */
@property (nonatomic,readonly) NSString *inReplyToUserIdStr;

/**
 *	@brief	Place information.
 */
@property (nonatomic,readonly) SSTwitterPlacesReader *place;

/**
 *	@brief	Indicating whether the contents contain sensitive content
 */
@property (nonatomic,readonly) BOOL possiblySensitive;

/**
 *	@brief	A set of key-value pairs indicating the intended contextual delivery of the containing Tweet. Currently used by Twitter's Promoted Products
 */
@property (nonatomic,readonly) id scopes;

/**
 *	@brief	Retweet count.
 */
@property (nonatomic,readonly) NSInteger retweetCount;

/**
 *	@brief	Retweet flag, which means that the current user Retweet this Tweet
 */
@property (nonatomic,readonly) BOOL retweeted;

/**
 *	@brief	Tweet source.
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	Content string.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Does it mean that the parameter value was truncated text
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	User information.
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
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a tweets reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSTwitterTweetsReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
