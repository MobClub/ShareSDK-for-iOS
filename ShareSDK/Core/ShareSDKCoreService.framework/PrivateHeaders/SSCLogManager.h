//
//  SSCLogManager.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCLogInfo.h"
#import "SSCServerRequest.h"

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "SSCTypeDef.h"
#else
#import "../Headers/SSCTypeDef.h"
#endif

@class SSCCore;
@class SSCAccount;

/**
 *	@brief	日志管理器，负责在使用SDK过程中产生的日志数据
 */
@interface SSCLogManager : NSObject
{
@private
    SSCStatPolicy _policy;
    SSCAccount *_account;
    SSCCore *_core;
    NSMutableArray *_sendingLogArray;
    NSString *_logUrl;
    
    NSMutableDictionary *_limitsDictionary;         //日志限制记录，超过阀值日志将进行丢弃
    BOOL _hasStartupSend;
    BOOL _sending;
    NSTimer *_timer;
    NSTimeInterval _bufferTimestamp;                //缓存的刷新时间
    NSTimeInterval _startupSendTimestamp;           
    NSMutableArray *_buffer;
    NSInteger _id;
    SSCServerRequest *_request;
    
    dispatch_queue_t _logQueue;
    dispatch_semaphore_t _semaphore;                //信号量，当调用Startup后释放信号
}

/**
 *	@brief	统计策略
 */
@property (nonatomic) SSCStatPolicy policy;


/**
 *	@brief	初始化日志管理器
 *
 *	@param 	account 	帐号
 *
 *	@return	日志管理器
 */
- (id)initWithAccount:(SSCAccount *)account;

/**
 *	@brief	写入日志
 *
 *	@param 	content 	日志内容
 */
- (void)writeLog:(SSCLogInfo *)content;

/**
 *	@brief	启动日志功能
 *
 *  @param  logServiceUrl       日志服务器地址
 */
- (void)startup:(NSString *)logServiceUrl;

/**
 *	@brief	获取主日志路径
 *
 *	@return	日志路径
 */
- (NSString *)logPath;

@end
