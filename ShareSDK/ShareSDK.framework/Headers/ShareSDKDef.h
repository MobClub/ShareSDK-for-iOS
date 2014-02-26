//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "SSInheritValue.h"

#ifndef ShareSDKInterface_ShareSDKDef_h
#define ShareSDKInterface_ShareSDKDef_h

/**
 *	@brief	The ShareType convert NSNumber type
 *
 *	@param 	type 	Platform type.
 */
#define SHARE_TYPE_NUMBER(type) [NSNumber numberWithInteger:type]

/**
 *	@brief	Inherit value object.
 */
#define INHERIT_VALUE [SSInheritValue inherit]

/**
 *	@brief	Mapping a share content object Property values
 *
 *	@param 	name 	Property name.
 */
#define MAPPING_VALUE(name) [SSInheritValue inheritWithName:name]

/**
 *	@brief	Get Coins Notification.
 */
#define SS_AWARD_NOTIF_GET_COINS @"get_coins"

/**
 *	@brief	Buy item notification
 */
#define SS_AWARD_NOTIF_BUY_ITEM @"buy_item"

/**
 *	@brief	Coins Key
 */
#define SS_AWARD_KEY_COINS @"coins"

/**
 *	@brief	Action Key
 */
#define SS_AWARD_KEY_ACTION @"action"


#endif
