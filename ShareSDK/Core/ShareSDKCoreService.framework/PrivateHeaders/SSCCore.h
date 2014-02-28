//
//  SSCCore.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-3-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AGCommon/CMEventDispatcher.h>
#import <AGCommon/CMCacheManager.h>
#import "SSCLogManager.h"
#import "SSCUrlCachePool.h"

@class SSCAccount;

/**
 *	@brief	ShareSDK服务核心对象
 */
@interface SSCCore : CMEventDispatcher
{
@private
    NSMutableDictionary *_accounts;
    NSMutableDictionary *_commonObjects;
    NSString *_deviceKey;
    
    CMCacheManager *_cacheManager;    //图片缓存管理器
    SSCUrlCachePool *_urlCachePool;     //URL缓存池
    NSInteger _urlCachePoolRefCount;    //URL缓存池引用次数，如果引用次数为零则释放池
}

/**
 *	@brief	已注册的应用Key列表
 */
@property (nonatomic,readonly) NSArray *registerAccountKeys;

/**
 *	@brief	设备Key
 */
@property (nonatomic,readonly) NSString *deviceKey;

/**
 *	@brief	URL缓存池
 */
@property (nonatomic,readonly) SSCUrlCachePool *urlCachePool;

/**
 *	@brief	图片缓存管理器
 */
@property (nonatomic,readonly) CMCacheManager *cacheManager;

/**
 *	@brief	获取核心服务层示例
 *
 *	@return	核心服务层对象
 */
+ (SSCCore *)getInstance;

/**
 *	@brief	获取帐号
 *
 *	@param 	appKey 	应用标识
 *
 *	@return	账号
 */
- (SSCAccount *)getAccountWithAppKey:(NSString *)appKey;

/**
 *	@brief	登录账号
 *
 *	@param 	account 	账号信息
 */
- (void)loginWithAccount:(SSCAccount *)account;

/**
 *	@brief	判断帐号是否通过授权
 *
 *	@param 	account 	帐号信息
 *
 *	@return	YES表示通过授权，NO表示尚未授权
 */
- (BOOL)hasAuthorized:(SSCAccount *)account;

/**
 *	@brief	获取缓存根路径
 *
 *	@return	缓存根路径
 */
- (NSString *)cachePath;

/**
 *	@brief	添加URL缓存池引用
 */
- (void)addUrlCachePoolRef;

/**
 *	@brief	释放URL缓存池引用
 */
- (void)releaseUrlCachePoolRef;

/**
 *	@brief	设置公共对象
 *
 *	@param 	object 	公共对象
 *	@param 	key 	标识
 */
- (void)setCommonObject:(id)object forKey:(NSString *)key;

/**
 *	@brief	获取公共对象
 *
 *	@param 	key 	标识
 *
 *	@return	公共对象实例
 */
- (id)getCommonObject:(NSString *)key;

/**
 *	@brief	获取SDK版本
 *
 *	@return	SDK版本号
 */
- (NSString *)sdkVer;

@end
