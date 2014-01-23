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
@interface SSTencentWeiboUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Birth day.
 */
@property (nonatomic,readonly) NSInteger birthDay;

/**
 *	@brief	Birth month.
 */
@property (nonatomic,readonly) NSInteger birthMonth;

/**
 *	@brief	Birth year.
 */
@property (nonatomic,readonly) NSInteger birthYear;

/**
 *	@brief	City code.
 */
@property (nonatomic,readonly) NSString *cityCode;

/**
 *	@brief	Career list of this person.
 */
@property (nonatomic, readonly) NSArray *comp;

/**
 *	@brief	Country code.
 */
@property (nonatomic,readonly) NSString *countryCode;

/**
 *	@brief	Education list of this person.
 */
@property (nonatomic, readonly) NSArray *edu;

/**
 *	@brief	E-mail Address.
 */
@property (nonatomic, readonly) NSString *email;

/**
 *	@brief	Experience
 */
@property (nonatomic,readonly) NSInteger exp;

/**
 *	@brief	Fans number.
 */
@property (nonatomic,readonly) NSInteger fansnum;

/**
 *	@brief	Favorited number.
 */
@property (nonatomic,readonly) NSInteger favnum;

/**
 *	@brief	Avatar URL.
 */
@property (nonatomic,readonly) NSString *head;

/**
 *	@brief	Home city code.
 */
@property (nonatomic,readonly) NSString *homecityCode;

/**
 *	@brief	Home country code.
 */
@property (nonatomic,readonly) NSString *homecountryCode;

/**
 *	@brief	Homepage
 */
@property (nonatomic,readonly) NSString *homepage;

/**
 *	@brief	home Province code.
 */
@property (nonatomic,readonly) NSString *homeprovinceCode;

/**
 *	@brief	Hometown code.
 */
@property (nonatomic,readonly) NSString *hometownCode;

/**
 *	@brief	idol number.
 */
@property (nonatomic,readonly) NSInteger idolnum;

/**
 *	@brief	Industry code.
 */
@property (nonatomic,readonly) NSInteger industryCode;

/**
 *	@brief	Introduction
 */
@property (nonatomic,readonly) NSString *introduction;

/**
 *	@brief	Are Enterprise?
 */
@property (nonatomic,readonly) BOOL isent;

/**
 *	@brief	Whether the current user's blacklist, 0 - no, 1 - Yes
 */
@property (nonatomic,readonly) BOOL ismyblack;

/**
 *	@brief	If the current user's audience, 0 - no, 1 - Yes
 */
@property (nonatomic,readonly) BOOL ismyfans;

/**
 *	@brief	Whether it is the current user's idol, 0 - no, 1 - Yes
 */
@property (nonatomic,readonly) BOOL ismyidol;

/**
 *	@brief	Whether the real-name authentication 1 - has real-name authentication 2 - not real-name authentication
 */
@property (nonatomic,readonly) NSInteger isrealname;

/**
 *	@brief	Whether the VIP user, 0 - no, 1 - Yes
 */
@property (nonatomic,readonly) BOOL isvip;

/**
 *	@brief	Level.
 */
@property (nonatomic,readonly) NSInteger level;

/**
 *	@brief	Location.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	Mutual fans number.
 */
@property (nonatomic,readonly) NSInteger mutualFansNum;

/**
 *	@brief	Name.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Nickname
 */
@property (nonatomic,readonly) NSString *nick;

/**
 *	@brief	user id, and name the corresponding
 */
@property (nonatomic,readonly) NSString *openid;

/**
 *	@brief	Province code.
 */
@property (nonatomic,readonly) NSString *provinceCode;

/**
 *	@brief	Registration Time
 */
@property (nonatomic,readonly) NSTimeInterval regtime;

/**
 *	@brief	Whether to allow everyone to send private messages to the current user, 0 - only Idol 1 - Celebrity + audience 2 - everyone
 */
@property (nonatomic,readonly) NSInteger sendPrivateFlag;

/**
 *	@brief	Gender，1-Male，2-Female，0-Not filled
 */
@property (nonatomic,readonly) NSInteger sex;

/**
 *	@brief	Tag list.
 */
@property (nonatomic,readonly) NSArray *tag;

/**
 *	@brief	The last Tweet information.
 */
@property (nonatomic,readonly) NSArray *tweetinfo;

/**
 *	@brief	Tweet number.
 */
@property (nonatomic,readonly) NSInteger tweetnum;

/**
 *	@brief	Verify information.
 */
@property (nonatomic,readonly) NSString *verifyinfo;

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
+ (SSTencentWeiboUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
