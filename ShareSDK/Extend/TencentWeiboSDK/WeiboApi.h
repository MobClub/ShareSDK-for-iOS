/**
 *  @file   WeiboApi.h
 *  @brief  WeiboApi接口定义头文件
 *  @author tencent.com
 *  @date   04/23/3013
 */

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
     * 无授权，或者受权已经过期
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
 *  @class  WeiboApi
 *  @brief  定义了腾讯微博授权，api请求接口
 *  @note   典型调用顺序 1. 初始化 ——> 通过webview或者SSO授权WeiboApi对象 ——>请求接口
 *  @note   典型调用顺序 2. 初始化 ——> 使用已有授权初始化WeiboApi对象 ——>请求接口
 *  @note   授权优先级：SSO可用时，优先使用SSO进行授权
 *  @note   重刷授权： 当使用SSO授权时，不提供重刷授权机制
 *  @note   应用图标： SSO授权时，SDK从plist文件中读取Icon files 项下的图标传给微博客户端
 */
@interface WeiboApi : NSObject
{
    /**
     *  @brief     申请应用时分配给第三方应用程序的App key
     */
    NSString            *appKey;
    
    /**
     *  @brief     申请应用时分配给第三方应用程序的App Secret
     */
    NSString            *appSecret;
    
    /**
     *  @brief     申请应用时开发者填写的应用url，可以用于返回授权信息
     */
    NSString            *redirectUri;
    
    /**
     *  @brief     授权delegate
     */
    id                  authDelegate;
    
    
    /**
     *  @brief     用户微博帐号
     */
    NSString            *userName;
    
    /**
     *  @brief     用户微博昵称
     */
    NSString            *userNick;
    
    /**
     *  @brief     openid 唯一标识一个微博用户
     */
    NSString            *openid;
    
    /**
     *  @brief     用户票据accessToken
     */
    NSString            *accessToken;
    
    /**
     *  @brief     accessToken过期时，可以用refreshtoken 重刷token
     */
    NSString            *refreshToken;
    
    
    /**
     *  @brief     请求集合，用于管理异步请求
     */
    NSMutableDictionary  *reqDic;
    
    /**
     *  @brief     过期时间戳，从1970的秒数
     */
    NSTimeInterval      expires;
    
    /**
     *  @brief     标识是否为SSO授权，SSO授权时，不具有重刷机制
     */
    BOOL                isSSOAuth;
    
    
    /**
     *  @brief     请求数，递增，用于标记请求
     */
    int                 reqCount;
    
