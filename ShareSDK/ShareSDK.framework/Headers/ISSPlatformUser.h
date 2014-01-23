//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ShareSDKTypeDef.h"

@protocol ISSPlatformApp;
@protocol ISSPlatformCredential;

/**
 *	@brief	User protocol
 */
@protocol ISSPlatformUser <NSObject>

@required

/**
 *	@brief	Get an app.
 *
 *	@return	app object.
 */
- (id<ISSPlatformApp>)app;

/**
 *	@brief	Get credential.
 *
 *	@return	Credential object.
 */
- (id<ISSPlatformCredential>)credential;

/**
 *	@brief	Set credential.
 *
 *	@param 	credential 	Credential object.
 */
- (void)setCredential:(id<ISSPlatformCredential>)credential;

/**
 *	@brief	Get user's raw data, define the structure consistent with the platform
 *
 *	@return	Raw data dicationary.
 */
- (NSDictionary *)sourceData;

/**
 *	@brief	Set user's raw data.
 *
 *	@param 	sourceData 	Raw data.
 */
- (void)setSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Get platform type.
 *
 *	@return	Platform type. please see ShareType.
 */
- (ShareType)type;

/**
 *	@brief	Get user id.
 *
 *	@return	User id.
 */
- (NSString *)uid;

/**
 *	@brief	Get user nickname.
 *
 *	@return	User nickname
 */
- (NSString *)nickname;

/**
 *	@brief	Get User profile image.
 *
 *	@return	User profile image url.
 */
- (NSString *)profileImage;

/**
 *	@brief	Get gender
 *
 *	@return	Gender：0 Male； 1 Female； 2 Unknown
 */
- (NSInteger)gender;

/**
 *	@brief	Get user's personal homepage
 *
 *	@return	Personal homepage
 */
- (NSString *)url;

/**
 *	@brief	Get User Profile
 *
 *	@return	User Profile
 */
- (NSString *)aboutMe;

/**
 *	@brief	Get user verify type.
 *
 *	@return	Verfify type：－1 Unknown； 0 Not Authenticate； 1 Authenticate。
 */
- (NSInteger)verifyType;

/**
 *	@brief	Get user verify reason.
 *
 *	@return	Verify reason.
 */
- (NSString *)verifyReason;

/**
 *	@brief	Get users birthday (unit: seconds)
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
 *	@brief	Get the user's registration time (unit: seconds)
 *
 *	@return	Registration time
 */
- (NSTimeInterval)regAt;

/**
 *	@brief	Get user level
 *
 *	@return	Level
 */
- (NSInteger)level;

/**
 *	@brief	Get a list of user education information
 *
 *	@return	Education List
 */
- (NSArray *)educations;

/**
 *	@brief	Get a list of the user's occupation information
 *
 *	@return	Occupation List
 */
- (NSArray *)works;

@end
