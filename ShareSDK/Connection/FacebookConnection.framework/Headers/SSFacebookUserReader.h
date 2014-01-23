//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSFacebookAgeRangeReader.h"
#import "SSFacebookCoverReader.h"
#import "SSFacebookCurrencyReader.h"
#import "SSFacebookHometownReader.h"
#import "SSFacebookLocationReader.h"
#import "SSFacebookPaymentPricePointReader.h"
#import "SSFacebookSecuritySettingReader.h"
#import "SSFacebookSignficantOtherReader.h"
#import "SSFacebookVideoUploadLimitsReader.h"

/**
 *	@brief	User Reader.
 */
@interface SSFacebookUserReader : NSObject
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
 *	@brief	Name
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	first name.
 */
@property (nonatomic,readonly) NSString *firstName;

/**
 *	@brief	Middle name.
 */
@property (nonatomic,readonly) NSString *middleName;

/**
 *	@brief	Last name.
 */
@property (nonatomic,readonly) NSString *lastName;

/**
 *	@brief	Gender.
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	Locale.
 */
@property (nonatomic,readonly) NSString *locale;

/**
 *	@brief	language.
 */
@property (nonatomic,readonly) NSArray *languages;

/**
 *	@brief	Personal homepage link.
 */
@property (nonatomic,readonly) NSString *link;

/**
 *	@brief	User name.
 */
@property (nonatomic,readonly) NSString *username;

/**
 *	@brief	Age range.
 */
@property (nonatomic,readonly) SSFacebookAgeRangeReader *ageRange;

/**
 *	@brief	Third party id.
 */
@property (nonatomic,readonly) NSString *thirdPartyId;

/**
 *	@brief	installed.
 */
@property (nonatomic,readonly) BOOL installed;

/**
 *	@brief	Time zone.
 */
@property (nonatomic,readonly) NSNumber *timezone;

/**
 *	@brief	Updated time.
 */
@property (nonatomic,readonly) NSString *updatedTime;

/**
 *	@brief	Verified
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	User description.
 */
@property (nonatomic,readonly) NSString *bio;

/**
 *	@brief	Birthday
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	Cover information.
 */
@property (nonatomic,readonly) SSFacebookCoverReader *cover;

/**
 *	@brief	Currency information.
 */
@property (nonatomic,readonly) SSFacebookCurrencyReader *currency;

/**
 *	@brief	Devices.
 */
@property (nonatomic,readonly) NSArray *devices;

/**
 *	@brief	Education.
 */
@property (nonatomic,readonly) NSArray *education;

/**
 *	@brief	E-mail.
 */
@property (nonatomic,readonly) NSString *email;

/**
 *	@brief	Hometown.
 */
@property (nonatomic,readonly) SSFacebookHometownReader *hometown;

/**
 *	@brief	 Interested in.
 */
@property (nonatomic,readonly) NSArray *interestedIn;

/**
 *	@brief	Location.
 */
@property (nonatomic,readonly) SSFacebookLocationReader *location;

/**
 *	@brief	Political.
 */
@property (nonatomic,readonly) NSString *political;

/**
 *	@brief	Payment price points.
 */
@property (nonatomic,readonly) SSFacebookPaymentPricePointReader *paymentPricepoints;

/**
 *	@brief	Favorite athletes.
 */
@property (nonatomic,readonly) NSArray *favoriteAthletes;

/**
 *	@brief	Favorite teams.
 */
@property (nonatomic,readonly) NSArray *favoriteTeams;

/**
 *	@brief	Avatar.
 */
@property (nonatomic,readonly) id picture;

/**
 *	@brief	Quotes.
 */
@property (nonatomic,readonly) NSString *quotes;

/**
 *	@brief	Relationship status.
 */
@property (nonatomic,readonly) NSString *relationshipStatus;

/**
 *	@brief	Religion.
 */
@property (nonatomic,readonly) NSString *religion;

/**
 *	@brief	secuity setting reader.
 */
@property (nonatomic,readonly) SSFacebookSecuritySettingReader *securitySettings;

/**
 *	@brief	The user's significant other
 */
@property (nonatomic,readonly) SSFacebookSignficantOtherReader *significantOther;

/**
 *	@brief	Video upload limits.
 */
@property (nonatomic,readonly) SSFacebookVideoUploadLimitsReader *videoUploadLimits;

/**
 *	@brief	Personal homepage.
 */
@property (nonatomic,readonly) NSString *website;

/**
 *	@brief	Career information.
 */
@property (nonatomic,readonly) NSArray *work;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSFacebookUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
