//
//  SSPWeChatConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  微信连接器
 */
@interface WeChatConnector : NSObject

/**
 *  链接微信API已供ShareSDK可以正常使用微信的相关功能（授权、分享）
 *
 *  @param weChatClass 微信SDK中的类型，应先导入libWXApi.a，再传入[WXApi class]到此参数。注：此参数不能为nil，否则会导致授权、分享无法正常使用
 *  @param delegate 对于需要获取微信回复或请求时传入该委托对象。该对象必须实现WXApiDelegate协议中的方法。
 */
+ (void)connect:(Class)wxApiClass;
+ (void)connect:(Class)wxApiClass delegate:(id)delegate;

@end
