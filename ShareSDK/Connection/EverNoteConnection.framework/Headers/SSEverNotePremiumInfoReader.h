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

/**
 *	@brief	premium info
 */
@interface SSEverNotePremiumInfoReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	Raw data.
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The server-side date and time when this data was generated.
 */
@property (nonatomic,readonly) long long currentTime;

/**
 *	@brief	True if the user's account is Premium.
 */
@property (nonatomic,readonly) BOOL premium;

/**
 *	@brief	True if the user's account is Premium and has a recurring payment method.
 */
@property (nonatomic,readonly) BOOL premiumRecurring;

/**
 *	@brief	The date when the user's Premium account expires,
 *          or the date when the user's account will be charged if it has a recurring payment method.
 */
@property (nonatomic,readonly) long long premiumExpirationDate;

/**
 *	@brief	True if the user is eligible for purchasing Premium account extensions.
 */
@property (nonatomic,readonly) BOOL premiumExtendable;

/**
 *	@brief	True if the user's Premium account is pending payment confirmation
 */
@property (nonatomic,readonly) BOOL premiumPending;

/**
 *	@brief	True if the user has requested that no further charges to be made;
 *          the Premium account will remain active until it expires.
 */
@property (nonatomic,readonly) BOOL premiumCancellationPending;

/**
 *	@brief	True if the user is eligible for purchasing additional upload allowance.
 */
@property (nonatomic,readonly) BOOL canPurchaseUploadAllowance;

/**
 *	@brief	The name of the sponsored group that the user is part of.
 */
@property (nonatomic,readonly) NSString *sponsoredGroupName;

/**
 *	@brief	DEPRECATED - will be removed in a future update.
 */
@property (nonatomic,readonly) SSEverNoteSponsoredGroupRole sponsoredGroupRole;

/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	Create premium info reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
+ (SSEverNotePremiumInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
