//
//  DingTalkConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/29.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  钉钉连接器
 */
@interface DingTalkConnector : NSObject

/**
 *  链接钉钉以供ShareSDK可以正常使用钉钉进行分享
 *
 *  @param dtOpenApiClass 钉钉 SDK中的类型，应先导入DTShareKit.framework，再将[DTOpenAPI class]传入到此参数。
 */
+ (void)connect:(Class)dtOpenApiClass;

@end
