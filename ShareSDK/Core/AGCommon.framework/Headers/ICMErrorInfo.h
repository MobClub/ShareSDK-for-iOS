///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>

///#begin zh-cn
/**
 *	@brief	错误级别
 */
///#end
///#begin en
/**
 *	@brief	Error Level
 */
///#end
typedef enum
{
	CMErrorLevelAPI = 1, /**< API错误 */
	CMErrorLevelHTTP = 2, /**< HTTP错误 */
    CMErrorLevelNetwork = 3  /**< 网络错误 */
}
CMErrorLevel;

///#begin zh-cn
/**
 *	@brief	错误信息
 */
///#end
///#begin en
/**
 *	@brief	Error information
 */
///#end
@protocol ICMErrorInfo <NSObject>

///#begin zh-cn
/**
 *	@brief	获取错误代码，如果为调用API出错则应该参考API错误码对照表，如果为HTTP错误，此属性则指示HTTP错误码。
 *
 *	@return	错误代码
 */
///#end
///#begin en
/**
 *	@brief	Get error code，If it is you call the API, you should see the error code table, if it is an HTTP error, this attribute indicates the HTTP error code.
 *
 *	@return	Error code.
 */
///#end
- (NSInteger)errorCode;

///#begin zh-cn
/**
 *	@brief	获取错误描述，对应相应的错误码的描述
 *
 *	@return	错误描述
 */
///#end
///#begin en
/**
 *	@brief	Get error description
 *
 *	@return	Error description
 */
///#end
- (NSString *)errorDescription;

///#begin zh-cn
/**
 *	@brief	获取错误级别
 *
 *	@return	错误级别
 */
///#end
///#begin en
/**
 *	@brief	Get error level
 *
 *	@return	Error level.
 */
///#end
- (CMErrorLevel)errorLevel;

@end
