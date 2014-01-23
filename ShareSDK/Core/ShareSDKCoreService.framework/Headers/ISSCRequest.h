//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSCAccount.h"
#import "ISSCParameters.h"

/**
 *	@brief	Request protocol
 */
@protocol ISSCRequest <NSObject>

/**
 *	@brief	Get account.
 *
 *	@return	Account object.
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	Add request header
 *
 *	@param 	header  Header name.
 *	@param 	value   Header value.
 */
- (void)addHeader:(NSString *)header value:(NSString *)value;

/**
 *	@brief	Send request by GET mehtod
 *
 *	@param 	path 	Request path.
 *  @param  parameters  Parameters object.
 *  @param  userData    User data.
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)get:(NSString *)path
 parameters:(id<ISSCParameters>)parameters
   userData:(id)userData
     result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
      fault:(void(^)(NSError *error))fault;

/**
 *	@brief	Send request by POST mehtod
 *
 *	@param 	path 	Request path.
 *  @param  parameters  Parameters object.
 *  @param  userData    User data.
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)post:(NSString *)path
  parameters:(id<ISSCParameters>)parameters
    userData:(id)userData
      result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
       fault:(void(^)(NSError *error))fault;

/**
 *	@brief	Send request by POST mehtod and multipart form data submitted
 *
 *	@param 	path 	Request path.
 *  @param  parameters  Parameters object.
 *  @param  userData    User data.
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)multipartPost:(NSString *)path
           parameters:(id<ISSCParameters>)parameters
             userData:(id)userData
               result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
                fault:(void(^)(NSError *error))fault;

/**
 *	@brief	Send request by DELETE method
 *
 *	@param 	path 	Request path.
 *	@param 	parameters 	Parameters object.
 *	@param 	userData 	User data.
 *  @param  result      Result handler.
 *  @param  fault       Fault handler.
 */
- (void)del:(NSString *)path
 parameters:(id<ISSCParameters>)parameters
   userData:(id)userData
     result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
      fault:(void(^)(NSError *error))fault;

/**
 *	@brief	Send request.
 *
 *	@param 	request 	Request object.
 *	@param 	userData 	User data.
 *  @param  result      Result handler.
 *  @param  fault       Fault handler.
 */
- (void)sendRequest:(NSMutableURLRequest *)request
           userData:(id)userData
             result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
              fault:(void(^)(NSError *error))fault;

/**
 *	@brief	Cancel request.
 */
- (void)cancel;

@end
