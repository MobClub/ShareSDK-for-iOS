//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ISSKaiXinApp.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	KaiXin Connection.
 */
@interface KaiXinConnection : NSObject <ISSPlatform>

/**
 *	@brief	Create an app configuration information.
 *
 *	@param 	apiKey 	API key.
 *	@param 	secretKey 	Secret key.
 *	@param 	redirectUri 	Recirect uri.
 *
 *	@return	App configuration information.
 */
- (NSDictionary *)appInfoWithApiKey:(NSString *)apiKey
                          secretKey:(NSString *)secretKey
                        redirectUri:(NSString *)redirectUri;

@end
