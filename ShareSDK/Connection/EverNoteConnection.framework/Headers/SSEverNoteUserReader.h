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
#import "SSEverNoteTypeDef.h"
#import "SSEverNoteUserAttributesReader.h"
#import "SSEverNoteAccountingReader.h"
#import "SSEverNotePremiumInfoReader.h"

///#begin zh-cn
/**
 *	@brief	用户信息读取器
 */
///#end
///#begin en
/**
 *	@brief	User information reader.
 */
///#end
@interface SSEverNoteUserReader : NSObject
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
 *	@brief	用户ID
 */
///#end
///#begin en
/**
 *	@brief	he unique numeric identifier for the account, which will not change for the lifetime of the account.
 */
///#end
@property (nonatomic,readonly) NSInteger Id;

///#begin zh-cn
/**
 *	@brief	用户名称
 */
///#end
///#begin en
/**
 *	@brief	The name that uniquely identifies a single user account.
 *          This name may be presented by the user, along with their password, to log into their account.
 *          May only contain a-z, 0-9, or '-', and may not start or end with the '-'
 */
///#end
@property (nonatomic,readonly) NSString *username;

///#begin zh-cn
/**
 *	@brief	电子邮箱
 */
///#end
///#begin en
/**
 *	@brief	The email address registered for the user. Must comply with RFC 2821 and RFC 2822.
 *          For privacy reasons, this field may not be populated when a User is retrieved via a call to UserStore.getUser().
 */
///#end
@property (nonatomic,readonly) NSString *email;

///#begin zh-cn
/**
 *	@brief	名称
 */
///#end
///#begin en
/**
 *	@brief	The printable name of the user, which may be a combination of given and family names.
 *          This is used instead of separate "first" and "last" names due to variations in international name format/order.
 *          May not start or end with a whitespace character.
 *          May contain any character but carriage return or newline (Unicode classes Zl and Zp).
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	时区
 *
 */
///#end
///#begin en
/**
 *	@brief	The zone ID for the user's default location. If present,
 *          this may be used to localize the display of any timestamp for which no other timezone is available.
 *          The format must be encoded as a standard zone ID such as "America/Los_Angeles" or "GMT+08:00"
 *
 */
///#end
@property (nonatomic,readonly) NSString *timezone;

///#begin zh-cn
/**
 *	@brief	权限
 */
///#end
///#begin en
/**
 *	@brief	The level of access permitted for the user.
 */
///#end
@property (nonatomic,readonly) SSEverNotePrivilegeLevel privilege;

///#begin zh-cn
/**
 *	@brief	创建时间
 */
///#end
///#begin en
/**
 *	@brief	The date and time when this user account was created in the service.
 */
///#end
@property (nonatomic,readonly) long long created;

///#begin zh-cn
/**
 *	@brief	最近一次修改时间
 */
///#end
///#begin en
/**
 *	@brief	The date and time when this user account was last modified in the service.
 */
///#end
@property (nonatomic,readonly) long long updated;

///#begin zh-cn
/**
 *	@brief	删除时间
 */
///#end
///#begin en
/**
 *	@brief	If the account has been deleted from the system (e.g. as the result of a legal request by the user),
 *          the date and time of the deletion will be represented here. If not, this value will not be set.
 */
///#end
@property (nonatomic,readonly) long long deleted;

///#begin zh-cn
/**
 *	@brief	是否有效
 */
///#end
///#begin en
/**
 *	@brief	If the user account is available for login and synchronization, this flag will be set to true.
 */
///#end
@property (nonatomic,readonly) BOOL active;

///#begin zh-cn
/**
 *	@brief	此字段已过时
 */
///#end
///#begin en
/**
 *	@brief	This field is deprecated
 */
///#end
@property (nonatomic,readonly) NSString *shardId;

///#begin zh-cn
/**
 *	@brief	用户属性对象
 */
///#end
///#begin en
/**
 *	@brief	If present, this will contain a list of the attributes for this user account.
 */
///#end
@property (nonatomic,readonly) SSEverNoteUserAttributesReader *attributes;

///#begin zh-cn
/**
 *	@brief	簿记用户的订阅信息
 */
///#end
///#begin en
/**
 *	@brief	Bookkeeping information for the user's subscription.
 */
///#end
@property (nonatomic,readonly) SSEverNoteAccountingReader *accounting;

///#begin zh-cn
/**
 *	@brief	地价信息
 */
///#end
///#begin en
/**
 *	@brief	If present, this will contain a set of commerce information relating to the user's premium service level.
 */
///#end
@property (nonatomic,readonly) SSEverNotePremiumInfoReader *premiumInfo;

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
 *	@brief	Initialize Reader
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
 *	@param 	sourceData 	Raw data
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNoteUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
