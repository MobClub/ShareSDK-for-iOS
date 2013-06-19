//
//  WBApiObject.h
//  WeiboSDK
//
//  Created by iwanglian on 12-12-26.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    WBSuccess           = 0,
    WBErrCodeCommon     = -1,
    WBErrCodeUserCancel = -2,
    WBErrCodeSentFail   = -3,
    WBErrCodeAuthDeny   = -4,
    WBErrCodeUnsupport  = -5,
}WBErrCode;


/**
 授权成功时，sdk返回的授权token结构
 
 */
@interface WBToken : NSObject

///授权账号id
@property(strong,nonatomic)NSString* openid;

///访问Token
@property(strong,nonatomic)NSString* accessToken;

///访问Token的过期时间戳
@property(assign,nonatomic)unsigned int expires;

/// 刷新Token 
@property(strong,nonatomic)NSString* refreshToken;

/// 用于加密，开发者不用关心
@property(strong, nonatomic)NSString* omasToken;

/// 用于加密，开发者不用关心
@property(strong, nonatomic)NSString* omasKey;

///预留字段
@property(strong, nonatomic)NSString* reserver;

@end
