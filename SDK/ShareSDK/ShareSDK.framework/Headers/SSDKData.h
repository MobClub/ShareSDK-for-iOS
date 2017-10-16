//
//  SSDKData.h
//  ShareSDK
//
//  Created by fenghj on 15/6/5.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  数据
 */
@interface SSDKData : NSObject

/**
 *  初始化数据
 *
 *  @param URL 数据的地址
 *
 *  @return 数据对象
 */
- (id)initWithURL:(NSURL *)URL;

/**
 *  初始化数据
 *
 *  @param data 原始数据对象
 *
 *  @return 数据对象
 */
- (id)initWithData:(NSData *)data;

@end
