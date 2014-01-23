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
 *	@brief	HTTP result notification.
 */
#define NOTIF_HTTP_RESULT @"httpResult"

/**
 *	@brief	HTTP error notification.
 */
#define NOTIF_HTTP_ERROR @"httpError"

/**
 *	@brief	Cache data notification.
 */
#define NOTIF_HTTP_CACHE_DATA @"httpCacheData"

/**
 *	@brief	Response key.
 */
#define NOTIF_HTTP_KEY_RESPONSE @"nhkResponse"

/**
 *	@brief	Response data key.
 */
#define NOTIF_HTTP_KEY_RESPONSE_DATA @"nhkResponseData"

/**
 *	@brief	Error key.
 */
#define NOTIF_HTTP_KEY_ERROR @"nhkError"

/**
 *	@brief	User data key.
 */
#define NOTIF_HTTP_KEY_USER_DATA @"nhkUserData"

/**
 *	@brief	Cache data key.
 */
#define NOTIF_HTTP_KEY_CACHE_DATA @"nhkCacheData"


@class CMHTTPToken;

/**
 *	@brief	HTTP Worker.
 */
@protocol ICMHTTPWorker <NSObject>

@required

/**
 *	@brief	HTTP result
 *
 *	@param 	token Token object.
 */
- (void)httpResult:(CMHTTPToken *)token;

/**
 *	@brief	HTTP cache data result.
 *
 *	@param 	token 	Token object.
 *  @param  cacheData   Cache data
 */
- (void)httpCacheResult:(CMHTTPToken *)token cacheData:(NSString *)cacheData;

/**
 *	@brief	HTTP fault
 *
 *	@param 	token Token object.
 */
- (void)httpFault:(CMHTTPToken *)token;

/**
 *	@brief	Whether to allow access to cache data
 *
 *	@param 	token 	Token object.
 *
 *	@return	YES means allowing access to, NO indicates get data from the specified URL
 */
- (BOOL)httpShouldGetCacheData:(CMHTTPToken *)token;

/**
 *	@brief	Get cache data.
 *
 *	@param 	token 	Token.
 *
 *	@return	Cache data string.
 */
- (NSString *)httpCacheData:(CMHTTPToken *)token;


@end

/**
 *	@brief	HTTP Token.
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
 *	@brief	Use cache response, YES indicates used， NO indicates no used.
 */
@property (nonatomic) BOOL useCacheResponse;

/**
 *	@brief	Request object.
 */
@property (nonatomic,readonly) NSMutableURLRequest *request;

/**
 *	@brief	Response object.
 */
@property (nonatomic,readonly) NSHTTPURLResponse *response;

/**
 *	@brief	Response data.
 */
@property (nonatomic,readonly) NSData *responseData;

/**
 *	@brief	Error information.
 */
@property (nonatomic,readonly) NSError *error;

/**
 *	@brief	User data.
 */
@property (nonatomic,readonly) id userData;

/**
 *	@brief	Create a HTTP token.
 *
 *	@param 	urlString 	URL String.
 *	@param 	userData 	User data.
 *	@param 	worker 	Worker, if the parameter is not passed for default handling. Note: that this parameter will be internal references, do not pass the parent object of the Token object.
 *
 *	@return	HTTP Token object.
 */
+ (CMHTTPToken *)tokenWithUrlString:(NSString *)urlString
                         userData:(id)userData
                           worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	Greate a HTTP token.
 *
 *	@param 	url 	URL object.
 *	@param 	userData 	User data.
 *	@param 	worker 	Worker, if the parameter is not passed for default handling. Note: that this parameter will be internal references, do not pass the parent object of the Token object.
 *
 *	@return	HTTP Token object.
 */
+ (CMHTTPToken *)tokenWithUrl:(NSURL *)url
                   userData:(id)userData
                     worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	Create a HTTP Token.
 *
 *	@param 	request 	Request object.
 *	@param 	userData 	User data.
 *	@param 	worker 	Worker, if the parameter is not passed for default handling. Note: that this parameter will be internal references, do not pass the parent object of the Token object.
 *
 *	@return	HTTP Token object.
 */
+ (CMHTTPToken *)tokenWithRequest:(NSMutableURLRequest *)request
                       userData:(id)userData
                         worker:(id<ICMHTTPWorker>)worker;


/**
 *	@brief	Initialize token.
 *
 *	@param 	url 	URL object.
 *	@param 	userData 	User data.
 *	@param 	worker 	Worker, if the parameter is not passed for default handling. Note: that this parameter will be internal references, do not pass the parent object of the Token object.
 *
 *	@return	Token object.
 */
- (id)initWithURL:(NSURL *)url
         userData:(id)userData
           worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	Initialize token.
 *
 *	@param 	urlString 	URL string.
 *	@param 	userData 	User data.
 *	@param 	worker 	Worker, if the parameter is not passed for default handling. Note: that this parameter will be internal references, do not pass the parent object of the Token object.
 *
 *	@return	Token object.
 */
- (id)initWithURLString:(NSString *)urlString
               userData:(id)userData
                 worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	Initialize token.
 *
 *	@param 	request 	Request object.
 *	@param 	userData 	User data.
 *  @param  worker      Worker, if the parameter is not passed for default handling. Note: that this parameter will be internal references, do not pass the parent object of the Token object.
 *
 *	@return	Token object.
 */
- (id)initWithRequest:(NSMutableURLRequest *)request
             userData:(id)userData
               worker:(id<ICMHTTPWorker>)worker;

/**
 *	@brief	Start request.
 */
- (void)start;

/**
 *	@brief	Cancel request.
 */
- (void)cancelRequest;

/**
 *	@brief	Get response string.
 *
 *	@param 	encoding 	Encoding
 *
 *	@return	Response string.
 */
- (NSString *)responseString:(NSStringEncoding)encoding;


@end

