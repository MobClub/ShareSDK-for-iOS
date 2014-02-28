//
//  SSCUrlCachePool.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-5-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCUrl.h"

/**
 *	@brief	URL缓存池，用于加快转换短链效率减少网络请求次数。
 */
@interface SSCUrlCachePool : NSObject
{
@private
    NSMutableDictionary *_cacheData;
}

/**
 *	@brief	添加URL缓存
 *
 *	@param 	url 	链接对象
 */
- (void)addUrl:(SSCUrl *)url;

/**
 *	@brief	获取URL信息
 *
 *	@param 	url 	源链接地址
 *
 *	@return	URL信息,如果不存在缓存则返回nil
 */
- (SSCUrl *)getUrl:(NSString *)url;


@end
