//
//  EAccountOpenPageSDK.h
//  EAccountOpenPageSDK
//
//  Created by 陈永怀 on 2019/4/15.
//  Copyright © 2019年 21CN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "EAccountOpenPageConfig.h"
#import "EAccountHYPreLoginModel.h"
#import "EAccountHYCTEConfig.h"
#import "EAccountHYUiEventHandler.h"

/**
 行业版SDK v3.8.11 20211204
 */
/**
 行业版SDK v3.8.10 20211115
 */
/**
 声明一个block
 @param resultDic 网络返回的data的解析结果
 */
typedef   void (^successHandler) ( NSDictionary * _Nonnull resultDic);

/**
 声明一个block
 @param error 网络返回的错误或者其它错误
 */
typedef   void (^failureHandler) (NSError * _Nonnull error);

/**
 声明一个block
 @param senderTag 被点击控件的tag
 */
typedef   void (^clickEventHandler) (NSString * _Nonnull senderTag);

/**
 声明一个block
 @param view 点击后返回的控件view
 @param eUiHandler 继续执行后续操作的handler，详细见EAccountHYUiEventHandler类
 */
typedef   void (^secClickEventHandler) (UIView * _Nonnull view, EAccountHYUiEventHandler * _Nonnull eUiHandler);

/**
 声明一个block，登录页面消失后调用的block
 */
typedef   void (^completionBlock) ();

@interface EAccountOpenPageSDK : NSObject

/**
 初始化SDK
 @param appId 接入方在账号平台领取的appId
 @param appSecrect 接入方在账号平台领取的appSecrect
 */
+ (void)initWithAppId:(NSString * _Nonnull)appId
              appSecret:(NSString * _Nonnull)appSecrect;

/**
 *预登录接口 v3.7.2新增
 @param model 接口超时时间配置
 */

+ (void)requestPRELogin:(EAccountHYPreLoginModel * _Nonnull)model
             completion:(nonnull successHandler)completion
                failure:(nonnull failureHandler)fail;

/**
 预登录

 @param timeoutInterval 接口超时时间
 */
+ (void)requestPreLogin:(NSTimeInterval)timeoutInterval
           completion:(nonnull successHandler)completion
              failure:(nonnull failureHandler)fail DEPRECATED_MSG_ATTRIBUTE("Please use `requestPRELogin:completion:failure:` instead");



/**
 控制台日志输出控制（默认关闭）
 @param enable 开关参数
 */
+ (void)printConsoleEnable:(BOOL)enable;

+ (void)setDomainName:(EAccountHYCTEConfig *)config;

/**
@description   获取当前流量卡运营商信息
@return NSString    "CT"    中国电信 / "CM"     中国移动 / "CU"     中国联联通 / "UN"    未知
*/
+ (NSString *)getOperatorType;

/**
@description   是否打开蜂窝数据，使用流量
*/
+ (BOOL)isCellularDataEnable;

/// v3.7.2新增接口方法， 打开全屏登录页面，用户点击登录按钮的时候会返回相应的结果
/// @param config 登录界面相关动态配置
/// @param controller 传入当前vc
/// @param clickHandler 合作方新增按钮的点击回调
/// @param completion 成功回调
/// @param fail 失败回调
+ (void)openAtuhVC:(EAccountOpenPageConfig * _Nonnull)config
        controller:(nonnull UIViewController *)controller
      clickHandler:(nonnull clickEventHandler)clickHandler
        completion:(nonnull successHandler)completion
           failure:(nonnull failureHandler)fail;


/// v3.7.2新增接口方法， 打开Mini登录页面，用户点击登录按钮的时候会返回相应的结果
/// @param config 登录界面相关动态配置
/// @param controller 传入当前vc
/// @param clickHandler 合作方新增按钮的点击回调
/// @param completion 成功回调
/// @param fail 失败回调
+ (void)openMiniAtuhVC:(EAccountOpenPageConfig * _Nonnull)config
        controller:(nonnull UIViewController *)controller
      clickHandler:(nonnull clickEventHandler)clickHandler
        completion:(nonnull successHandler)completion
           failure:(nonnull failureHandler)fail;


/// v3.8.3新增接口方法，点击登录界面按钮后，将会在此接口方法回调
/// @param clickHandler  回调的block，包含点击的view和后续操作handler
+ (void)customOperationWithEventHandler:(nonnull secClickEventHandler)clickHandler;

/// v3.8.3新增接口方法，点击登录界面按钮后，将会在此接口方法回调
/// @param tag 传入添加的自定义按钮的tag
/// @param clickHandler  回调的block，包含点击的view
+ (void)customOperationWithTag:(NSInteger)tag eventHandler:(secClickEventHandler)clickHandler;

#pragma -mark 已废弃
/**
 打开登录页面，用户点击登录按钮的时候会返回相应的结果
 @param  config 登录界面相关动态配置
 @param  clickHandler 合作方新增按钮的点击回调
 @param  completion 成功回调
 @param  fail  失败回调
 */
+ (void)openAtuhVC:(EAccountOpenPageConfig * _Nonnull)config
      clickHandler:(nonnull clickEventHandler)clickHandler
        completion:(nonnull successHandler)completion
           failure:(nonnull failureHandler)fail DEPRECATED_MSG_ATTRIBUTE("Please use `openAtuhVC:controller:clickHandler:completion:failure:` instead");

/**
 打开登录页面，用户点击登录按钮的时候会返回相应的结果
 @param  clickHandler 合作方新增按钮的点击回调
 @param  completion 成功回调
 @param  fail  失败回调
 */
+ (void)openAtuhVC:(nonnull clickEventHandler)clickHandler
        completion:(nonnull successHandler)completion
           failure:(nonnull failureHandler)fail DEPRECATED_MSG_ATTRIBUTE("Please use `openAtuhVC:controller:clickHandler:completion:failure:` instead");

/**
 主动关闭授权页面
 */
+ (void)closeOpenAuthVC DEPRECATED_MSG_ATTRIBUTE("Please use `didCloseOpenAuthVC:completion` instead");;

/// 授权页面已关闭，效果与+ (void)closeOpenAuthVC一致，不要重复调用，建议调用此方法关闭登录页
/// @param completion 页面关闭后调用的block
+ (void)didCloseOpenAuthVC:(nullable completionBlock)completion;
@end
