//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Share info protocol
 */
@protocol ISSPlatformShareInfo <NSObject>

@required

/**
 *	@brief	Get sharing raw data, define the structure consistent with the platform
 *
 *	@return	Raw data dicationary.
 */
- (NSDictionary *)sourceData;

/**
 *	@brief	Get share info id.
 *
 *	@return	Share info id.
 */
- (NSString *)sid;

/**
 *	@brief	Get share content.
 *
 *	@return	Content string.
 */
- (NSString *)text;

/**
 *	@brief	Get a list of url.
 *
 *	@return	urls list array.
 */
- (NSArray *)urls;

/**
 *	@brief	Get a list of image
 *
 *	@return	Images list array.
 */
- (NSArray *)imgs;

/**
 *	@brief	Get extended Information.
 *
 *	@return	Extended Information
 */
- (NSDictionary *)extInfo;

@end
