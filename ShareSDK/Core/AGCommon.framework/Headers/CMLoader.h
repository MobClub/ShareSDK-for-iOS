///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "CMEventDispatcher.h"

///#begin zh-cn
/**
 *	@brief	加载器错误域
 */
///#end
///#begin en
/**
 *	@brief	Loader error domain.
 */
///#end
#define CMERROR_DOMAIN_LOADER @"LoaderErrorDomain"

///#begin zh-cn
/**
 *	@brief	加载文件失败
 */
///#end
///#begin en
/**
 *	@brief	Load file fail error code.
 */
///#end
#define CMERROR_LOAD_FILE_FAIL 1000

///#begin zh-cn
/**
 *	@brief	加载成功
 */
///#end
///#begin en
/**
 *	@brief	Load complete notification.
 */
///#end
#define CMNOTIF_LOAD_COMPLETE @"loadComplete"

///#begin zh-cn
/**
 *	@brief	加载异常
 */
///#end
///#begin en
/**
 *	@brief	Load error notification.
 */
///#end
#define CMNOTIF_LOAD_ERROR @"loadError"

///#begin zh-cn
/**
 *	@brief	加载进度
 */
///#end
///#begin en
/**
 *	@brief	Load progress notification.
 */
///#end
#define CMNOTIF_LOAD_PROGRESS @"loadProgress"

///#begin zh-cn
/**
 *	@brief	图片数据
 */
///#end
///#begin en
/**
 *	@brief	Data key notification.
 */
///#end
#define CMNOTIF_KEY_DATA @"data"

///#begin zh-cn
/**
 *	@brief	异常
 */
///#end
///#begin en
/**
 *	@brief	Error key.
 */
///#end
#define CMNOTIF_KEY_ERROR @"error"

///#begin zh-cn
/**
 *	@brief	总字节数
 */
///#end
///#begin en
/**
 *	@brief	Total bytes key.
 */
///#end
#define CMNOTIF_KEY_TOTAL_BYTES @"totalBytes"

///#begin zh-cn
/**
 *	@brief	加载字节数
 */
///#end
///#begin en
/**
 *	@brief	Loaded bytes key.
 */
///#end
#define CMNOTIF_KEY_LOADED_BYTES @"loadedBytes"

///#begin zh-cn
/**
 *	@brief	加载器状态
 */
///#end
///#begin en
/**
 *	@brief	Loader state.
 */
///#end
typedef enum
{
	CMLoaderStateUnSet,      /**< 尚未设置值 */
    CMLoaderStateLoading,   /**< 加载中 */
    CMLoaderStateReady      /**< 加载完毕，准备就绪 */
}
CMLoaderState;

///#begin zh-cn
/**
 *	@brief	图片来源
 */
///#end
///#begin en
/**
 *	@brief	Loader source type.
 */
///#end
typedef enum
{
	CMLoaderSourceTypeCache,    /**< 缓存 */
    CMLoaderSourceTypeUrl,      /**< 网络 */
    CMLoaderSourceTypeFile		/**< 文件 */
}
CMLoaderSourceType;

///#begin zh-cn
/**
 *	@brief	加载器
 */
///#end
///#begin en
/**
 *	@brief	Loader
 */
///#end
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

///#begin zh-cn
/**
 *	@brief	加载状态
 */
///#end
///#begin en
/**
 *	@brief	Loader status.
 */
///#end
@property (nonatomic,readonly) CMLoaderState state;

///#begin zh-cn
/**
 *	@brief	来源类型
 */
///#end
///#begin en
/**
 *	@brief	Source type.
 */
///#end
@property (nonatomic,readonly) CMLoaderSourceType sourceType;

///#begin zh-cn
/**
 *	@brief	加载数据
 */
///#end
///#begin en
/**
 *	@brief	Data object.
 */
///#end
@property (nonatomic,readonly) NSData *data;

///#begin zh-cn
/**
 *	@brief	加载器标识，唯一标识一个资源
 */
///#end
///#begin en
/**
 *	@brief	Loader key，Uniquely identifies a resource
 */
///#end
@property (nonatomic,readonly) NSString *key;

///#begin zh-cn
/**
 *	@brief	初始化加载器
 *
 *	@param 	key 	加载标识
 *
 *	@return	加载器实例
 */
///#end
///#begin en
/**
 *	@brief	Initialize Loader.
 *
 *	@param 	key 	Key string.
 *
 *	@return	Loader object.
 */
///#end
- (id)initWithKey:(NSString *)key;

///#begin zh-cn
/**
 *	@brief	加载网络数据对象
 *
 *	@param 	url 	URL
 */
///#end
///#begin en
/**
 *	@brief	Load data by URL.
 *
 *	@param 	url 	URL string.
 */
///#end
- (void)loadByUrl:(NSURL *)url;

///#begin zh-cn
/**
 *	@brief	加载本地图片对象
 *
 *	@param 	path 	路径
 */
///#end
///#begin en
/**
 *	@brief	Load data by path.
 *
 *	@param 	path 	Path string.
 */
///#end
- (void)loadByPath:(NSString *)path;

///#begin zh-cn
/**
 *	@brief	加载缓存数据对象
 *
 *	@param 	data 	数据对象
 */
///#end
///#begin en
/**
 *	@brief	Load data by cache.
 *
 *	@param 	data 	Data object
 */
///#end
- (void)loadByCache:(NSData *)data;


@end
