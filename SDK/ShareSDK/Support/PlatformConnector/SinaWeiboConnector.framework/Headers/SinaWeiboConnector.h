//
//  SinaWeiboConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  新浪微博连接器
 */
@interface SinaWeiboConnector : NSObject

/**
 *  连接微博API以供ShareSDK可以使用微博客户端来分享内容，不调用此方法也不会影响应用内分享、授权等相关功能。
 *
 *  @param weiboClass 微博SDK中的类型，应先导入libWeiboSDK.a,再传入[WeiboSDK class]到此参数.
 */
+ (void)connect:(Class)weiboSDKClass;

@end
