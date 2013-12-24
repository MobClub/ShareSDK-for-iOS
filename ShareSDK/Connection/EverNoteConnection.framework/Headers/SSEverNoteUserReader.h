//
//  SSEverNoteUserReader.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSEverNoteTypeDef.h"
#import "SSEverNoteUserAttributesReader.h"
#import "SSEverNoteAccountingReader.h"
#import "SSEverNotePremiumInfoReader.h"

/**
 *	@brief	用户信息读取器
 */
@interface SSEverNoteUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;


/**
 *	@brief	用户ID
 *          he unique numeric identifier for the account, which will not change for the lifetime of the account.
 */
@property (nonatomic,readonly) NSInteger Id;

/**
 *	@brief	用户名称
 *          The name that uniquely identifies a single user account.
 *          This name may be presented by the user, along with their password, to log into their account.
 *          May only contain a-z, 0-9, or '-', and may not start or end with the '-'
 */
@property (nonatomic,readonly) NSString *username;

/**
 *	@brief	电子邮箱
 *          The email address registered for the user. Must comply with RFC 2821 and RFC 2822.
 *          For privacy reasons, this field may not be populated when a User is retrieved via a call to UserStore.getUser().
 */
@property (nonatomic,readonly) NSString *email;

/**
 *	@brief	名称
 *          The printable name of the user, which may be a combination of given and family names.
 *          This is used instead of separate "first" and "last" names due to variations in international name format/order.
 *          May not start or end with a whitespace character.
 *          May contain any character but carriage return or newline (Unicode classes Zl and Zp).
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	时区
 *          The zone ID for the user's default location. If present,
 *          this may be used to localize the display of any timestamp for which no other timezone is available.
 *          The format must be encoded as a standard zone ID such as "America/Los_Angeles" or "GMT+08:00"
 *
 */
@property (nonatomic,readonly) NSString *timezone;


/**
 *	@brief	权限
 *          The level of access permitted for the user.
 */
@property (nonatomic,readonly) SSEverNotePrivilegeLevel privilege;

/**
 *	@brief	创建时间
 *          The date and time when this user account was created in the service.
 */
@property (nonatomic,readonly) long long created;

/**
 *	@brief	最近一次修改时间
 *          The date and time when this user account was last modified in the service.
 */
@property (nonatomic,readonly) long long updated;

/**
 *	@brief	删除时间
 *          If the account has been deleted from the system (e.g. as the result of a legal request by the user),
 *          the date and time of the deletion will be represented here. If not, this value will not be set.
 */
@property (nonatomic,readonly) long long deleted;

/**
 *	@brief	是否有效
 *          If the user account is available for login and synchronization, this flag will be set to true.
 */
@property (nonatomic,readonly) BOOL active;

/**
 *	@brief	此字段已过时
 */
@property (nonatomic,readonly) NSString *shardId;

/**
 *	@brief	用户属性对象
 *          If present, this will contain a list of the attributes for this user account.
 */
@property (nonatomic,readonly) SSEverNoteUserAttributesReader *attributes;

/**
 *	@brief	簿记用户的订阅信息
 *          Bookkeeping information for the user's subscription.
 */
@property (nonatomic,readonly) SSEverNoteAccountingReader *accounting;

/**
 *	@brief	地价信息
 *          If present, this will contain a set of commerce information relating to the user's premium service level.
 */
@property (nonatomic,readonly) SSEverNotePremiumInfoReader *premiumInfo;

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
+ (SSEverNoteUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
