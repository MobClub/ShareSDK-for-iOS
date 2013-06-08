//
//  CMCacheManager.h
//  Common
//
//  Created by 冯 鸿杰 on 13-6-6.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMLoader.h"

/**
 *	@brief	缓存管理器
 */
@interface CMCacheManager : NSObject
{
	//加载队列，尚未从网络获取本地加载完毕的将会进入此队列。
	NSMutableArray *_loaderQueue;
	//缓存路径
	NSString *_cachePath;
}

- (CMLoader *)load:(NSURL *)url;

@end
