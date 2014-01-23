//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSEverNoteTypeDef.h"
#import "SSEverNoteUserAttributesReader.h"
#import "SSEverNoteAccountingReader.h"
#import "SSEverNotePremiumInfoReader.h"

/**
 *	@brief	User information reader.
 */
@interface SSEverNoteUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	he unique numeric identifier for the account, which will not change for the lifetime of the account.
 */
@property (nonatomic,readonly) NSInteger Id;

/**
 *	@brief	The name that uniquely identifies a single user account.
 *          This name may be presented by the user, along with their password, to log into their account.
 *          May only contain a-z, 0-9, or '-', and may not start or end with the '-'
 */
@property (nonatomic,readonly) NSString *username;

/**
 *	@brief	The email address registered for the user. Must comply with RFC 2821 and RFC 2822.
 *          For privacy reasons, this field may not be populated when a User is retrieved via a call to UserStore.getUser().
 */
@property (nonatomic,readonly) NSString *email;

/**
 *	@brief	The printable name of the user, which may be a combination of given and family names.
 *          This is used instead of separate "first" and "last" names due to variations in international name format/order.
 *          May not start or end with a whitespace character.
 *          May contain any character but carriage return or newline (Unicode classes Zl and Zp).
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	The zone ID for the user's default location. If present,
 *          this may be used to localize the display of any timestamp for which no other timezone is available.
 *          The format must be encoded as a standard zone ID such as "America/Los_Angeles" or "GMT+08:00"
 *
 */
@property (nonatomic,readonly) NSString *timezone;

/**
 *	@brief	The level of access permitted for the user.
 */
@property (nonatomic,readonly) SSEverNotePrivilegeLevel privilege;

/**
 *	@brief	The date and time when this user account was created in the service.
 */
@property (nonatomic,readonly) long long created;

/**
 *	@brief	The date and time when this user account was last modified in the service.
 */
@property (nonatomic,readonly) long long updated;

/**
 *	@brief	If the account has been deleted from the system (e.g. as the result of a legal request by the user),
 *          the date and time of the deletion will be represented here. If not, this value will not be set.
 */
@property (nonatomic,readonly) long long deleted;

/**
 *	@brief	If the user account is available for login and synchronization, this flag will be set to true.
 */
@property (nonatomic,readonly) BOOL active;

/**
 *	@brief	This field is deprecated
 */
@property (nonatomic,readonly) NSString *shardId;

/**
 *	@brief	If present, this will contain a list of the attributes for this user account.
 */
@property (nonatomic,readonly) SSEverNoteUserAttributesReader *attributes;

/**
 *	@brief	Bookkeeping information for the user's subscription.
 */
@property (nonatomic,readonly) SSEverNoteAccountingReader *accounting;

/**
 *	@brief	If present, this will contain a set of commerce information relating to the user's premium service level.
 */
@property (nonatomic,readonly) SSEverNotePremiumInfoReader *premiumInfo;

/**
 *	@brief	Initialize Reader
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create a user reader.
 *
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
+ (SSEverNoteUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
