//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

@class SSSinaWeiboStatusInfoReader;

/**
 *	@brief	User information reader.
 */
@interface SSSinaWeiboUserInfoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	User id string.
 */
@property (nonatomic,readonly) NSString *idstr;

/**
 *	@brief	Screen name.
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	User name.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Province id.
 */
@property (nonatomic,readonly) NSInteger province;

/**
 *	@brief	City id.
 */
@property (nonatomic,readonly) NSInteger city;

/**
 *	@brief	Location information.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	Description of this person.
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	blog URL of this person.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	User avatar address, 50 × 50 pixels
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	Profile url.
 */
@property (nonatomic,readonly) NSString *profileUrl;

/**
 *	@brief	User's personalized domain
 */
@property (nonatomic,readonly) NSString *domain;

/**
 *	@brief	Wei hao.
 */
@property (nonatomic,readonly) NSString *weihao;

/**
 *	@brief	Gender，m：Male、f：Female、n：Unknown
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	Followers count.
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	Friends count.
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	Statuses count.
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	Favorites count.
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	User-created (registered) time
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	Not support.
 */
@property (nonatomic,readonly) BOOL following;

/**
 *	@brief	Whether to allow everyone to send me a private letter, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL allowAllActMsg;

/**
 *	@brief	Whether to allow the user to identify the location, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL geoEnabled;

/**
 *	@brief	Whether Weibo authenticate the user, that user plus V, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	Not support.
 */
@property (nonatomic,readonly) NSInteger verifiedType;

/**
 *	@brief	Remarks user, the user only when the query relationship returns this field
 */
@property (nonatomic,readonly) NSString *remark;

/**
 *	@brief	Recently a status information.
 */
@property (nonatomic,readonly) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	Whether to allow everyone on my status comment, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL allowAllComment;

/**
 *	@brief	Large image path of avatar
 */
@property (nonatomic,readonly) NSString *avatarLarge;

/**
 *	@brief	Verified reason.
 */
@property (nonatomic,readonly) NSString *verifiedReason;

/**
 *	@brief	Whether the user is follow me, true: YES, false: No
 */
@property (nonatomic,readonly) BOOL followMe;

/**
 *	@brief	online status，0：offline、1：online
 */
@property (nonatomic,readonly) NSInteger onlineStatus;

/**
 *	@brief	bi followers count.
 */
@property (nonatomic,readonly) NSInteger biFollowersCount;

/**
 *	@brief	The current language, zh-cn: Simplified Chinese, zh-tw: Traditional Chinese, en: English
 */
@property (nonatomic,readonly) NSString *lang;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a user information reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSSinaWeiboUserInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;


@end
