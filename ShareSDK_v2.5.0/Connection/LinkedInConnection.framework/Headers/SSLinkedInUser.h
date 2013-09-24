//
//  SSLinkedInUser.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import "SSLinkedInCredential.h"
#import "SSLinkedInApiStandardProfileRequest.h"
#import "SSLinkedInLocation.h"
#import "SSLinkedInPositions.h"
#import "SSLinkedInRelationToViewer.h"
#import "SSLinkedInSiteStandardProfileRequest.h"

/**
 *	@brief	用户信息
 */
@interface SSLinkedInUser : SSCDataObject
{
@private
    SSLinkedInCredential *_credential;
}

/**
 *	@brief	授权信息，如果为nil则表示非当前应用授权用户
 */
@property (nonatomic,retain) SSLinkedInCredential *credential;

/**
 *	@brief	a unique identifier token for this member
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	the member's first name
 */
@property (nonatomic,readonly) NSString *firstName;

/**
 *	@brief	the member's last name
 */
@property (nonatomic,readonly) NSString *lastName;

/**
 *	@brief	the member's maiden name
 */
@property (nonatomic,readonly) NSString *maidenName;

/**
 *	@brief	the member's name formatted based on language
 */
@property (nonatomic,readonly) NSString *formattedName;

/**
 *	@brief	the member's first name spelled phonetically
 */
@property (nonatomic,readonly) NSString *phoneticFirstName;

/**
 *	@brief	the member's last name spelled phonetically
 */
@property (nonatomic,readonly) NSString *phoneticLastName;

/**
 *	@brief	the member's name spelled phonetically and formatted based on language
 */
@property (nonatomic,readonly) NSString *formattedPhoneticName;

/**
 *	@brief	the member's headline (often "Job Title at Company")
 */
@property (nonatomic,readonly) NSString *headline;

/**
 *	@brief	the industry the LinkedIn member has indicated their profile belongs to (Industry Codes)
 */
@property (nonatomic,readonly) NSString *industry;

/**
 *	@brief	the degree distance of the fetched profile from the member who fetched the profile
 */
@property (nonatomic,readonly) NSInteger distance;

/**
 *	@brief	Overloaded to also return "current-status" (if there is no URL shared). (Status and share are the same.)
 */
@property (nonatomic,readonly) NSString *currentShare;

/**
 *	@brief	the # of connections the member has
 */
@property (nonatomic,readonly) NSInteger numConnections;

/**
 *	@brief	true if the value of num-connections has been capped at 500. false otherwise.
 */
@property (nonatomic,readonly) BOOL numConnectionsCapped;

/**
 *	@brief	A long-form text area where the member describes their professional profile
 */
@property (nonatomic,readonly) NSString *summary;

/**
 *	@brief	A short-form text area where the member enumerates their specialties
 */
@property (nonatomic,readonly) NSString *specialties;

/**
 *	@brief	A collection of positions a member has had, the total indicated by a total attribute
 */
@property (nonatomic,readonly) SSLinkedInPositions *positions;

/**
 *	@brief	A URL to the profile picture, if the member has associated one with their profile and it is visible to the requestor
 */
@property (nonatomic,readonly) NSString *pictureUrl;

/**
 *	@brief	The URL to the member's authenticated profile on LinkedIn (requires a login to be viewed, unlike public profiles)
 */
@property (nonatomic,readonly) SSLinkedInSiteStandardProfileRequest *siteStandardProfileRequest;

/**
 *	@brief	A URL to the member's public profile, if enabled
 */
@property (nonatomic,readonly) NSString *publicProfileUrl;

/**
 *	@brief	
 */
@property (nonatomic,readonly) SSLinkedInRelationToViewer *relationToViewer;


/**
 *	@brief	标准个人信息请求信息
 */
@property (nonatomic,readonly) SSLinkedInApiStandardProfileRequest *apiStandardProfileRequest;

/**
 *	@brief	位置信息
 */
@property (nonatomic,readonly) SSLinkedInLocation *location;


/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSLinkedInUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
