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
 *	@brief	User information reader.
 */
@interface SSDouBanUserReader : NSObject
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
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	User id.
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	Nickname
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Avatar
 */
@property (nonatomic,readonly) NSString *avatar;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *alt;

/**
 *	@brief	Registration Time
 */
@property (nonatomic,readonly) NSString *created;

/**
 *	@brief	City id.
 */
@property (nonatomic,readonly) NSString *locId;

/**
 *	@brief	The full name of the location
 */
@property (nonatomic,readonly) NSString *locName;

/**
 *	@brief	Description
 */
@property (nonatomic,readonly) NSString *desc;

/**
 *	@brief	Large avatar.
 */
@property (nonatomic,readonly) NSString *largeAvatar;

/**
 *	@brief	Small avatar.
 */
@property (nonatomic,readonly) NSString *smallAvatar;

/**
 *	@brief	Screen name
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	Type
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	None
 */
@property (nonatomic,readonly) NSString *signature;

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
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
+ (SSDouBanUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
