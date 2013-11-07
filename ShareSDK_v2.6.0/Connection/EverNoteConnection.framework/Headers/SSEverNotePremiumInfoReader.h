//
//  SSEverNotePremiumInfoReader.h
//  EverNoteConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 vimfung. All rights reserved.
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
 *	@brief	源数据
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
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建premium信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSEverNotePremiumInfoReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
