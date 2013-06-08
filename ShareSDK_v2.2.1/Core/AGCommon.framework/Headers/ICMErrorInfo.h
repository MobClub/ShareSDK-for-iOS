//
//  ICMErrorInfo.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	错误级别
 */
typedef enum
{
	CMErrorLevelAPI = 1, /**< API错误 */
	CMErrorLevelHTTP = 2, /**< HTTP错误 */
    CMErrorLevelNetwork = 3  /**< 网络错误 */
}
CMErrorLevel;


/**
 *	@brief	错误信息
 */
@protocol ICMErrorInfo <NSObject>


/**
 *	@brief	错误代码，如果为调用API出错则应该参考API错误码对照表，如果为HTTP错误，此属性则指示HTTP错误码。
 *
 *	@return	错误代码
 */
- (NSInteger)errorCode;

/**
 *	@brief	错误描述，对应相应的错误码的描述
 *
 *	@return	错误描述
 */
- (NSString *)errorDescription;

/**
 *	@brief	错误类型
 *
 *	@return	错误类型
 */
- (CMErrorLevel)errorLevel;

@end
