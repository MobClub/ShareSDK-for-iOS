//
//  MOBFImageServiceTypeDef.h
//  MOBFoundation
//
//  Created by fenghj on 15/6/8.
//  Copyright (c) 2015年 MOB. All rights reserved.
//

#ifndef MOBFoundation_MOBFImageServiceTypeDef_h
#define MOBFoundation_MOBFImageServiceTypeDef_h

@class UIImage;

/**
 *  图片加载返回事件
 *
 *  @param imageData 图片数据
 */
typedef void (^MOBFImageServiceResultHandler) (NSData *imageData) __deprecated;

/**
 *  图片加载失败事件
 *
 *  @param error 错误信息
 */
typedef void (^MOBFImageServiceFailHandler) (NSError *error) __deprecated;

/**
 *  图片加载中事件
 */
typedef void (^MOBFImageServiceLoadingHandler) () __deprecated;

/**
 *  图片加载返回
 *
 *  @param image 图片对象
 *  @param error 错误信息
 */
typedef void (^MOBFImageGetterResultHandler) (UIImage *image, NSError *error);

#endif
