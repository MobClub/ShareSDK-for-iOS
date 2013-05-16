//
//  VFErrorInfo.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICMErrorInfo.h"

/**
 *	@brief	异常信息
 */
@interface CMErrorInfo : NSObject <ICMErrorInfo>
{
@private
    NSInteger _errorCode;
    NSString *_errorDescription;
    CMErrorLevel _errorLevel;
}

/**
 *	@brief	错误代码，如果为调用API出错则应该参考API错误码对照表，如果为HTTP错误，此属性则指示HTTP错误码。
 */
@property (nonatomic) NSInteger errorCode;

/**
 *	@brief	错误描述，对应相应的错误码的描述
 */
@property (nonatomic,copy) NSString *errorDescription;

/**
 *	@brief	错误级别
 */
@property (nonatomic) CMErrorLevel errorLevel;


@end
