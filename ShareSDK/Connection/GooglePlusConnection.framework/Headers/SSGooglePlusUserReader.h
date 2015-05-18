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
#import "SSGooglePlusNameReader.h"
#import "SSGooglePlusImageReader.h"
#import "SSGooglePlusAgeRangeReader.h"
#import "SSGooglePlusCoverReader.h"

///#begin zh-cn
/**
 *	@brief	用户信息读取器
 */
///#end
///#begin en
/**
 *	@brief	User reader.
 */
///#end
@interface SSGooglePlusUserReader : NSObject
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
 *	@brief	Identifies this resource as a person.
 */
///#end
///#begin en
/**
 *	@brief	Identifies this resource as a person.
 */
///#end
@property (nonatomic,readonly) NSString *kind;

///#begin zh-cn
/**
 *	@brief	ETag of this response for caching purposes.
 */
///#end
///#begin en
/**
 *	@brief	ETag of this response for caching purposes.
 */
///#end
@property (nonatomic,readonly) id etag;

///#begin zh-cn
/**
 *	@brief	The nickname of this person.
 */
///#end
///#begin en
/**
 *	@brief	The nickname of this person.
 */
///#end
@property (nonatomic,readonly) NSString *nickname;

///#begin zh-cn
/**
 *	@brief	The person's date of birth, represented as YYYY-MM-DD.
 */
///#end
///#begin en
/**
 *	@brief	The person's date of birth, represented as YYYY-MM-DD.
 */
///#end
@property (nonatomic,readonly) NSString *birthday;

///#begin zh-cn
/**
 *	@brief	The person's gender. Possible values are:
 *          "male" - Male gender.
 *          "female" - Female gender.
 *          "other" - Other.
 */
///#end
///#begin en
/**
 *	@brief	The person's gender. Possible values are:
 *          "male" - Male gender.
 *          "female" - Female gender.
 *          "other" - Other.
 */
///#end
@property (nonatomic,readonly) NSString *gender;

///#begin zh-cn
/**
 *	@brief	A list of email addresses that this person has set to public on their Google+ profile.
 *          You can also use the userinfo.email scope to retrieve an authenticated user's email address.
 */
///#end
///#begin en
/**
 *	@brief	A list of email addresses that this person has set to public on their Google+ profile.
 *          You can also use the userinfo.email scope to retrieve an authenticated user's email address.
 */
///#end
@property (nonatomic,readonly) NSArray *emails;

///#begin zh-cn
/**
 *	@brief	A list of URLs for this person.
 */
///#end
///#begin en
/**
 *	@brief	A list of URLs for this person.
 */
///#end
@property (nonatomic,readonly) NSArray *urls;

///#begin zh-cn
/**
 *	@brief	Type of person within Google+. Possible values are:
 *          "person" - represents an actual person.
 *          "page" - represents a page.
 */
///#end
///#begin en
/**
 *	@brief	Type of person within Google+. Possible values are:
 *          "person" - represents an actual person.
 *          "page" - represents a page.
 */
///#end
@property (nonatomic,readonly) NSString *objectType;

///#begin zh-cn
/**
 *	@brief	The ID of this person.
 */
///#end
///#begin en
/**
 *	@brief	The ID of this person.
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	The name of this person, suitable for display.
 */
///#end
///#begin en
/**
 *	@brief	The name of this person, suitable for display.
 */
///#end
@property (nonatomic,readonly) NSString *displayName;

///#begin zh-cn
/**
 *	@brief	An object representation of the individual components of a person's name.
 */
///#end
///#begin en
/**
 *	@brief	An object representation of the individual components of a person's name.
 */
///#end
@property (nonatomic,readonly) SSGooglePlusNameReader *name;

///#begin zh-cn
/**
 *	@brief	The brief description (tagline) of this person.
 */
///#end
///#begin en
/**
 *	@brief	The brief description (tagline) of this person.
 */
///#end
@property (nonatomic,readonly) NSString *tagline;

///#begin zh-cn
/**
 *	@brief	The "bragging rights" line of this person.
 */
///#end
///#begin en
/**
 *	@brief	The "bragging rights" line of this person.
 */
///#end
@property (nonatomic,readonly) NSString *braggingRights;

///#begin zh-cn
/**
 *	@brief	A short biography for this person.
 */
