//
//  WeiboApiObject.h
//  TCWeiboSDK
//
//  Created by heloyue on 13-11-22.
//  Copyright (c) 2013年 heloyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



/**
 * @brief 错误范围，用来标识错误是接口返回的还是SDK返回的。
 */
typedef enum{
    /**
     * 接口返回的错误
     */
	TCWBErrorCodeInterface	 = 100,
    /**
     * SDK返回的错误
     */
	TCWBErrorCodeSDK         = 101,
    
}TCWBErrorCode;


/**
 * @brief 详细错误码
 */
typedef enum{
    /**
     * 请求错误
     */
	TCWBSDKErrorCodeRequestError     = 201,
    /**
     * 返回accesstoken错误
     */
	TCWBSDKErrorCodeAccessError      = 202,
    /**
     * 无授权，或者受权已经过期，需要重新授权
     */
    TCWbErrorCodeNoAuth              = 203,
    /**
     * 无refreshtoken
     */
    TCWBErrorCodeNoRefreshToken      = 204,
    /**
     * 授权出错
     */
    TCWBSDKErrorCodeAuthorizeError   = 205,
    
    /**
     * SSO授权出错
     */
    TCWBSDKErrorCodeSSOError   = 206,
    
    
}TCWBSDKErrorCode;

/**
 * @brief  默认的授权支持模式，支持三种授权
 */
#define TCWBModelDefault    0

/**
 * @brief  使用微博客户端进行SSO授权模式
 */
#define TCWBModelAppSSO     1

/**
 * @brief  使用苹果系统的SSO登录模式
 */
#define TCWBModelSystemSSO  2

/**
 * @brief 使用Webview授权模式
 */
#define TCWBModelWebviewAuth 4


/**
 * @brief 优先使用cache,只有当cache无效时才启用服务器login
 */
#define TCWBCachePolicyCacheFirst   0


/**
 * @brief 优先从服务器获取，获取完毕后，会覆盖本地cache
 */
#define TCWBCachePolicyServerFirst  1


/**
 * @brief 在本地检查token是否过期，是否有效
 */
#define TCWBAuthCheckLocal   0


/**
 * @brief 到服务器检查token有效性
 */
#define TCWBAuthCheckServer  1


/**
 * @brief 日志等级定义
 */
typedef enum {
    eLogLevelError = 0,
    eLogLevelInfo  = 1,
    eLogLevelDebug = 2
}eLogLevel;

/**
 *  @brief      api对象定义文件
 *  @note       获取成员属性，请通过下面的property 获取
 */
@interface WeiboApiObject : NSObject<NSCopying,NSCoding>
{
   
}


/**
 *  @brief     申请应用时分配给第三方应用程序的App key
 */
@property   (nonatomic, copy) NSString *appKey;

/**
 *  @brief     申请应用时分配给第三方应用程序的App Secret
 */
@property   (nonatomic, copy) NSString *appSecret;

/**
 *  @brief     申请应用时开发者填写的应用url，可以用于返回授权信息
 */
@property   (nonatomic, copy) NSString *redirectUri;

/**
 *  @brief     用户微博帐号
 */
@property   (nonatomic, copy) NSString *userName;

/**
 *  @brief     用户微博昵称
 */
@property   (nonatomic, copy) NSString *userNick;

/**
 *  @brief     openid 唯一标识一个微博用户
 */
@property   (nonatomic, copy) NSString *openid;

/**
 *  @brief     用户票据accessToken
 */
@property   (nonatomic, copy) NSString *accessToken;

/**
 *  @brief     accessToken过期时，可以用refreshtoken 重刷token
 */
@property   (nonatomic, copy) NSString *refreshToken;

/**
 *  @brief     过期时间戳，从1970的秒数
 */
@property   (nonatomic, assign) NSTimeInterval   expires;


/**
 *  @brief     实际使用的授权方式，包括TCWBModelAppSSO，TCWBModelSystemSSO，TCWBModelWebviewAuth
 */
@property   (nonatomic, assign) int  realAuthMode;


/**
 *  @brief     用户选择的授权模式,支持webview授权，微博客户端SSO授权，苹果系统SSO登录,支持按位或
 */
@property   (nonatomic, assign) int  authMode;


/**
 *  @brief     系统SSO是否可用, 开发者不需关心
 */
@property   (nonatomic, assign) int systemSSOUsable;


/**
 *  @brief     客户端SSO是否可用, 开发者不需关心
 */
@property   (nonatomic, assign) int AppSSOUsable;

/**
 *  @brief     授权delegate
 */
@property   (nonatomic, assign) id  authDelegate;


/**
 *  @brief     开发者不需要关心
 */
@property   (nonatomic, assign) id  authDelegate2;



/**
 *  @brief     请求delegate
 */
@property   (nonatomic, assign) id  reqDelegate;

/**
 *  @brief     授权窗口的父窗口
 */
@property   (nonatomic, retain) UIViewController *rootViewCtrl;

@end
