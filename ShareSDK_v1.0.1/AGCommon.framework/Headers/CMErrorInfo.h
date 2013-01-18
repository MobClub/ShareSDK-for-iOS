//
//  VFErrorInfo.h
//  AppgoFramework
//
//  Created by 冯 鸿杰 on 12-12-27.
//  Copyright (c) 2012年 掌淘科技. All rights reserved.
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
