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
 *	@brief	Name Reader.
 */
@interface SSGooglePlusNameReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The full name of this person, including middle names, suffixes, etc.
 */
@property (nonatomic,readonly) NSString *formatted;

/**
 *	@brief	The family name (last name) of this person.
 */
@property (nonatomic,readonly) NSString *familyName;

/**
 *	@brief	The given name (first name) of this person.
 */
@property (nonatomic,readonly) NSString *givenName;

/**
 *	@brief	The middle name of this person.
 */
@property (nonatomic,readonly) NSString *middleName;

/**
 *	@brief	The honorific prefixes (such as "Dr." or "Mrs.") for this person.
 */
@property (nonatomic,readonly) NSString *honorificPrefix;

/**
 *	@brief	The honorific suffixes (such as "Jr.") for this person.
 */
@property (nonatomic,readonly) NSString *honorificSuffix;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a name reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSGooglePlusNameReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
