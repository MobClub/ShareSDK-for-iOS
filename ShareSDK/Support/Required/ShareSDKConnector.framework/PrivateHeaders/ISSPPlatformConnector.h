//
//  ISSPPlatformConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/29.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

@protocol ISSPPlatformConnector <NSObject>

@required

/**
 *  表示平台是否已经连接
 *
 *  @return YES 连接，NO 尚未连接
 */
+ (BOOL)isConnected;

@end
