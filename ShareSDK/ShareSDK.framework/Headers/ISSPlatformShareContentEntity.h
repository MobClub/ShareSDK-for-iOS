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
 *	@brief	Share content entity protocol.Used to stored raw data for each platform sharing
 */
@protocol ISSPlatformShareContentEntity <NSObject>

@required

/**
 *	@brief	Get field value
 *
 *	@param 	name 	Field name
 *
 *	@return	Field value
 */
- (id)fieldForName:(NSString *)name;

/**
 *	@brief	Set field value.
 *
 *	@param 	field 	Field value
 *	@param 	name 	Field name
 */
- (void)setField:(id)field forName:(NSString *)name;

@end
