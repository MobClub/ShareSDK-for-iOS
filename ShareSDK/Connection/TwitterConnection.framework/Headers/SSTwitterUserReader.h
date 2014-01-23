//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSTwitterEntitiesReader.h"

@class SSTwitterTweetsReader;

/**
 *	@brief	User Reader.
 */
@interface SSTwitterUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Said user to enable "contributor Mode", allowing users to synchronize tweet released to another account.
 */
@property (nonatomic,readonly) BOOL contributorsEnabled;

/**
 *	@brief	Created time.
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	If true, indicates that the user does not change the user profile theme or background.
 */
@property (nonatomic,readonly) BOOL defaultProfile;

/**
 *	@brief	If true, indicates that the user has not upload your own avatar, the default egg avatar instead.
 */
@property (nonatomic,readonly) BOOL defaultProfileImage;

/**
 *	@brief	User description.
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	URL parsed entity or by a user-defined description of the field.
 */
@property (nonatomic,readonly) SSTwitterEntitiesReader *entities;

/**
 *	@brief	Favourites number.
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	If true, expressed the need to send a follow request Watch this user
 */
@property (nonatomic,readonly) BOOL followRequestSent;

/**
 *	@brief	If true, indicates that the current authorized user concerns of the user
 */
@property (nonatomic,readonly) BOOL following;

/**
 *	@brief	Fans number.
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	Friends number.
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	Enable location identification, if necessary with a location, this value must be true when sending tweet
 */
@property (nonatomic,readonly) BOOL geoEnabled;

/**
 *	@brief	User id.
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	User id string.
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	When true, indicates that the user is a participant in Twitter's
 */
@property (nonatomic,readonly) BOOL isTranslator;

/**
 *	@brief	 user-defined interface language, may affect the Tweet content encoding
 */
@property (nonatomic,readonly) NSString *lang;

/**
 *	@brief	listed count.
 */
@property (nonatomic,readonly) NSInteger listedCount;

/**
 *	@brief	Location information as defined in the personal account
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	Name.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Deprecated。Indicates whether the authorized user to receive the user's chosen via SMS Tweets
 */
@property (nonatomic,readonly) BOOL notifications;

/**
 *	@brief	Profile background color（hexadecimal color value）
 */
@property (nonatomic,readonly) NSString *profileBackgroundColor;

/**
 *	@brief	Profile background image URL(HTTP)
 */
@property (nonatomic,readonly) NSString *profileBackgroundImageUrl;

/**
 *	@brief	Profile background image URL(HTTPS)
 */
@property (nonatomic,readonly) NSString *profileBackgroundImageUrlHttps;

/**
 *	@brief	If true, indicates that the user settings profile_background_image_url should be tiled.
 */
@property (nonatomic,readonly) BOOL profileBackgroundTile;

/**
 *	@brief	Profile banner URL（HTTPS）
 */
@property (nonatomic,readonly) NSString *profileBannerUrl;

/**
 *	@brief	Profile image URL(HTTP)
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	Profile image URL (HTTPS)
 */
@property (nonatomic,readonly) NSString *profileImageUrlHttps;

/**
 *	@brief	Profile link color（hexadecimal color value）
 */
@property (nonatomic,readonly) NSString *profileLinkColor;

/**
 *	@brief	Profile sidebar border color（hexadecimal color value）
 */
@property (nonatomic,readonly) NSString *profileSidebarBorderColor;

/**
 *	@brief	Profile page sidebar fill color (hexadecimal color value)
 */
@property (nonatomic,readonly) NSString *profileSidebarFillColor;

/**
 *	@brief	Profile text color (hexadecimal color value)
 */
@property (nonatomic,readonly) NSString *profileTextColor;

/**
 *	@brief	Is true, said users upload their own background
 */
@property (nonatomic,readonly) BOOL profileUseBackgroundImage;

/**
 *	@brief	True to tweets will be protected
 */
@property (nonatomic,readonly) BOOL Protected;

/**
 *	@brief	Screen name，Unique
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	Indicates that the user would like to see media inline
 */
@property (nonatomic,readonly) BOOL showAllInlineMedia;

/**
 *	@brief	Recently a Tweet or Retweet
 */
@property (nonatomic,readonly) SSTwitterTweetsReader *status;

/**
 *	@brief	Statuses count.
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	time zone
 */
@property (nonatomic,readonly) NSString *timeZone;

/**
 *	@brief	Personal homepage.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	UTC offset（unit：seconds）
 */
@property (nonatomic,readonly) NSInteger utcOffset;

/**
 *	@brief	Is true indicates verified.
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	When present, indicates a textual representation of the two-letter country codes this user is withheld from.
 */
@property (nonatomic,readonly) NSString *withheldInCountries;

/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
@property (nonatomic,readonly) NSString *withheldScope;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSTwitterUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
