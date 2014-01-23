//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "CMEventDispatcher.h"

/**
 *	@brief	Loader error domain.
 */
#define CMERROR_DOMAIN_LOADER @"LoaderErrorDomain"

/**
 *	@brief	Load file fail error code.
 */
#define CMERROR_LOAD_FILE_FAIL 1000

/**
 *	@brief	Load complete notification.
 */
#define CMNOTIF_LOAD_COMPLETE @"loadComplete"

/**
 *	@brief	Load error notification.
 */
#define CMNOTIF_LOAD_ERROR @"loadError"

/**
 *	@brief	Load progress notification.
 */
#define CMNOTIF_LOAD_PROGRESS @"loadProgress"

/**
 *	@brief	Data key notification.
 */
#define CMNOTIF_KEY_DATA @"data"

/**
 *	@brief	Error key.
 */
#define CMNOTIF_KEY_ERROR @"error"

/**
 *	@brief	Total bytes key.
 */
#define CMNOTIF_KEY_TOTAL_BYTES @"totalBytes"

/**
 *	@brief	Loaded bytes key.
 */
#define CMNOTIF_KEY_LOADED_BYTES @"loadedBytes"

/**
 *	@brief	Loader state.
 */
typedef enum
{
	CMLoaderStateUnSet,      /**< 尚未设置值 */
    CMLoaderStateLoading,   /**< 加载中 */
    CMLoaderStateReady      /**< 加载完毕，准备就绪 */
}
CMLoaderState;

/**
 *	@brief	Loader source type.
 */
typedef enum
{
	CMLoaderSourceTypeCache,    /**< 缓存 */
    CMLoaderSourceTypeUrl,      /**< 网络 */
    CMLoaderSourceTypeFile		/**< 文件 */
}
CMLoaderSourceType;

/**
 *	@brief	Loader
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
 *	@brief	Loader status.
 */
@property (nonatomic,readonly) CMLoaderState state;

/**
 *	@brief	Source type.
 */
@property (nonatomic,readonly) CMLoaderSourceType sourceType;

/**
 *	@brief	Data object.
 */
@property (nonatomic,readonly) NSData *data;

/**
 *	@brief	Loader key，Uniquely identifies a resource
 */
@property (nonatomic,readonly) NSString *key;

/**
 *	@brief	Initialize Loader.
 *
 *	@param 	key 	Key string.
 *
 *	@return	Loader object.
 */
- (id)initWithKey:(NSString *)key;

/**
 *	@brief	Load data by URL.
 *
 *	@param 	url 	URL string.
 */
- (void)loadByUrl:(NSURL *)url;

/**
 *	@brief	Load data by path.
 *
 *	@param 	path 	Path string.
 */
- (void)loadByPath:(NSString *)path;

/**
 *	@brief	Load data by cache.
 *
 *	@param 	data 	Data object
 */
- (void)loadByCache:(NSData *)data;


@end
