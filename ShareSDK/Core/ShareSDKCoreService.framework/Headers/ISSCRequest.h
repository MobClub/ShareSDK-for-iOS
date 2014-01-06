//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSCAccount.h"
#import "ISSCParameters.h"

/**
 *	@brief	请求协议
 */
@protocol ISSCRequest <NSObject>

/**
 *	@brief	获取登录帐号
 *
 *	@return	登录帐号
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	添加请求头参数
 *
 *	@param 	header  参数头名称
 *	@param 	value   参数值
 */
- (void)addHeader:(NSString *)header value:(NSString *)value;

/**
 *	@brief	以GET方式进行数据提交
 *
 *	@param 	path 	提交路径
 *  @param  parameters  参数
 *  @param  userData    附加数据
 *  @param  result  返回回调方法
 *  @param  fault   错误回调方法
 */
- (void)get:(NSString *)path
 parameters:(id<ISSCParameters>)parameters
   userData:(id)userData
     result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
      fault:(void(^)(NSError *error))fault;

/**
 *	@brief	以POST方式进行数据提交
 *
 *	@param 	path 	提交路径
 *  @param  parameters  参数
 *  @param  userData    附加数据
 *  @param  result  返回回调方法
 *  @param  fault   错误回调方法
 */
- (void)post:(NSString *)path
  parameters:(id<ISSCParameters>)parameters
    userData:(id)userData
      result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
       fault:(void(^)(NSError *error))fault;

/**
 *	@brief	以POST方式并以multipart形式进行数据提交
 *
 *	@param 	path 	提交路径
 *  @param  parameters  参数
 *  @param  userData    附加数据
 *  @param  result  返回回调方法
 *  @param  fault   错误回调方法
 */
- (void)multipartPost:(NSString *)path
           parameters:(id<ISSCParameters>)parameters
             userData:(id)userData
               result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
                fault:(void(^)(NSError *error))fault;

/**
 *	@brief	以DELETE方式进行数据提交
 *
 *	@param 	path 	提交路径
 *	@param 	parameters 	参数
 *	@param 	userData 	附加数据
 *  @param  result      返回回调方式
 *  @param  fault       错误回调方法
 */
- (void)del:(NSString *)path
 parameters:(id<ISSCParameters>)parameters
   userData:(id)userData
     result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
      fault:(void(^)(NSError *error))fault;

/**
 *	@brief	发送请求
 *
 *	@param 	request 	请求对象
 *	@param 	userData 	附加数据
 *  @param  result      返回回调方式
 *  @param  fault       错误回调方法
 */
- (void)sendRequest:(NSMutableURLRequest *)request
           userData:(id)userData
             result:(void(^)(NSHTTPURLResponse *response, NSData *responseData))result
              fault:(void(^)(NSError *error))fault;

/**
 *	@brief	取消请求
 */
- (void)cancel;

@end
