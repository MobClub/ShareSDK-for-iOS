//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
#import "SSCommentTypeDef.h"

/**
 *	@brief	Comment information.
 */
@protocol ISSCComment <NSObject>

/**
 *	@brief	Get comment id.
 *
 *	@return	Comment id.
 */
- (NSString *)Id;

/**
 *	@brief	Get platform type.
 *
 *	@return	Platform type.
 */
- (ShareType)platType;

/**
 *	@brief	Get gender, 0 Male 1 Female 2 Unknown
 *
 *	@return	Gender.
 */
- (NSInteger)gender;

/**
 *	@brief	Get user nickname
 *
 *	@return	Nickname.
 */
- (NSString *)nickname;

/**
 *	@brief	Get comment icon.
 *
 *	@return	Comment icon.
 */
- (NSString *)icon;

/**
 *	@brief	Get verified type.
 *
 *	@return	Verified type.
 */
- (NSInteger)verifyType;

/**
 *	@brief	Get like count.
 *
 *	@return	Like count.
 */
- (NSInteger)likeCount;

/**
 *	@brief	Get Province / State
 *
 *	@return	Province / State
 */
- (NSString *)region;

/**
 *	@brief	Get comment content.
 *
 *	@return	Comment content.
 */
- (NSString *)content;

/**
 *	@brief	Get comment time.
 *
 *	@return	Comment time.
 */
- (NSTimeInterval)datetime;

/**
 *	@brief	Get a floor list.
 *
 *	@return	floor list.
 */
- (NSArray *)floors;

/**
 *	@brief	Gets whether liked flag.
 *
 *	@return	YES liked, NO represents yet liked
 */
- (BOOL)liked;

/**
 *	@brief	Get comment status.
 *
 *	@return	-2 Dismissed  -1 Spam 1 Audit by
 */
- (NSInteger)status;

@end
