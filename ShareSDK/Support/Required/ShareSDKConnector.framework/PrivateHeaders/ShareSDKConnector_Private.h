//
//  ShareSDKConnector_Private.h
//  ShareSDKConnector
//
//  Created by fenghj on 15/6/9.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <ShareSDKConnector/ShareSDKConnector.h>
#import "ISSPPlatformConnector.h"

@interface ShareSDKConnector ()

/**
 *  注册平台连接器
 *
 *  @param connector 连接器
 *  @param platformType 平台类型
 */
+ (void)registerConnector:(Class)connector
          forPlatformType:(SSDKPlatformType)platformType;

/**
 *  检测平台是否需要关联
 *
 *  @param platformType 平台类型
 *
 *  @return YES 需要关联，NO 不需要或者已经关联
 */
+ (BOOL)checkPlatformNeedConnect:(SSDKPlatformType)platformType;

/**
 *  检测缩略图，由于微信限制缩略图不能大于1M，此方法就是用于检测图片大小使用的方法。
 *
 *  @param thumbImageData 缩略图数据
 *
 *  @return 调整后缩略图数据
 */
+ (NSData *)checkThumbImageSize:(NSData *)thumbImageData;

/**
 *  获取图片数据
 *
 *  @param imagePath      图片路径
 *  @param thumbImagePath 缩略图路径
 *  @param handler        返回回调
 */
+ (void)getImage:(NSString *)imagePath
  thumbImagePath:(NSString *)thumbImagePath
          result:(void(^)(NSData *thumbImage, NSData *image))handler;
/**
 *  获取图片数据
 *
 *  @param url     图片路径
 *  @param handler 返回处理器
 */
+ (void)getImage:(NSURL *)url onResult:(void(^)(NSData *imageData))handler;


/**
 *  回调JS
 *
 *  @param callback   回调方法名称
 *  @param resultData 回调数据
 */
+ (void)callback:(NSString *)callback resultData:(NSDictionary *)resultData;

@end
