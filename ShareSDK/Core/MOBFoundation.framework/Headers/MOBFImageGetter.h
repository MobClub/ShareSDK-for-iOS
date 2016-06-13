//
//  MOBFImageGetter.h
//  MOBFoundation
//
//  Created by fenghj on 16/1/21.
//  Copyright © 2016年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOBFImageServiceTypeDef.h"
#import "MOBFImageObserver.h"

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
 *  移除图片观察者
 *
 *  @param imageObserver 图片观察者
 */
- (void)removeImageObserver:(MOBFImageObserver *)imageObserver;

@end
