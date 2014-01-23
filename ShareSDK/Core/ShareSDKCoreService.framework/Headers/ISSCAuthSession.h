//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SSCTypeDef.h"

/**
 *	@brief	Authorized session.
 */
@protocol ISSCAuthSession <NSObject>

/**
 *	@brief	Start session.
 *
 *  @param  scopes  Scopes list, Incoming nil is the default authorization permissions
 *	@param 	result 	Result handler.
 */
- (void)start:(NSArray *)scopes result:(SSCAuthSessionResultEvent)result;

/**
 *	@brief	Cancel session.
 */
- (void)cancel;

/**
 *	@brief	Get authorize view.
 *
 *	@return	Authorize view.
 */
- (UIView *)view;

@end
