//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSSinaWeiboGeoReader.h"
#import "SSSinaWeiboVisibleReader.h"

@class SSSinaWeiboUserInfoReader;

/**
 *	@brief	Status Information Reader.
 */
@interface SSSinaWeiboStatusInfoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Created time.
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	status id string.
 */
@property (nonatomic,readonly) NSString *idstr;

/**
 *	@brief	Status id.
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	Status mid.
 */
@property (nonatomic,readonly) long long mid;

/**
 *	@brief	Content string.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Source.
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	Whether favorited, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	Whether truncated, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	Reply status id.
 */
@property (nonatomic,readonly) NSString *inReplyToStatusId;

/**
 *	@brief	Reply user id.
 */
@property (nonatomic,readonly) NSString *inReplyToUserId;

/**
 *	@brief	Reply Nickname
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	Address of the thumbnail, this field is not returned when no
 */
@property (nonatomic,readonly) NSString *thumbnailPic;

/**
 *	@brief	Address of the middle picture, this field is not returned when no
 */
@property (nonatomic,readonly) NSString *bmiddlePic;

/**
 *	@brief	Address of the original picture, this field is not returned when no
 */
@property (nonatomic,readonly) NSString *originalPic;

/**
 *	@brief	Geo information
 */
@property (nonatomic,readonly) SSSinaWeiboGeoReader *geo;

/**
 *	@brief	user information
 */
@property (nonatomic,readonly) SSSinaWeiboUserInfoReader *user;

/**
 *	@brief	Reposts count.
 */
@property (nonatomic,readonly) NSInteger repostsCount;

/**
 *	@brief	Comments count.
 */
@property (nonatomic,readonly) NSInteger commentsCount;

/**
 *	@brief	Not support.
 */
@property (nonatomic,readonly) NSInteger attitudesCount;

/**
 *	@brief	Not support.
 */
@property (nonatomic,readonly) NSInteger mlevel;

/**
 *	@brief	Status visibility and visibility group information
 */
@property (nonatomic,readonly) SSSinaWeiboVisibleReader *visible;

/**
 *	@brief	Retweeted status.
 */
@property (nonatomic,readonly) SSSinaWeiboStatusInfoReader *retweetedStatus;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a status reader
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Status reader.
 */
+ (SSSinaWeiboStatusInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
