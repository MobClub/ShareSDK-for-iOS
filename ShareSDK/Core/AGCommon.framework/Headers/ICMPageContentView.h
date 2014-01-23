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
 *	@brief	Page content view protocol，Implement this protocol can be used as page content view.
 */
@protocol ICMPageContentView <NSObject>

@required

/**
 *	@brief	Get reuse identifier.
 *
 *	@return	Reuse identifier.
 */
- (NSString *)reuseIdentifier;

/**
 *	@brief	Initialize page content view.
 *
 *	@param 	reuseIdentifier 	Reuse identifier
 *  @param  frame   Display rect.
 *
 *	@return	Page content view object.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame;

@end

