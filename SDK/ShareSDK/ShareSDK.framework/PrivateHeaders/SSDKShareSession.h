//
//  SSDKShareSession.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/3/17.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import "SSDKSession.h"
#import <ShareSDK/SSDKTypeDefine.h>

/**
 *  分享会话
 */
@interface SSDKShareSession : SSDKSession

/**
 *  是否正在授权
 */
@property (nonatomic) BOOL authorizing;

/**
 *  平台类型
 */
@property (nonatomic, readonly) SSDKPlatformType platformType;

/**
 *  分享参数
 */
@property (nonatomic, readonly) NSMutableDictionary *parameters;

/**
 *  需要授权回调
 */
@property (nonatomic, copy, readonly) SSDKNeedAuthorizeHandler authorizeHandler;

/**
 *  状态变更处理器
 */
@property (nonatomic, copy, readonly) SSDKShareStateChangedHandler stateChangedHandler;

/**
 *  上传进度回调
 */
@property (nonatomic, copy, readonly) SSDKHttpUploadProgressHandler uploadProgressHandler;

/**
 *  初始化分享会话
 *
 *  @param platformType        平台类型
 *  @param parameters          分享参数
 *  @param authorizeHandler    授权处理
 *  @param stateChangedHandler 状态变更处理
 *
 *  @return 会话对象
 */
- (id)initWithPlatformType:(SSDKPlatformType)platformType
                parameters:(NSMutableDictionary *)parameters
          authorizeHandler:(SSDKNeedAuthorizeHandler)authorizeHandler
       stateChangedHandler:(SSDKShareStateChangedHandler)stateChangedHandler;


/**
 设置上传进度回调

 @param uploadProgressHandler 上传进度回调
 */
- (void)setUploadProgressHandler:(SSDKHttpUploadProgressHandler)uploadProgressHandler;

/**
 *  处理回调URL
 *
 *  @param URL               URL地址
 *  @param sourceApplication 源应用名称
 *  @param annotation        附加数据
 *
 *  @return YES 表示接受请求，NO 表示拒绝请求
 */
- (BOOL)handleOpenURL:(NSURL *)URL
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation;

/**
 *  监听应用激活
 */
- (void)listenAppDidBecomeActive;

@end
