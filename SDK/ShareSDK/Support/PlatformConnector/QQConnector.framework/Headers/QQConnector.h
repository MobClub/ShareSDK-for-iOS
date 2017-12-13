//
//  QQConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  QQ连接器
 */
@interface QQConnector : NSObject

/**
 *  连接QQAPI以供ShareSDK可以正常使用QQ或者QQ空间客户端来授权或者分享内容。
 *
 *  @param qqApiInterfaceClass QQSDK中的类型，应先导入TencentOpenAPI.framework，再传入[QQApiInterface class]到此参数。
 *  @param tencentOAuthClass   QQSDK中的类型，应先导入TencentOpenAPI.framework，再传入[TencentOAuth class]到此参数。
 */
+ (void)connect:(Class)qqApiInterfaceClass tencentOAuthClass:(Class)tencentOAuthClass;

@end
