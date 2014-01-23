//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSCTypeDef.h"

/**
 *	@brief	User descriptor.
 */
@protocol ISSCUserDescriptor <NSObject>

@required

/**
 *	@brief	Get user id.
 *
 *	@return	User id.
 */
- (NSString *)uid;

/**
 *	@brief	Get nickname.
 *
 *	@return	Nickname.
 */
- (NSString *)nickname;

/**
 *	@brief	Get avatar path.
 *
 *	@return	Avatar path.
 */
- (NSString *)icon;

/**
 *	@brief	Get gender，0 Male； 1 Female； 2 Unknown.
 *
 *	@return	Gender.
 */
- (NSInteger)gender;

/**
 *	@brief	Get personal homepage.
 *
 *	@return	Personal homepage.
 */
- (NSString *)url;

/**
 *	@brief	Get profile.
 *
 *	@return Profile.
 */
- (NSString *)aboutMe;

/**
 *	@brief	Get verify type：－1 Unknown； 0 Not certified. 1 certification.
 *
 *	@return	Verify type.
 */
- (NSInteger)verifyType;

/**
 *	@brief	Get verify reason.
 *
 *	@return	Verify reason.
 */
- (NSString *)verifyReason;

/**
 *	@brief	Get Birthday.
 *
 *	@return	Birthday.
 */
- (NSString *)birthday;

/**
 *	@brief	Get fans count.
 *
 *	@return	Fans count.
 */
- (NSInteger)followerCount;

/**
 *	@brief	Get friends count.
 *
 *	@return	Friends count.
 */
- (NSInteger)friendCount;

/**
 *	@brief	Get share count.
 *
 *	@return	Share count.
 */
- (NSInteger)shareCount;

/**
 *	@brief	Get Registered time.
 *
 *	@return	Registered time（unit: seconds）
 */
- (NSTimeInterval)regAt;

/**
 *	@brief	Get user level.
 *
 *	@return	User level.
 */
- (NSInteger)level;

/**
 *	@brief	Get education information
 *
 *	@return	Education information.
 */
- (NSArray *)educations;

/**
 *	@brief	Get career information
 *
 *	@return	Career information.
 */
- (NSArray *)works;

/**
 *	@brief	Get platform type.
 *
 *  @since  ver1.2.4
 *
 *	@return	Platform type.
 */
- (SSCShareType)type;

/**
 *	@brief	Get user information in the platform, the user can refer to each platform structure defined connector
 *
 *	@return	User information.
 */
- (id)localUser;

/**
 *	@brief	Get user information data sources, this property based on the user information structure made ​​of different platforms are not the same, please refer to the official detailed API documentation describes.
 *
 *	@return	Raw data.
 */
- (NSDictionary *)sourceData;

@end
