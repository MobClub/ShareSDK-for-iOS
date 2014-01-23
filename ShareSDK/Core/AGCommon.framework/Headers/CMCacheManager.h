//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "CMLoader.h"

/**
 *	@brief	Cache Manager.
 */
@interface CMCacheManager : NSObject
{
	//加载队列，尚未从网络获取本地加载完毕的将会进入此队列。
	NSMutableArray *_loaderQueue;
	//缓存路径
	NSString *_cachePath;
}

/**
 *	@brief	Load file.
 *
 *	@param 	url 	File URL object.
 *
 *	@return	Loader object.
 */
- (CMLoader *)load:(NSURL *)url;


@end
