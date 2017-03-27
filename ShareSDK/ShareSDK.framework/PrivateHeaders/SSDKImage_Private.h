//
//  SSDKImage_Private.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/25.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <ShareSDK/SSDKImage.h>

@interface SSDKImage ()

/**
 *  文件路径
 */
@property (nonatomic, strong) NSURL *URL;

/**
 *  通过对象来转化图片对象
 *
 *  @param object 原始对象，可以为UIImage、SSDKImage、NSURL或者NSString
 *
 *  @return 图片对象
 */
+ (instancetype)imageWithObject:(id)object;

@end
