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
 *	@brief	premium info
 */
///#end
///#begin en
/**
 *	@brief	premium info
 */
///#end
@interface SSEverNotePremiumInfoReader : NSObject
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
 *	@brief	The server-side date and time when this data was generated.
 */
///#end
///#begin en
/**
 *	@brief	The server-side date and time when this data was generated.
 */
///#end
@property (nonatomic,readonly) long long currentTime;

///#begin zh-cn
/**
 *	@brief	True if the user's account is Premium.
 */
///#end
///#begin en
/**
 *	@brief	True if the user's account is Premium.
 */
///#end
@property (nonatomic,readonly) BOOL premium;

///#begin zh-cn
/**
 *	@brief	True if the user's account is Premium and has a recurring payment method.
 */
///#end
///#begin en
/**
 *	@brief	True if the user's account is Premium and has a recurring payment method.
 */
///#end
@property (nonatomic,readonly) BOOL premiumRecurring;

///#begin zh-cn
/**
 *	@brief	The date when the user's Premium account expires,
 *          or the date when the user's account will be charged if it has a recurring payment method.
 */
///#end
///#begin en
/**
 *	@brief	The date when the user's Premium account expires,
 *          or the date when the user's account will be charged if it has a recurring payment method.
 */
///#end
@property (nonatomic,readonly) long long premiumExpirationDate;

///#begin zh-cn
/**
 *	@brief	True if the user is eligible for purchasing Premium account extensions.
 */
///#end
///#begin en
/**
 *	@brief	True if the user is eligible for purchasing Premium account extensions.
 */
///#end
@property (nonatomic,readonly) BOOL premiumExtendable;

///#begin zh-cn
/**
 *	@brief	True if the user's Premium account is pending payment confirmation
 */
///#end
///#begin en
/**
 *	@brief	True if the user's Premium account is pending payment confirmation
 */
///#end
@property (nonatomic,readonly) BOOL premiumPending;

///#begin zh-cn
/**
 *	@brief	True if the user has requested that no further charges to be made;
 *          the Premium account will remain active until it expires.
 */
///#end
///#begin en
/**
 *	@brief	True if the user has requested that no further charges to be made;
 *          the Premium account will remain active until it expires.
 */
///#end
@property (nonatomic,readonly) BOOL premiumCancellationPending;

///#begin zh-cn
/**
 *	@brief	True if the user is eligible for purchasing additional upload allowance.
 */
///#end
///#begin en
/**
 *	@brief	True if the user is eligible for purchasing additional upload allowance.
 */
///#end
@property (nonatomic,readonly) BOOL canPurchaseUploadAllowance;

///#begin zh-cn
/**
 *	@brief	The name of the sponsored group that the user is part of.
 */
///#end
///#begin en
/**
 *	@brief	The name of the sponsored group that the user is part of.
 */
///#end
@property (nonatomic,readonly) NSString *sponsoredGroupName;

///#begin zh-cn
/**
 *	@brief	DEPRECATED - will be removed in a future update.
 */
///#end
///#begin en
/**
 *	@brief	DEPRECATED - will be removed in a future update.
 */
///#end
@property (nonatomic,readonly) SSEverNoteSponsoredGroupRole sponsoredGroupRole;

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
 *	@brief	创建premium信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create premium info reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSEverNotePremiumInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
