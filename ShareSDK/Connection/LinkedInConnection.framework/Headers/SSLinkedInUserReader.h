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
#import "SSLinkedInPositionsReader.h"
#import "SSLinkedInSiteStandardProfileRequestReader.h"
#import "SSLinkedInRelationToViewerReader.h"
#import "SSLinkedInApiStandardProfileRequestReader.h"
#import "SSLinkedInLocationReader.h"

///#begin zh-cn
/**
 *	@brief	用户信息读取器
 */
///#end
///#begin en
/**
 *	@brief	User Reader.
 */
///#end
@interface SSLinkedInUserReader : NSObject
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
 *	@brief	a unique identifier token for this member
 */
///#end
///#begin en
/**
 *	@brief	a unique identifier token for this member
 */
///#end
@property (nonatomic,readonly) NSString *uid;

///#begin zh-cn
/**
 *	@brief	the member's first name
 */
///#end
///#begin en
/**
 *	@brief	the member's first name
 */
///#end
@property (nonatomic,readonly) NSString *firstName;

///#begin zh-cn
/**
 *	@brief	the member's last name
 */
///#end
///#begin en
/**
 *	@brief	the member's last name
 */
///#end
@property (nonatomic,readonly) NSString *lastName;

///#begin zh-cn
/**
 *	@brief	the member's maiden name
 */
///#end
///#begin en
/**
 *	@brief	the member's maiden name
 */
///#end
@property (nonatomic,readonly) NSString *maidenName;

///#begin zh-cn
/**
 *	@brief	the member's name formatted based on language
 */
///#end
///#begin en
/**
 *	@brief	the member's name formatted based on language
 */
///#end
@property (nonatomic,readonly) NSString *formattedName;

///#begin zh-cn
/**
 *	@brief	the member's first name spelled phonetically
 */
///#end
///#begin en
/**
 *	@brief	the member's first name spelled phonetically
 */
///#end
@property (nonatomic,readonly) NSString *phoneticFirstName;

///#begin zh-cn
/**
 *	@brief	the member's last name spelled phonetically
 */
///#end
///#begin en
/**
 *	@brief	the member's last name spelled phonetically
 */
///#end
@property (nonatomic,readonly) NSString *phoneticLastName;

///#begin zh-cn
/**
 *	@brief	the member's name spelled phonetically and formatted based on language
 */
///#end
///#begin en
/**
 *	@brief	the member's name spelled phonetically and formatted based on language
 */
///#end
@property (nonatomic,readonly) NSString *formattedPhoneticName;

///#begin zh-cn
/**
 *	@brief	the member's headline (often "Job Title at Company")
 */
///#end
///#begin en
/**
 *	@brief	the member's headline (often "Job Title at Company")
 */
///#end
@property (nonatomic,readonly) NSString *headline;

///#begin zh-cn
/**
 *	@brief	the industry the LinkedIn member has indicated their profile belongs to (Industry Codes)
 */
///#end
///#begin en
/**
 *	@brief	the industry the LinkedIn member has indicated their profile belongs to (Industry Codes)
 */
///#end
@property (nonatomic,readonly) NSString *industry;

///#begin zh-cn
/**
 *	@brief	the degree distance of the fetched profile from the member who fetched the profile
 */
///#end
///#begin en
/**
 *	@brief	the degree distance of the fetched profile from the member who fetched the profile
 */
///#end
@property (nonatomic,readonly) NSInteger distance;

///#begin zh-cn
/**
 *	@brief	Overloaded to also return "current-status" (if there is no URL shared). (Status and share are the same.)
 */
///#end
///#begin en
/**
 *	@brief	Overloaded to also return "current-status" (if there is no URL shared). (Status and share are the same.)
 */
///#end
@property (nonatomic,readonly) NSString *currentShare;

///#begin zh-cn
/**
 *	@brief	the # of connections the member has
 */
///#end
///#begin en
/**
 *	@brief	the # of connections the member has
 */
///#end
@property (nonatomic,readonly) NSInteger numConnections;

///#begin zh-cn
/**
 *	@brief	true if the value of num-connections has been capped at 500. false otherwise.
 */
///#end
///#begin en
/**
 *	@brief	true if the value of num-connections has been capped at 500. false otherwise.
 */
///#end
@property (nonatomic,readonly) BOOL numConnectionsCapped;

///#begin zh-cn
/**
 *	@brief	A long-form text area where the member describes their professional profile
 */
///#end
///#begin en
/**
 *	@brief	A long-form text area where the member describes their professional profile
 */
///#end
@property (nonatomic,readonly) NSString *summary;

///#begin zh-cn
/**
 *	@brief	A short-form text area where the member enumerates their specialties
 */
///#end
///#begin en
/**
 *	@brief	A short-form text area where the member enumerates their specialties
 */
///#end
@property (nonatomic,readonly) NSString *specialties;

///#begin zh-cn
/**
 *	@brief	A collection of positions a member has had, the total indicated by a total attribute
 */
///#end
///#begin en
/**
 *	@brief	A collection of positions a member has had, the total indicated by a total attribute
 */
///#end
@property (nonatomic,readonly) SSLinkedInPositionsReader *positions;

///#begin zh-cn
/**
 *	@brief	A URL to the profile picture, if the member has associated one with their profile and it is visible to the requestor
 */
///#end
///#begin en
/**
 *	@brief	A URL to the profile picture, if the member has associated one with their profile and it is visible to the requestor
 */
///#end
@property (nonatomic,readonly) NSString *pictureUrl;

///#begin zh-cn
/**
 *	@brief	The URL to the member's authenticated profile on LinkedIn (requires a login to be viewed, unlike public profiles)
 */
///#end
///#begin en
/**
 *	@brief	The URL to the member's authenticated profile on LinkedIn (requires a login to be viewed, unlike public profiles)
 */
///#end
@property (nonatomic,readonly) SSLinkedInSiteStandardProfileRequestReader *siteStandardProfileRequest;

///#begin zh-cn
/**
 *	@brief	A URL to the member's public profile, if enabled
 */
///#end
///#begin en
/**
 *	@brief	A URL to the member's public profile, if enabled
 */
///#end
@property (nonatomic,readonly) NSString *publicProfileUrl;

///#begin zh-cn
/**
 *	@brief None.
 */
///#end
///#begin en
/**
 *	@brief None.
 */
///#end
@property (nonatomic,readonly) SSLinkedInRelationToViewerReader *relationToViewer;

///#begin zh-cn
/**
 *	@brief	标准个人信息请求信息
 */
///#end
///#begin en
/**
 *	@brief	API Standard Profile Request Reader.
 */
///#end
@property (nonatomic,readonly) SSLinkedInApiStandardProfileRequestReader *apiStandardProfileRequest;

///#begin zh-cn
/**
 *	@brief	位置信息
 */
///#end
///#begin en
/**
 *	@brief	Location reader.
 */
///#end
@property (nonatomic,readonly) SSLinkedInLocationReader *location;

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
+ (SSLinkedInUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
