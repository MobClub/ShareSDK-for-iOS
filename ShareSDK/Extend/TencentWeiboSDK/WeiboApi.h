/**
 *  @file   WeiboApi.h
 *  @brief  WeiboApi接口定义头文件
 *  @author tencent.com
 *  @date   04/23/3013
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeiboApiObject.h"



/**
 *  @class  WeiboApi
 *  @brief  定义了腾讯微博授权，api请求接口
 *  @note   集成了webview授权，微博客户端的SSO授权，苹果系统的SSO授权，选择何种模式授权，请initWithAppKey中设置，默认支持三种模式
 *  @note   典型调用顺序 1. 初始化——> 通过webview或者SSO授权WeiboApi对象——>请求接口  @see initWithAppKey: andSecret: andRedirectUri: andAuthModeFlag: andCachePolicy @see loginWithDelegate:theDelegate:andRootController @see requestWithParams:apiName:httpMethod:delegate
 *  @note   典型调用顺序 2. 初始化——> 把已有token设置到对象中——>请求接口delegate @see initWithAppKey:andSecret:andRedirectUri:andAuthModeFlag:andCachePolicy @see setToken: @see requestWithParams:apiName:httpMethod:delegate
 *  @note   授权优先级：SSO可用时，优先使用SSO进行授权，次选系统SSO登录，最后选择webview
 *  @note   第一次授权时，如果苹果系统SSO授权不可用，sdk将会做记忆，后续不再选择此种授权机制。
 *  @note   重刷授权： 默认在之前检查授权有效性，如果授权无效，但是refreshtoken有效，则自动启用refresh机制进行重刷授权。@see loginWithDelegate:theDelegate:andRootController
 *  @note   SDk默认写本地缓存，第一次授权完成后，写入缓存。后续不需要再次进行授权，如需判断授权是否有效请@see checkAuthValid:
 *  @note   使用苹果系统SSO授权时，不提供获取token功能，其他两种授权方式时，请获取请调用getToken 获取授权票据。@see getToken:
 *  @note   客户端SSO授权时，所显示应用icon，是SDK从第三方应用工程plist种获取，请确保工程icon设置方式是标准设置方式。
 */
@interface WeiboApi : NSObject
{
    
    
    /**
     *  @brief     weiboapi的存储对象
     *  @note      私有变量，开发不需要关心
     */
    WeiboApiObject  *weiboObj;
    
    
    /**
     *  @brief     请求连接字典
     *  @note      私有变量，开发不需要关心
     */
    
    NSMutableDictionary    *reqDic;
};



/**
 * @brief   初始化WeiboApi对象
 * @note    alloc weiboApi 对象后，授权之前，必须现进行初始化，否则将会出错
 * @param   INPUT   theAppkey      申请应用时分配给第三方应用程序的App key,
 * @param   INPUT   theSecret      申请应用时分配给第三方应用程序的App secrect,
 * @param   INPUT   theRedirectUri 回调url
 * @param   INPUT   theAuthModeFlag   兼容模式，按位或支持微博客户端SSO授权，苹果系统SocialFrameWork，webview授权。默认填0即可，3种模式都支持，模式定义见WBApiObject.h文件。
 * @param   INPUT   theCachePolicy   缓存兼容模式，默认填TCWBCachePolicyCacheFirst（0），优先从缓存中获取。TCWBCachePolicyServerFirst（1），优先从服务器获取，获取完毕覆盖本地缓存
 * @return  id            生成的WeiboApi对象实例
 */
- (id) initWithAppKey:(NSString *)theAppkey
            andSecret:(NSString *)theSecret
       andRedirectUri:(NSString *)theRedirecturi
      andAuthModeFlag:(int)theAuthModeFlag
       andCachePolicy:(int)theCachePolicy;



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
 * @brief   发送api请求, 腾讯微博OPenApi请求都可以通过这个接口进行访问，如何调用请参考官网文档
 * @note    授权应用信息使用当前weiboapi对象中的数据
 * @note    需实现WeiboRequestDelegate 中的didReceiveRawData 和 didFailWithError
 * @param   INPUT params 请求参数对， key 为NSString类型的参数名， value 一般情况下为NSString 类型对象。发表图片时，value必须为NSData，或者UIImage对象。
 * @param   INPUT apiName api名称，例如收听某人的url是https://open.t.qq.com/api/friends/add， 它的apiname就是 friends/add
 * @param   INPUT httpMethod GET or POST
 * @param   INPUT delegate 回调delegate 应实现WeiboRequestDelegate
 * @return  返回请求序号,序号为递增。返回小于0的数字，则表示请求失败，失败原因可能是授权信息无效等。
 */

