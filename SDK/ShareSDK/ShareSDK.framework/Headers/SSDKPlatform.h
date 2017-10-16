//
//  SSDKPlatform.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/6.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDKTypeDefine.h"

/**
 *  分享平台信息
 */
@interface SSDKPlatform : NSObject

/**
 *  平台类型
 */
@property (nonatomic) SSDKPlatformType type;

/**
 *  平台名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  平台图标
 */
@property (nonatomic, retain) UIImage *icon;

@end
