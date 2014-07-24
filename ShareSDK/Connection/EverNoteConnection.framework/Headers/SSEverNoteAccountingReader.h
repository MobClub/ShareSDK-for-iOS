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

///#begin zh-cn
/**
 *	@brief	簿记用户订阅信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Accounting reader.
 */
///#end
@interface SSEverNoteAccountingReader : NSObject
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
 *	@brief	The number of bytes that can be uploaded to the account in the current month.
 *          For new notes that are created, this is the length of the note content (in Unicode characters)
 *          plus the size of each resource (in bytes). For edited notes, this is the the difference between
 *          the old length and the new length (if this is greater than 0) plus the size of each new resource.
 */
///#end
///#begin en
/**
 *	@brief	The number of bytes that can be uploaded to the account in the current month.
 *          For new notes that are created, this is the length of the note content (in Unicode characters)
 *          plus the size of each resource (in bytes). For edited notes, this is the the difference between
 *          the old length and the new length (if this is greater than 0) plus the size of each new resource.
 */
///#end
@property (nonatomic,readonly) long long uploadLimit;

///#begin zh-cn
/**
 *	@brief	The date and time when the current upload limit expires. At this time,
 *          the monthly upload count reverts to 0 and a new limit is imposed.
 *          This date and time is exclusive, so this is effectively the start of the new month.
 */
///#end
///#begin en
/**
 *	@brief	The date and time when the current upload limit expires. At this time,
 *          the monthly upload count reverts to 0 and a new limit is imposed.
 *          This date and time is exclusive, so this is effectively the start of the new month.
 */
///#end
@property (nonatomic,readonly) long long uploadLimitEnd;

///#begin zh-cn
/**
 *	@brief	When uploadLimitEnd is reached, the service will change uploadLimit to uploadLimitNextMonth.
 *          If a premium account is canceled, this mechanism will reset the quota appropriately.
 */
///#end
///#begin en
/**
 *	@brief	When uploadLimitEnd is reached, the service will change uploadLimit to uploadLimitNextMonth.
 *          If a premium account is canceled, this mechanism will reset the quota appropriately.
 */
///#end
@property (nonatomic,readonly) long long uploadLimitNextMonth;

///#begin zh-cn
/**
 *	@brief	Indicates the phases of a premium account during the billing process.
 */
///#end
///#begin en
/**
 *	@brief	Indicates the phases of a premium account during the billing process.
 */
///#end
@property (nonatomic,readonly) SSEverNotePremiumOrderStatus premiumServiceStatus;

///#begin zh-cn
/**
 *	@brief	The order number used by the commerce system to process recurring payments
 */
///#end
///#begin en
/**
 *	@brief	The order number used by the commerce system to process recurring payments
 */
///#end
@property (nonatomic,readonly) NSString *premiumOrderNumber;

///#begin zh-cn
/**
 *	@brief	The commerce system used (paypal, Google checkout, etc)
 */
///#end
///#begin en
/**
 *	@brief	The commerce system used (paypal, Google checkout, etc)
 */
///#end
@property (nonatomic,readonly) NSString *premiumCommerceService;

///#begin zh-cn
/**
 *	@brief	The start date when this premium promotion began
 *          (this number will get overwritten if a premium service is canceled and then re-activated).
 */
///#end
///#begin en
/**
 *	@brief	The start date when this premium promotion began
 *          (this number will get overwritten if a premium service is canceled and then re-activated).
 */
///#end
@property (nonatomic,readonly) long long premiumServiceStart;

///#begin zh-cn
/**
 *	@brief	The code associated with the purchase eg.
 *          monthly or annual purchase. Clients should interpret this value and localize it.
 */
///#end
///#begin en
/**
 *	@brief	The code associated with the purchase eg.
 *          monthly or annual purchase. Clients should interpret this value and localize it.
 */
///#end
@property (nonatomic,readonly) NSString *premiumServiceSKU;

