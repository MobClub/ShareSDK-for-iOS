//
//  AliPayConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  支付宝连接器
 */
@interface AliPayConnector : NSObject

/**
 *  链接支付宝好友以供ShareSDK可以正常使用支付宝进行分享
 *
 *  @param apOpenApiClass 支付宝好友SDK中的类型，应先导入libAPOpenSdk.a，再将[APOpenApi class]传入到此参数。注：此参数不能为nil，否则会导致无法正常分享。
 */
+ (void)connect:(Class)apOpenApiClass;

@end
