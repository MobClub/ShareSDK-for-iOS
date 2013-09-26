//
//  CMLoader.h
//  Common
//
//  Created by 冯 鸿杰 on 13-6-6.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMEventDispatcher.h"

#define CMERROR_DOMAIN_LOADER @"LoaderErrorDomain"

/**
 *	@brief	加载文件失败
 */
#define CMERROR_LOAD_FILE_FAIL 1000

/**
 *	@brief	加载成功
 */
#define CMNOTIF_LOAD_COMPLETE @"loadComplete"

/**
 *	@brief	加载异常
 */
#define CMNOTIF_LOAD_ERROR @"loadError"

/**
 *	@brief	加载进度
 */
#define CMNOTIF_LOAD_PROGRESS @"loadProgress"

/**
 *	@brief	图片数据
 */
#define CMNOTIF_KEY_DATA @"data"

/**
 *	@brief	异常
 */
#define CMNOTIF_KEY_ERROR @"error"

/**
 *	@brief	总字节数
 */
#define CMNOTIF_KEY_TOTAL_BYTES @"totalBytes"

/**
 *	@brief	加载字节数
 */
#define CMNOTIF_KEY_LOADED_BYTES @"loadedBytes"

/**
 *	@brief	加载器状态
 */
typedef enum
{
	CMLoaderStateUnSet,      /**< 尚未设置值 */
    CMLoaderStateLoading,   /**< 加载中 */
    CMLoaderStateReady      /**< 加载完毕，准备就绪 */
}
CMLoaderState;

/**
 *	@brief	图片来源
 */
typedef enum
{
	CMLoaderSourceTypeCache,    /**< 缓存 */
    CMLoaderSourceTypeUrl,      /**< 网络 */
    CMLoaderSourceTypeFile		/**< 文件 */
}
CMLoaderSourceType;

/**
 *	@brief	加载器
 */
@interface CMLoader : CMEventDispatcher <NSURLConnectionDelegate,
                                         NSURLConnectionDataDelegate>
{
@private
	CMLoaderState _state;
    CMLoaderSourceType _sourceType;
	
	NSURLConnection *_conn;
	NSMutableData *_receiveData;    //接收数据对象
	NSURLResponse *_response;       //请求回复
    
    NSString *_key;                 //加载器标识，唯一标识一个资源
    NSInteger _contentLength;  //图片大小(单位：字节)
}

/**
 *	@brief	加载状态
 */
@property (nonatomic,readonly) CMLoaderState state;

/**
 *	@brief	来源类型
 */
@property (nonatomic,readonly) CMLoaderSourceType sourceType;

/**
 *	@brief	加载数据
 */
@property (nonatomic,readonly) NSData *data;

/**
 *	@brief	加载器标识，唯一标识一个资源
 */
@property (nonatomic,readonly) NSString *key;

/**
 *	@brief	初始化加载器
 *
 *	@param 	key 	加载标识
 *
 *	@return	加载器实例
 */
- (id)initWithKey:(NSString *)key;

/**
 *	@brief	加载网络图片对象
 *
 *	@param 	url 	URL
 */
- (void)loadByUrl:(NSURL *)url;

/**
 *	@brief	加载本地图片对象
 *
 *	@param 	path 	路径
 */
- (void)loadByPath:(NSString *)path;

/**
 *	@brief	加载缓存图片对象
 *
 *	@param 	data 	数据对象
 */
- (void)loadByCache:(NSData *)data;



@end
