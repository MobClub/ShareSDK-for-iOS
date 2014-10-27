//
//  SSAcount.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-3-1.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AGCommon/CMErrorInfo.h>
#import "SSCLogManager.h"

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "ISSCAccount.h"
#else
#import "../Headers/ISSCAccount.h"
#endif

/**
 *	@brief	ShareSDK帐号
 */
@interface SSCAccount : NSObject <ISSCAccount>
{
@private
    NSString *_appKey;
    NSString *_baseUrl;
    NSArray *_roles;
    SSCLogManager *_logManager; //日志管理器
    
    BOOL _ssoEnabled;           //SSO使能
    BOOL _convertUrlEnabled;    //是否转换链接
    BOOL _statEnabled;          //统计开关
    BOOL _statDevEnabled;       //设备信息统计开关
    BOOL _statUserEnabled;      //用户信息统计开关
    BOOL _statShareEnabled;     //分享信息统计开关
    BOOL _useAppTrusteeship;    //使用应用信息托管
    
    BOOL _sendingDeviceInfo;    //发送设备信息标志
    BOOL _sendingProcessInfo;   //发送进程信息标志
    BOOL _isGetDate;            //获取时间标识，正在获取为YES， 否则为NO。
    NSTimeInterval _diffTime;   //与服务器的时间差值
    NSTimeInterval _time;       //运行时间
    NSTimeInterval _startupLogTime;    //写入启动时间
    
    dispatch_queue_t _uploadProcQueue;      //上传进程信息队列
}

/**
 *	@brief	应用标识
 */
@property (nonatomic,readonly) NSString *appKey;

/**
 *	@brief	应用信息托管标识
 */
@property (nonatomic) BOOL useAppTrusteeship;

/**
 *	@brief	SSO使能状态
 */
@property (nonatomic) BOOL ssoEnabled;

/**
 *	@brief	转换短链开关
 */
@property (nonatomic) BOOL convertUrlEnabled;

/**
 *	@brief	统计数据开关
 */
@property (nonatomic) BOOL statEnabled;

/**
 *	@brief	写入启动日志时间
 */
@property (nonatomic) NSTimeInterval startupLogTime;

/**
 *	@brief	统计设备使能状态
 */
@property (nonatomic,readonly) BOOL statDevEnabled;

/**
 *	@brief	统计用户使能状态
 */
@property (nonatomic,readonly) BOOL statUserEnabled;

/**
 *	@brief	统计分享使能状态
 */
@property (nonatomic,readonly) BOOL statShareEnabled;

/**
 *	@brief	缓存路径
 */
@property (nonatomic,readonly) NSString *cachePath;


/**
 *	@brief	初始化帐号
 *
 *	@param 	appKey 	应用Key
 *
 *	@return	帐号对象
 */
- (id)initWithAppKey:(NSString *)appKey;

/**
 *	@brief	设置帐号初始化内容
 */
- (void)setup;

/**
 *	@brief	使用AES加密数据
 *
 *	@param 	data 	原数据
 *
 *	@return	加密后数据
 */
- (NSData *)dataWithAESEncrypt:(NSData *)data;

/**
 *	@brief	写入日志
 *
 *	@param 	content 	日志内容
 */
- (void)writeLog:(SSCLogInfo *)content;

/**
 *	@brief	取得接口URL
 *
 *	@param 	path 	接口路径
 *
 *	@return	URL字符串
 */
- (NSString *)apiUrl:(NSString *)path;

/**
 *	@brief	设置服务器时间戳
 *
 *	@param 	timeInterval 	时间戳
 */
- (void)setServerTimeInterval:(NSTimeInterval)timeInterval;

/**
 *	@brief	返回设备数据，如果设备信息关闭则返回nil
 *
 *	@return	设备数据
 */
- (NSString *)deviceData;

/**
 *	@brief	获取应用运行时间
 *
 *	@return	运行时间
 */
- (NSTimeInterval)time;


@end