///#begin zh-cn
/**
 *	@brief	Date the last time the user was charged. Null if never charged.
 */
///#end
///#begin en
/**
 *	@brief	Date the last time the user was charged. Null if never charged.
 */
///#end
@property (nonatomic,readonly) long long lastSuccessfulCharge;

///#begin zh-cn
/**
 *	@brief	Date the last time a charge was attempted and failed.
 */
///#end
///#begin en
/**
 *	@brief	Date the last time a charge was attempted and failed.
 */
///#end
@property (nonatomic,readonly) long long lastFailedCharge;

///#begin zh-cn
/**
 *	@brief	Reason provided for the charge failure
 */
///#end
///#begin en
/**
 *	@brief	Reason provided for the charge failure
 */
///#end
@property (nonatomic,readonly) NSString *lastFailedChargeReason;

///#begin zh-cn
/**
 *	@brief	The end of the billing cycle. This could be in the past if there are failed charges.
 */
///#end
///#begin en
/**
 *	@brief	The end of the billing cycle. This could be in the past if there are failed charges.
 */
///#end
@property (nonatomic,readonly) long long nextPaymentDue;

///#begin zh-cn
/**
 *	@brief	An internal variable to manage locking operations on the commerce variables.
 */
///#end
///#begin en
/**
 *	@brief	An internal variable to manage locking operations on the commerce variables.
 */
///#end
@property (nonatomic,readonly) long long premiumLockUntil;

///#begin zh-cn
/**
 *	@brief	The date any modification where made to this record.
 */
///#end
///#begin en
/**
 *	@brief	The date any modification where made to this record.
 */
///#end
@property (nonatomic,readonly) long long updated;

///#begin zh-cn
/**
 *	@brief	The number number identifying the recurring subscription used to make the recurring charges.
 */
///#end
///#begin en
/**
 *	@brief	The number number identifying the recurring subscription used to make the recurring charges.
 */
///#end
@property (nonatomic,readonly) NSString *premiumSubscriptionNumber;

///#begin zh-cn
/**
 *	@brief	Date charge last attempted
 */
///#end
///#begin en
/**
 *	@brief	Date charge last attempted
 */
///#end
@property (nonatomic,readonly) long long lastRequestedCharge;

///#begin zh-cn
/**
 *	@brief	ISO 4217 currency code
 */
///#end
///#begin en
/**
 *	@brief	ISO 4217 currency code
 */
///#end
@property (nonatomic,readonly) NSString *currency;

///#begin zh-cn
/**
 *	@brief	charge in the smallest unit of the currency (e.g. cents for USD)
 */
///#end
///#begin en
/**
 *	@brief	charge in the smallest unit of the currency (e.g. cents for USD)
 */
///#end
@property (nonatomic,readonly) long unitPrice;

///#begin zh-cn
/**
 *	@brief	If set, the ID of the Evernote Business account that the user is a member of.
 *          If not set, the user is not a member of a business.
 */
///#end
///#begin en
/**
 *	@brief	If set, the ID of the Evernote Business account that the user is a member of.
 *          If not set, the user is not a member of a business.
 */
///#end
@property (nonatomic,readonly) long businessId;

///#begin zh-cn
/**
 *	@brief	The human-readable name of the Evernote Business account that the user is a member of.
 */
///#end
///#begin en
/**
 *	@brief	The human-readable name of the Evernote Business account that the user is a member of.
 */
///#end
@property (nonatomic,readonly) NSString *businessName;

///#begin zh-cn
/**
 *	@brief	If set, the role of the user within the Evernote Business account that they are a member of.
 */
///#end
///#begin en
/**
 *	@brief	If set, the role of the user within the Evernote Business account that they are a member of.
 */
///#end
@property (nonatomic,readonly) SSEverNoteBusinessUserRole businessRole;

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
 *	@brief	创建簿记用户订阅信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create an accounting reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNoteAccountingReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
