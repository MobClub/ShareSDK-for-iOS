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
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSPocketUser.h"
#import "SSPocketErrorInfo.h"
#import "SSPocketCredential.h"
#import "SSPocketItem.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	Pocket应用协议
 */
///#end
///#begin en
/**
 *	@brief	Pocket App Protocol.
 */
///#end
@protocol ISSPocketApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
///#end
- (NSString *)consumerKey;

///#begin zh-cn
/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
///#end
///#begin en
/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
///#end
- (void)api:(NSString *)path
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

///#begin zh-cn
/**
 *	@brief	添加一个项目
 *
 *	@param 	url 	你要保存的链接
 *	@param 	title 	链接标题，如果指定的url参数链接中无法取得标题，则使用此参数。
 *	@param 	tags 	一个以逗号分隔的标签列表
 *	@param 	tweetId 	如果你支持Twitter登录，那么你可以指定一个tweet的ID，时加入的文字中显示原始的tweet内容。
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Add an item.
 *
 *	@param 	url 	URL string.
 *	@param 	title 	Title string. If the url parameter specified in the link title is not available, then use this parameter.
 *	@param 	tags 	A comma-separated list of tags
 *	@param 	tweetId 	If you support Twitter logged in, you can specify a tweet's ID, when adding text to display the contents of the original tweet.
 *  @param  result  Result handler.
 */
///#end
- (void)addItemWithUrl:(NSString *)url
                 title:(NSString *)title
                  tags:(NSString *)tags
               tweetId:(NSString *)tweetId
                result:(SSShareResultEvent)result;


@end
