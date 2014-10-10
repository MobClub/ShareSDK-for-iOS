//
//  SSCServerRequest.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-3-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <AGCommon/CMErrorInfo.h>

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "ISSCParameters.h"
#else
#import "../Headers/ISSCParameters.h"
#endif

@class SSCServerInterfaceToken;

/**
 *	@brief	服务器请求
 */
@interface SSCServerRequest : NSObject
{
@private
    SSCServerInterfaceToken *_token;
    id _result;
    BOOL _retainSelf;
}

/**
 *	@brief	GET方式提交
 *
 *	@param 	path 	路径
 *	@param 	parameters 	参数
 *  @param  parseData   通过解析数据来判断返回状态, YES 表示需要解析数据（默认）。NO 表示不需要解析，直接根据statusCode来判断
 *	@param 	userData 	附加数据
 *  @param  result  返回回调
 */
- (void)get:(NSString *)path
 parameters:(id<ISSCParameters>)parameters
  parseData:(BOOL)parseData
   userData:(id)userData
     result:(void (^)(BOOL result, NSDictionary *responder, CMErrorInfo *error))result;

/**
 *	@brief	POST方式提交
 *
 *	@param 	path 	路径
 *	@param 	parameters 	参数
 *  @param  parseData   通过解析数据来判断返回状态, YES 表示需要解析数据（默认）。NO 表示不需要解析，直接根据statusCode来判断
 *	@param 	userData 	附加数据
 *  @param  result  返回回调
 */
- (void)post:(NSString *)path
  parameters:(id<ISSCParameters>)parameters
   parseData:(BOOL)parseData
    userData:(id)userData
      result:(void (^)(BOOL result, NSDictionary *responder, CMErrorInfo *error))result;

/**
 *	@brief	POST方式并且以multipart形式提交
 *
 *	@param 	path 	路径
 *	@param 	parameters 	参数
 *  @param  parseData   通过解析数据来判断返回状态, YES 表示需要解析数据（默认）。NO 表示不需要解析，直接根据statusCode来判断
 *	@param 	userData 	附加数据
 *  @param  result  返回回调
 */
- (void)multipartPost:(NSString *)path
           parameters:(id<ISSCParameters>)parameters
            parseData:(BOOL)parseData
             userData:(id)userData
               result:(void (^)(BOOL result, NSDictionary *responder, CMErrorInfo *error))result;

/**
 *	@brief	取消请求
 */
- (void)cancel;


@end
