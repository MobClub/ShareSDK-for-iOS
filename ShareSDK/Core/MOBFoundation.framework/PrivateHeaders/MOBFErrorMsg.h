//
//  MOBFErrorMsg.h
//  MOBFoundation
//
//  Created by 刘 靖煌 on 15/5/26.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MOBFErrorMsg : NSObject

+ (NSDictionary *)dicWithErrModel:(MOBFErrorMsg *)errMsgModel;

/**
 *  异常类型：1、Crash；2、SDKErr；3、AppErr。
 */
@property (nonatomic, assign) NSInteger type;

/**
 *  错误码：SDK对于可预知异常的错误码定义
 */
@property (nonatomic, copy) NSString *errcode;

/**
 *  异常发生的时间戳(精确到毫秒)
 */
@property (nonatomic, assign)NSInteger errat;

/**
 *  异常详情
 */
@property (nonatomic, copy) NSString *msg;

/**
 *  异常次数（多少个相同异常）
 */
@property (nonatomic, assign)NSInteger times;

@end
