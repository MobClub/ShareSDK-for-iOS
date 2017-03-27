//
//  MOBFErrorMsg.h
//  MOBFoundation
//
//  Created by 刘 靖煌 on 15/5/26.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBFErrorReportTypeDef.h"

@interface MOBFErrorMsg : NSObject

/**
 *  异常类型：1、Crash；2、SDKErr；3、AppErr。
 */
@property (nonatomic, assign) MOBFErrorMsgType type;

/**
 *  错误码：SDK对于可预知异常的错误码定义
 */
@property (nonatomic, copy) NSString *errcode;

/**
 *  异常发生的时间戳(精确到毫秒)
 */
@property (nonatomic, assign) NSInteger errat;

/**
 *  异常详情
 */
@property (nonatomic, copy) NSString *msg;

/**
 *  异常次数（多少个相同异常）
 */
@property (nonatomic, assign) NSInteger times;

/**
 *  转化为字典结构
 *
 *  @return 字典对象
 */
- (NSDictionary *)dictionaryValue;

@end
