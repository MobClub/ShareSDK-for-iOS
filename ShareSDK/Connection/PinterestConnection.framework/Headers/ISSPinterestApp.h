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
#import "SSPinterestErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Pinterest App Protocol.
 */
@protocol ISSPinterestApp <ISSPlatformApp>

/**
 *	@brief	Get client id.
 *
 *	@return	Client id.
 */
- (NSString *)clientId;

/**
 *	@brief	Share content.
 *
 *	@param 	image 	Image object，Pictures only allows network path
 *	@param 	url 	URL string.
 *	@param 	description 	Description.
 *  @param  result  Result handler.
 */
- (void)createPinWithImage:(id<ISSCAttachment>)image
                       url:(NSString *)url
               description:(NSString *)description
                    result:(SSShareResultEvent)result;


@end
