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
 *	@brief	Error Level
 */
typedef enum
{
	CMErrorLevelAPI = 1, /**< API错误 */
	CMErrorLevelHTTP = 2, /**< HTTP错误 */
    CMErrorLevelNetwork = 3  /**< 网络错误 */
}
CMErrorLevel;

/**
 *	@brief	Error information
 */
@protocol ICMErrorInfo <NSObject>

/**
 *	@brief	Get error code，If it is you call the API, you should see the error code table, if it is an HTTP error, this attribute indicates the HTTP error code.
 *
 *	@return	Error code.
 */
- (NSInteger)errorCode;

/**
 *	@brief	Get error description
 *
 *	@return	Error description
 */
- (NSString *)errorDescription;

/**
 *	@brief	Get error level
 *
 *	@return	Error level.
 */
- (CMErrorLevel)errorLevel;

@end