- (int)requestWithParams :(NSMutableDictionary *)params
                  apiName:(NSString *)apiName
               httpMethod:(NSString *)httpMethod
                 delegate:(id)delegate;


/**
 * @brief  使用已有授权信息授权进行初始化，比如第三方后台已经有用户授权，可以使用这种方式进行授权。ps 用户的新授权会覆盖老授权，导致老授权失效。
 * @note   需实现WeiboAuthDelegate 中的DidAuthFinished 和 DidAuthCanceled DidAuthFailWithError
 * @note   需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。@see handleOpenURL:
 * @param  INPUT    weiboObj  其中AccessToken, expiretime，openid, refreshtoken必须设置
 * @return 无返回
 */
- (void)SetToken:(WeiboApiObject *)weiboObj;

/**
 *  @brief  获取WeiboApiObject对象，当使用非苹果系统授权时，可以从中取出授权信息
 *  @return 返回授权信息对象
 */
- (WeiboApiObject *)getToken;

/**
 * @brief   登出，清除授权的缓存信息，会清除掉cache中的缓存信息
 * @return  无返回
 */
- (void)cancelAuth;


/**
 *  @brief  判断授权是否有效，包括是否已授权，授权是否已过期
 *  @param  INPUT theCheckAuthFlag  检查授权信息策略，TCWBAuthCheckLocal，本地检查有效性；TCWBAuthCheckServer， 到服务器检查token有效性。
 *  @param  INPUT theDelegete       回调delegete
 *  @return 无返回
 */
- (void)checkAuthValid:(int)theCheckAuthFlag andDelegete:(id)theDelegete;


/**
 *  @brief  设置日志等级，
 *  @param  INPUT loglevel 日志等级（共有3个等级， eLogLevelError，eLogLevelInfo，eLogLevelDebug），默认等级为 eLogLevelError
 *  @return 无返回
 */
-(void)setLogLevel:(int)loglevel;

/**
 * @brief  处理微博客户端唤回后的回调数据
 * @note   处理微博客户端通过URL启动App时传递的数据,需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * @note   需同时在 URL Types 里面添加urlscheme wbxxxx,其中xxxx为注册应用时获得的appkey，如wb801213517
 * @note   sourceApplication的来源可能是大写，也可能是小写（于iOS 系统版本有关），如果需要用这个参数判断来源，请做好兼容。
 * @param  INPUT  url     启动App的URL
 * @return YES 成功返回
 * @return NO  失败返回
 */
-(BOOL) handleOpenURL:(NSURL *) url;


@end


/**
 * @protocol   WeiboAuthDelegate
 * @brief   腾讯微博授权回调协议
 */
@protocol WeiboAuthDelegate <NSObject>

@optional

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi 成功后返回的WeiboApi对象，accesstoken,openid,refreshtoken,expires 等授权信息都在此处返回
 * @return  无返回
 */
- (void)DidAuthFinished:(WeiboApiObject *)wbobj;

/**
 * @brief   授权成功后的回调
 * @param   INPUT   wbapi   weiboapi 对象，取消授权后，授权信息会被清空
 * @return  无返回
 */
- (void)DidAuthCanceled:(WeiboApiObject *)wbobj;

/**
 * @brief   授权成功后的回调
 * @param   INPUT   error   标准出错信息
 * @return  无返回
 */
- (void)DidAuthFailWithError:(NSError *)error;


/**
 * @brief   选择使用服务器验证token有效性（checkAuthValid）时，需实现此回调
 * @param   INPUT   bResult   检查结果，yes 为有效，no 为无效
 * @param   INPUT   strSuggestion 当bResult 为no 时，此参数为建议。
 * @return  无返回
 */
- (void)didCheckAuthValid:(BOOL)bResult suggest:(NSString*)strSuggestion;

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


/**
 * @brief   调用接口，且失败原因为授权无效
 * @param   INPUT   error   接口返回的错误信息
 * @param   INPUT   request 发起请求时的请求对象，可以用来管理异步请求
 * @return  无返回
 */
- (void)didNeedRelogin:(NSError *)error reqNo:(int)reqno;



@end



