//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSGooglePlusNameReader.h"
#import "SSGooglePlusImageReader.h"
#import "SSGooglePlusAgeRangeReader.h"
#import "SSGooglePlusCoverReader.h"

/**
 *	@brief	用户信息读取器
 */
@interface SSGooglePlusUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	Identifies this resource as a person.
 */
@property (nonatomic,readonly) NSString *kind;

/**
 *	@brief	ETag of this response for caching purposes.
 */
@property (nonatomic,readonly) id etag;

/**
 *	@brief	The nickname of this person.
 */
@property (nonatomic,readonly) NSString *nickname;

/**
 *	@brief	The person's date of birth, represented as YYYY-MM-DD.
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	The person's gender. Possible values are:
 *          "male" - Male gender.
 *          "female" - Female gender.
 *          "other" - Other.
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	A list of email addresses that this person has set to public on their Google+ profile.
 *          You can also use the userinfo.email scope to retrieve an authenticated user's email address.
 */
@property (nonatomic,readonly) NSArray *emails;

/**
 *	@brief	A list of URLs for this person.
 */
@property (nonatomic,readonly) NSArray *urls;

/**
 *	@brief	Type of person within Google+. Possible values are:
 *          "person" - represents an actual person.
 *          "page" - represents a page.
 */
@property (nonatomic,readonly) NSString *objectType;

/**
 *	@brief	The ID of this person.
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	The name of this person, suitable for display.
 */
@property (nonatomic,readonly) NSString *displayName;

/**
 *	@brief	An object representation of the individual components of a person's name.
 */
@property (nonatomic,readonly) SSGooglePlusNameReader *name;

/**
 *	@brief	The brief description (tagline) of this person.
 */
@property (nonatomic,readonly) NSString *tagline;

/**
 *	@brief	The "bragging rights" line of this person.
 */
@property (nonatomic,readonly) NSString *braggingRights;

/**
 *	@brief	A short biography for this person.
 */
@property (nonatomic,readonly) NSString *aboutMe;

/**
 *	@brief	The current location for this person.
 */
@property (nonatomic,readonly) NSString *currentLocation;

/**
 *	@brief	The person's relationship status. Possible values are:
 *          "single" - Person is single.
 *          "in_a_relationship" - Person is in a relationship.
 *          "engaged" - Person is engaged.
 *          "married" - Person is married.
 *          "its_complicated" - The relationship is complicated.
 *          "open_relationship" - Person is in an open relationship.
 *          "widowed" - Person is widowed.
 *          "in_domestic_partnership" - Person is in a domestic partnership.
 *          "in_civil_union" - Person is in a civil union.
 */
@property (nonatomic,readonly) NSString *relationshipStatus;

/**
 *	@brief	The URL of this person's profile.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	The representation of the person's profile photo.
 */
@property (nonatomic,readonly) SSGooglePlusImageReader *image;

/**
 *	@brief	A list of current or past organizations with which this person is associated.
 */
@property (nonatomic,readonly) NSArray *organizations;

/**
 *	@brief	A list of places where this person has lived.
 */
@property (nonatomic,readonly) NSArray *placesLived;

/**
 *	@brief	If "true", indicates that the person has installed the app that is making the request and
 *          has chosen to expose this install state to the caller.
 *          A value of "false" indicates that the install state cannot be determined
 *          (it is either not installed or the person has chosen to keep this information private).
 */
@property (nonatomic,readonly) BOOL hasApp;

/**
 *	@brief	The user's preferred language for rendering.
 */
@property (nonatomic,readonly) BOOL isPlusUser;

/**
 *	@brief	The user's preferred language for rendering.
 */
@property (nonatomic,readonly) NSString *language;

/**
 *	@brief	The age range of the person.
 */
@property (nonatomic,readonly) SSGooglePlusAgeRangeReader *ageRange;

/**
 *	@brief	If a Google+ Page, the number of people who have +1'ed this page.
 */
@property (nonatomic,readonly) NSInteger plusOneCount;

/**
 *	@brief	If a Google+ Page and for followers who are visible, the number of people who have added this page to a circle.
 */
@property (nonatomic,readonly) NSInteger circledByCount;

/**
 *	@brief	Whether the person or Google+ Page has been verified.
 *          This is used only for pages with a higher risk of being impersonated or similar.
 *          This flag will not be present on most profiles.
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	The cover photo content.
 */
@property (nonatomic,readonly) SSGooglePlusCoverReader *cover;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
