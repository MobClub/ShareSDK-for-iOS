//
//  MOBFErrorReportTypeDef.h
//  MOBFoundation
//
//  Created by 刘 靖煌 on 15/5/25.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#ifndef MOBFoundation_MOBFErrorReportTypeDef_h
#define MOBFoundation_MOBFErrorReportTypeDef_h

/**
 *  SDK类型
 */
typedef NS_ENUM(NSUInteger, MOBFSDKType){
    /**
     *  未知
     */
    MOBFSDKTypeUnknown  = 0,
    /**
     *  ShareSDK
     */
    MOBFSDKTypeShareSDK = 1,
    /**
     *  ShareREC
     */
    MOBFSDKTypeShareREC = 2,
    /**
     *  SMSSDK
     */
    MOBFSDKTypeSMSSDK   = 3,
    /**
     *  其他
     */
    MOBFSDKTypeOther    = 99,
};

/**
 *  错误消息类型
 */
typedef NS_ENUM(NSUInteger, MOBFErrorMsgType){
    /**
     *  崩溃信息
     */
    MOBFErrorMsgTypeCrash       = 1,
    /**
     *  SDK错误信息
     */
    MOBFErrorMsgTypeSDKError    = 2,
    /**
     *  应用的错误信息
     */
    MOBFErrorMsgTypeAppError    = 3,
};

#endif
