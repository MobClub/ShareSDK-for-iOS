//
//  HTTPToken.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMEventDispatcher.h"

/**
 *	@brief	HTTP返回通知
 */
#define NOTIF_HTTP_RESULT @"httpResult"

/**
 *	@brief	HTTP错误通知
 */
#define NOTIF_HTTP_ERROR @"httpError"

/**
 *	@brief	缓存数据
 */
#define NOTIF_HTTP_CACHE_DATA @"httpCacheData"

/**
 *	@brief	回复对象
 */
#define NOTIF_HTTP_KEY_RESPONSE @"nhkResponse"

/**
 *	@brief	回复数据
 */
#define NOTIF_HTTP_KEY_RESPONSE_DATA @"nhkResponseData"

/**
 *	@brief	请求异常
 */
#define NOTIF_HTTP_KEY_ERROR @"nhkError"

/**
 *	@brief	附加数据标识
 */
#define NOTIF_HTTP_KEY_USER_DATA @"nhkUserData"

/**
 *	@brief	缓存数据标识
 */
#define NOTIF_HTTP_KEY_CACHE_DATA @"nhkCacheData"


@class CMHTTPToken;

/**
 *	@brief	Http处理器
 */
@protocol ICMHTTPWorker <NSObject>

@required

/**
 *	@brief	http返回
 *
 *	@param 	token 令牌
 */
- (void)httpResult:(CMHTTPToken *)token;

/**
 *	@brief	http缓存返回
 *
 *	@param 	token 	令牌
 *  @param  cacheData   缓存数据
 */
- (void)httpCacheResult:(CMHTTPToken *)token cacheData:(NSString *)cacheData;


/**
 *	@brief	http错误
 *
 *	@param 	token 令牌
 */
- (void)httpFault:(CMHTTPToken *)token;

/**
 *	@brief	是否允许获取缓存数据
 *
 *	@param 	token 	令牌
 *
 *	@return	YES 表示允许获取，NO 表示从指定URL中获取数据
 */
- (BOOL)httpShouldGetCacheData:(CMHTTPToken *)token;

/**
 *	@brief	获取缓存数据
 *
 *	@param 	token 	令牌
 *
 *	@return	缓存数据
 */
- (NSString *)httpCacheData:(CMHTTPToken *)token;


@end

/**
 *	@brief	HTTP令牌
 */
@interface CMHTTPToken : CMEventDispatcher <NSURLConnectionDelegate,
                                            NSURLConnectionDataDelegate>
{
@private
    NSMutableURLRequest *_request;
    NSURLConnection *_connection;
    NSHTTPURLResponse *_response;
    
    NSMutableData *_responseData;
    NSError *_error;
    
    id _userData;
    id<ICMHTTPWorker> _worker;
    BOOL _useCacheResponse;
}

/**
 *	@brief	使用缓存回复, YES 表示使用， NO 表示不使用
 */
@property (nonatomic) BOOL useCacheResponse;


/**
 *	@brief	请求对象
 */
@property (nonatomic,readonly) NSMutableURLRequest *request;

/**
 *	@brief	请求回复对象
 */
@property (nonatomic,readonly) NSHTTPURLResponse *response;

/**
 *	@brief	回复数据
 */
@property (nonatomic,readonly) NSData *responseData;

/**
 *	@brief	请求错误对象
 */
@property (nonatomic,readonly) NSError *error;

/**
 *	@brief	附加数据
 */
@property (nonatomic,readonly) id userData;

/**
 *	@brief	获取HTTP令牌
 *
 *	@param 	urlString 	请求地址字符串
 *	@param 	userData 	附加数据
 *	@param 	worker 	处理器，如果传入该参数则不进行默认处理。注意，此参数会在内部引用，切勿传入该Token对象的父级对象。
 *
 *	@return	HTTP令牌
 */
+ (CMHTTPToken *)tokenWithUrlString:(NSString *)urlString
                         userData:(id)userData
                           worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	获取HTTP令牌
 *
 *	@param 	url 	请求地址
 *	@param 	userData 	附加数据
 *	@param 	worker 	处理器，如果传入该参数则不进行默认处理。注意，此参数会在内部引用，切勿传入该Token对象的父级对象。
 *
 *	@return	HTTP令牌
 */
+ (CMHTTPToken *)tokenWithUrl:(NSURL *)url
                   userData:(id)userData
                     worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	获取HTTP令牌
 *
 *	@param 	request 	请求对象
 *	@param 	userData 	附加数据
 *	@param 	worker 	处理器，如果传入该参数则不进行默认处理。注意，此参数会在内部引用，切勿传入该Token对象的父级对象。
 *
 *	@return	HTTP令牌
 */
+ (CMHTTPToken *)tokenWithRequest:(NSMutableURLRequest *)request
                       userData:(id)userData
                         worker:(id<ICMHTTPWorker>)worker;



/**
 *	@brief	初始化令牌
 *
 *	@param 	url 	请求地址
 *	@param 	userData 	附加数据
 *	@param 	worker 	处理器，如果传入该参数则不进行默认处理。注意，此参数会在内部引用，切勿传入该Token对象的父级对象。
 *
 *	@return	令牌对象
 */
- (id)initWithURL:(NSURL *)url
         userData:(id)userData
           worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	初始化令牌
 *
 *	@param 	urlString 	请求地址字符串
 *	@param 	userData 	附加数据
 *	@param 	worker 	处理器，如果传入该参数则不进行默认处理。注意，此参数会在内部引用，切勿传入该Token对象的父级对象。
 *
 *	@return	令牌对象
 */
- (id)initWithURLString:(NSString *)urlString
               userData:(id)userData
                 worker:(id<ICMHTTPWorker>)worker;



/**
 *	@brief	初始化令牌
 *
 *	@param 	request 	请求对象
 *	@param 	userData 	附加数据
 *  @param  worker      处理器，如果传入该参数则不进行默认处理。注意，此参数会在内部引用，切勿传入该Token对象的父级对象。
 *
 *	@return	令牌对象
 */
- (id)initWithRequest:(NSMutableURLRequest *)request
             userData:(id)userData
               worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	开始请求
 */
- (void)start;

/**
 *	@brief	取消请求
 */
- (void)cancelRequest;

/**
 *	@brief	获取回复数据字符串
 *
 *	@param 	encoding 	编码
 *
 *	@return	数据字符串
 */
- (NSString *)responseString:(NSStringEncoding)encoding;


@end