///#end
///#begin en
/**
 *	@brief	A short biography for this person.
 */
///#end
@property (nonatomic,readonly) NSString *aboutMe;

///#begin zh-cn
/**
 *	@brief	The current location for this person.
 */
///#end
///#begin en
/**
 *	@brief	The current location for this person.
 */
///#end
@property (nonatomic,readonly) NSString *currentLocation;

///#begin zh-cn
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
///#end
///#begin en
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
///#end
@property (nonatomic,readonly) NSString *relationshipStatus;

///#begin zh-cn
/**
 *	@brief	The URL of this person's profile.
 */
///#end
///#begin en
/**
 *	@brief	The URL of this person's profile.
 */
///#end
@property (nonatomic,readonly) NSString *url;

///#begin zh-cn
/**
 *	@brief	The representation of the person's profile photo.
 */
///#end
///#begin en
/**
 *	@brief	The representation of the person's profile photo.
 */
///#end
@property (nonatomic,readonly) SSGooglePlusImageReader *image;

///#begin zh-cn
/**
 *	@brief	A list of current or past organizations with which this person is associated.
 */
///#end
///#begin en
/**
 *	@brief	A list of current or past organizations with which this person is associated.
 */
///#end
@property (nonatomic,readonly) NSArray *organizations;

///#begin zh-cn
/**
 *	@brief	A list of places where this person has lived.
 */
///#end
///#begin en
/**
 *	@brief	A list of places where this person has lived.
 */
///#end
@property (nonatomic,readonly) NSArray *placesLived;

///#begin zh-cn
/**
 *	@brief	If "true", indicates that the person has installed the app that is making the request and
 *          has chosen to expose this install state to the caller.
 *          A value of "false" indicates that the install state cannot be determined
 *          (it is either not installed or the person has chosen to keep this information private).
 */
///#end
///#begin en
/**
 *	@brief	If "true", indicates that the person has installed the app that is making the request and
 *          has chosen to expose this install state to the caller.
 *          A value of "false" indicates that the install state cannot be determined
 *          (it is either not installed or the person has chosen to keep this information private).
 */
///#end
@property (nonatomic,readonly) BOOL hasApp;

///#begin zh-cn
/**
 *	@brief	The user's preferred language for rendering.
 */
///#end
///#begin en
/**
 *	@brief	The user's preferred language for rendering.
 */
///#end
@property (nonatomic,readonly) BOOL isPlusUser;

///#begin zh-cn
/**
 *	@brief	The user's preferred language for rendering.
 */
///#end
///#begin en
/**
 *	@brief	The user's preferred language for rendering.
 */
///#end
@property (nonatomic,readonly) NSString *language;

///#begin zh-cn
/**
 *	@brief	The age range of the person.
 */
///#end
///#begin en
/**
 *	@brief	The age range of the person.
 */
///#end
@property (nonatomic,readonly) SSGooglePlusAgeRangeReader *ageRange;

///#begin zh-cn
/**
 *	@brief	If a Google+ Page, the number of people who have +1'ed this page.
 */
///#end
///#begin en
/**
 *	@brief	If a Google+ Page, the number of people who have +1'ed this page.
 */
///#end
@property (nonatomic,readonly) NSInteger plusOneCount;

///#begin zh-cn
/**
 *	@brief	If a Google+ Page and for followers who are visible, the number of people who have added this page to a circle.
 */
///#end
///#begin en
/**
 *	@brief	If a Google+ Page and for followers who are visible, the number of people who have added this page to a circle.
 */
///#end
@property (nonatomic,readonly) NSInteger circledByCount;

///#begin zh-cn
/**
 *	@brief	Whether the person or Google+ Page has been verified.
 *          This is used only for pages with a higher risk of being impersonated or similar.
 *          This flag will not be present on most profiles.
 */
///#end
///#begin en
/**
 *	@brief	Whether the person or Google+ Page has been verified.
 *          This is used only for pages with a higher risk of being impersonated or similar.
 *          This flag will not be present on most profiles.
 */
///#end
@property (nonatomic,readonly) BOOL verified;

///#begin zh-cn
/**
 *	@brief	The cover photo content.
 */
///#end
///#begin en
/**
 *	@brief	The cover photo content.
 */
///#end
@property (nonatomic,readonly) SSGooglePlusCoverReader *cover;

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
 *	@return	Reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSGooglePlusUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
