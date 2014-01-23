//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	User Reader.
 */
@interface SSSohuWeiboUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	User id.
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	Nickname.
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	Name (not used, it may be used as a personalized domain name).
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	Profile.
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	Avatar path.
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) BOOL bProtected;

/**
 *	@brief	Fans count.
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *profileBackgroundColor;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *profileTextColor;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *profileLinkColor;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *profileSidebarFillColor;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) NSString *profileSidebarBorderColor;

/**
 *	@brief	Friends count.
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	Created time.
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	Favorites count.
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *utcOffset;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *timeZone;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *profileBackgroundImageUrl;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *notifications;

/**
 *	@brief	Whether to support location
 */
@property (nonatomic,readonly) BOOL geoEnabled;

/**
 *	@brief	Statuses count.
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	Following flag.
 */
@property (nonatomic,readonly) BOOL following;

/**
 *	@brief	Whether verified.
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	Language.
 */
@property (nonatomic,readonly) NSString *lang;

/**
 *	@brief	None.
 */
@property (nonatomic,readonly) BOOL contributorsEnabled;

/**
 *	@brief	Gender,1 Male  0  Female。
 */
@property (nonatomic,readonly) NSInteger gender;

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
+ (SSSohuWeiboUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
