//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ICMErrorInfo.h"

/**
 *	@brief	Error information.
 */
@interface CMErrorInfo : NSObject <ICMErrorInfo>
{
@private
    NSInteger _errorCode;
    NSString *_errorDescription;
    CMErrorLevel _errorLevel;
}

/**
 *	@brief	Error code，If it is you call the API, you should see the error code table, if it is an HTTP error, this attribute indicates the HTTP error code.
 */
@property (nonatomic) NSInteger errorCode;

/**
 *	@brief	Error description
 */
@property (nonatomic,copy) NSString *errorDescription;

/**
 *	@brief	Error level.
 */
@property (nonatomic) CMErrorLevel errorLevel;


@end