    /**
     *  @brief     授权窗口的父窗口
     */
    UIViewController    *rootViewCtrl;
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
 *  @brief     授权delegate
 */
@property   (nonatomic, assign) id  authDelegate;

/**
 *  @brief     授权窗口的父窗口
 */
@property   (nonatomic, retain) UIViewController *rootViewCtrl;



/**
 * @brief   初始化WeiboApi对象
 * @note    alloc weiboApi 对象后，授权之前，必须现进行初始化，否则将会出错
 * @param   INPUT   theAppkey      申请应用时分配给第三方应用程序的App key,
 * @param   INPUT   theSecret      申请应用时分配给第三方应用程序的App secrect,
 * @param   INPUT   theRedirectUri 回调url
 * @return  id            生成的WeiboApi对象实例
 */
- (id) initWithAppKey:(NSString *)theAppkey
            andSecret:(NSString *)theSecret
       andRedirectUri:(NSString *)theRedirecturi;




/**
 * @brief  使用SSO或者Webview开始授权，优先选择SSO
 * @note   需实现WeiboAuthDelegate 中的DidAuthFinished 和 DidAuthCanceled DidAuthFailWithError
 * @note   需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。@see handleOpenURL:
 * @note   必须再主线程调用，且提供窗口controller，否则会导致调用失败
 * @param  INPUT    delegate          回调方法接收对象
 * @param  INPUT    rootCtrl          授权窗口的父窗口
 * @return 无返回
 */
- (void) loginWithDelegate:(id)theDelegate andRootController:(UIViewController *)rootCtrl;


/**
 * @brief  使用已有授权信息授权进行初始化，比如第三方后台已经有用户授权，可以使用这种方式进行授权。ps 用户的新授权会覆盖老授权，导致老授权失效。
 * @note   需实现WeiboAuthDelegate 中的DidAuthFinished 和 DidAuthCanceled DidAuthFailWithError
 * @note   需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。@see handleOpenURL:
 * @param  INPUT    theAccessToken    访问api资源的凭证
 * @param  INPUT    theExpiredTime    accesstoken过期时间
 * @param  INPUT    theOpenid         用户统一标识，可以唯一标识一个用户
 * @param  INPUT    theRefreshToken   刷新token
 * @param  INPUT    theDelegate        回调方法接收对象
 * @return 无返回
 */
- (void) loginWithAccesstoken:(NSString *)theAccessToken
                    andOpenId:(NSString *)theOpenid
                   andExpires:(NSTimeInterval)theExpires
              andRefreshToken:(NSString *)theRefreshToken
                  andDelegate:(id)theDelegate;

/**
 * @brief   使用WeiBoApi对象里面的授权信息，重刷accesstoken，原accesstoken 将失效
 * @note    WeiboApi对象里面必须已经有授权信息，refreshtoken，appkey，否则会出错
 * @note    须实现WeiboAuthDelegate 中的DidAuthRefreshed 和 DidAuthRefreshFailed
 * @param   INPUT    theDelegate        回调方法接收对象
 * @return  返回请求序号，－1时为失败
 */
- (int) refreshAuthWithDelegate:(id)theDelegate;


/**
 * @brief   重刷accesstoken, 原accesstoken将失效
 * @note    使用参数中的refreshtoken，appkey
 * @note    须实现WeiboAuthDelegate 中的DidAuthRefreshed 和 DidAuthRefreshFailed
 * @param   INPUT    theAppKey           访问api资源的凭证
 * @param   INPUT    theRefreshToken     accesstoken过期时间
 * @param   INPUT    theDelegate         回调方法接收对象
 * @return  返回请求序号，－1时为失败
 */
- (int) refreshAuthWithAppKey:(NSString *)theAppKey andRefreshToken:(NSString *)theRefreshToken andDelegate:(id)theDelegate;




/**
 * @brief   登出，清除授权的缓存信息
 * @return  无返回
 */
- (void)cancelAuth;


/**
 *  @brief  判断是否已经授权
 *  @return YES 已经授权
 *  @return NO  尚未授权
 */
- (BOOL)isAuthed;

/**
 *  @brief  判断授权是否已经到期
 *  @return YES 已经过期
 *  @return NO  尚未过期
 */
- (BOOL)isAuthorizeExpired;


/**
 *  @brief  判断授权是否有效，包括是否已授权，授权是否已过期
 *  @return YES 有授权，且在有效期内
 *  @return NO  无授权，或者授权已失效
 */
- (BOOL)isAuthValid;


/**
 * @brief  处理微博客户端唤回后的回调数据
 * @note   处理微博客户端通过URL启动App时传递的数据,需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * SSO授权完成，回调到第三方APP时，sourceApplication字段可能是大写，也可能是小写。如果需用此字段来判断回调来源，请注意兼容大小写。
 * @note   需同时在 URL Types 里面添加urlscheme wbxxxx,其中xxxx为注册应用时获得的appkey，如wb801213517
 * @param  INPUT  url     启动App的URL
 * @return YES 成功返回
 * @return NO  失败返回
 */
-(BOOL) handleOpenURL:(NSURL *) url;


/**
 * @brief   发送api请求, 腾讯微博OPenApi请求都可以通过这个接口进行访问，如何调用请参考官网文档
 * @note    授权应用信息使用当前weiboapi对象中的数据
 * @note    需实现WeiboRequestDelegate 中的didReceiveRawData 和 didFailWithError
 * @param   INPUT params 请求参数对， key 为NSString类型的参数名， value 一般情况下为NSString 类型对象。发表图片时，value必须为NSData，或者UIImage对象。
 * @param   INPUT apiName api名称，例如收听某人的url是https://open.t.qq.com/api/friends/add， 它的apiname就是 friends/add
 * @param   INPUT httpMethod GET or POST
 * @param   INPUT delegate 回调delegate 应实现WeiboRequestDelegate
 * @return  返回请求序号,序号为递增
 */

- (int)requestWithParams :(NSMutableDictionary *)params
                  apiName:(NSString *)apiName
               httpMethod:(NSString *)httpMethod
                 delegate:(id)delegate;



@end


/**
 * @protocol   WeiboAuthDelegate
 * @brief   腾讯微博授权回调协议
 */
@protocol WeiboAuthDelegate <NSObject>

@optional

/**
 * @brief   重刷授权成功后的回调
 * @param   INPUT   wbapi 成功后返回的WeiboApi对象，accesstoken,openid,refreshtoken,expires 等授权信息都在此处返回
 * @return  无返回
 */
- (void)DidAuthRefreshed:(WeiboApi *)wbapi;

/**
 * @brief   重刷授权失败后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
- (void)DidAuthRefreshFail:(NSError *)error;

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi 成功后返回的WeiboApi对象，accesstoken,openid,refreshtoken,expires 等授权信息都在此处返回
 * @return  无返回
 */
- (void)DidAuthFinished:(WeiboApi *)wbapi;

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi   weiboapi 对象，取消授权后，授权信息会被清空
 * @return  无返回
 */
- (void)DidAuthCanceled:(WeiboApi *)wbapi;

/**
 * @brief   授权成功后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
- (void)DidAuthFailWithError:(NSError *)error;

@end


/**
 * @protocol   WeiboRequestDelegate
 * @brief   腾讯微博接口回调协议
 */

@protocol WeiboRequestDelegate <NSObject>
@optional
/**
 * @brief   接口调用成功后的回调
 * @param   INPUT   data    接口返回的数据
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didReceiveRawData:(NSData *)data reqNo:(int)reqno;
/**
 * @brief   接口调用失败后的回调
 * @param   INPUT   error   接口返回的错误信息
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didFailWithError:(NSError *)error reqNo:(int)reqno;
@end



