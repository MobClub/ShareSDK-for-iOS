//
//  SSDKContext_Private.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/27.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import "SSDKContext.h"
#import <MOBFoundation/MOBFoundation.h>
#import <MOBFoundation/MOBFErrorReport.h>

@interface SSDKContext () <UIWebViewDelegate>

/**
 *  命令队列
 */
@property (nonatomic) dispatch_queue_t commandQueue;

/**
 *  检测连接队列
 */
@property (nonatomic) dispatch_queue_t checkConnectQueue;

/**
 *  检测信号量
 */
@property (nonatomic) dispatch_semaphore_t checkSemaphore;

/**
 *  加载JS队列
 */
@property (nonatomic) dispatch_queue_t setScriptQueue;

/**
 *  JS上下文
 */
@property (nonatomic, weak) MOBFJSContext *jsContext;

/**
 *  应用标识
 */
@property (nonatomic, strong) NSString *appKey;

/**
 *  统计设备信息开关，默认YES
 */
@property (nonatomic) BOOL statDeviceOn;

/**
 *  统计分享信息开关，默认YES
 */
@property (nonatomic) BOOL statShareOn;

/**
 *  统计授权信息开关，默认YES
 */
@property (nonatomic) BOOL statAuthOn;

/**
 *  回流开关，默认NO
 */
@property (nonatomic) BOOL backflowOn;

/**
 *  服务器时间戳
 */
@property (nonatomic) NSTimeInterval timestamp;

/**
 *  启动时间
 */
@property (nonatomic) NSTimeInterval startTime;

/**
 *  资源包对象
 */
@property (nonatomic, strong) NSBundle *resourceBundle;

/**
 *  应用程序委托监听器
 */
@property (nonatomic, strong) NSMutableArray *handleOpenURLFilters;

/**
 *  未捕获异常处理器
 */
@property (nonatomic) NSUncaughtExceptionHandler *uncaughtExceptionHandler;

/**
 *  授权会话集合
 */
@property (nonatomic, strong) NSMutableDictionary *authSessions;

/**
 *  获取用户信息会话集合
 */
@property (nonatomic, strong) NSMutableDictionary *getUserInfoSessions;

/**
 *  添加好友会话集合
 */
@property (nonatomic, strong) NSMutableDictionary *addFriendSessions;

/**
 *  获取好友列表会话集合
 */
@property (nonatomic, strong) NSMutableDictionary *getFriendsSessions;

/**
 *  分享会话集合
 */
@property (nonatomic, strong) NSMutableDictionary *shareSessions;

/**
 *  调用API会话集合
 */
@property (nonatomic, strong) NSMutableDictionary *callApiSessions;

/**
 *  激活的平台类型
 */
@property (nonatomic, strong) NSMutableSet *activePlatformTypes;

/**
 *  异常报告类
 */
@property (nonatomic, strong) MOBFErrorReport *errorReport;

/**
 *  UIApplicationDelegate记录列表
 */
@property (nonatomic, strong) NSMutableArray *applicationDelegateClasses;

/**
 *  用于保存来自ShareContent.xml的内容
 */
@property (nonatomic, strong) NSString *xmlShareContent;

/**
 *  是否加载了JS脚本
 */
@property (nonatomic) BOOL isLoadedScript;

/**
 *  本地平台配置信息
 */
@property (nonatomic, strong) NSMutableDictionary *platformLocalConfig;

/**
 *  服务器平台配置信息
 */
@property (nonatomic, strong) NSMutableDictionary *platformServerConfig;

/**
 *  配置文件平台配置信息
 */
@property (nonatomic, strong) NSMutableDictionary *platformXMLConfig;


/**
 *  启动基础服务
 *
 *  @param appKey 应用标识
 */
- (void)startBasicServerWithAppKey:(NSString *)appKey;

/**
 *  获取服务器端应用配置信息
 *
 *  @param importHandler    导入回调处理器
 */
- (void)loadServerAppSettings:(SSDKImportHandler)importHandler;

/**
 *  检测平台是否需要导入
 *
 *  @param platformType     平台类型, 需要转换后的平台类型
 *  @param importHandler    导入回调处理器
 */
- (void)checkPlatformNeedImportByType:(SSDKPlatformType)platformType importHandler:(SSDKImportHandler)importHandler;

/**
 *  创建脚本核心环境
 */
- (void)setupScriptCore;

@end
