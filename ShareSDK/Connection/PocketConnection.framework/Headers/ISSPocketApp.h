//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSPocketUser.h"
#import "SSPocketErrorInfo.h"
#import "SSPocketCredential.h"
#import "SSPocketItem.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Pocket App Protocol.
 */
@protocol ISSPocketApp <ISSPlatformApp>

/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
- (NSString *)consumerKey;

/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Add an item.
 *
 *	@param 	url 	URL string.
 *	@param 	title 	Title string. If the url parameter specified in the link title is not available, then use this parameter.
 *	@param 	tags 	A comma-separated list of tags
 *	@param 	tweetId 	If you support Twitter logged in, you can specify a tweet's ID, when adding text to display the contents of the original tweet.
 *  @param  result  Result handler.
 */
- (void)addItemWithUrl:(NSString *)url
                 title:(NSString *)title
                  tags:(NSString *)tags
               tweetId:(NSString *)tweetId
                result:(SSShareResultEvent)result;


@end
