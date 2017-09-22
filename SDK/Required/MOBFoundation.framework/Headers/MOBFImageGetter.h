//
//  MOBFImageGetter.h
//  MOBFoundation
//
//  Created by fenghj on 16/1/21.
//  Copyright © 2016年 MOB. All rights reserved.
//

#import "MOBFImageObserver.h"
#import "MOBFImageServiceTypeDef.h"
#import <Foundation/Foundation.h>

@class MOBFImageCachePolicy;

/**
 *  图片获取器
 */
@interface MOBFImageGetter : NSObject

/**
 *  获取共享图片服务实例
 *
 *  @return 图片服务实例
 */
+ (instancetype)sharedInstance;

/**
 初始化图片服务实例

 @param cachePolicy 缓存策略
 @return 图片服务实例
 */
- (instancetype)initWithCachePolicy:(MOBFImageCachePolicy *)cachePolicy;

/**
 *  是否存在图片缓存
 *
 *  @param url 图片URL
 *
 *  @return YES 表示图片已缓存，NO 图片未缓存
 */
- (BOOL)existsImageCacheWithURL:(NSURL *)url;

/**
 *  获取图片
 *
 *  @param url           图片路径
 *  @param resultHandler 返回事件
 *
 *  @return 服务观察者
 */
- (MOBFImageObserver *)getImageWithURL:(NSURL *)url
                                result:(MOBFImageGetterResultHandler)resultHandler;


/**
 获取图片数据

 @param url           图片路径
 @param resultHandler 返回事件

 @return 服务观察者
 */
- (MOBFImageObserver *)getImageDataWithURL:(NSURL *)url
                                    result:(MOBFImageDataGetterResultHandler)resultHandler;

/**
 *  移除图片观察者
 *
 *  @param imageObserver 图片观察者
 */
- (void)removeImageObserver:(MOBFImageObserver *)imageObserver;

@end
