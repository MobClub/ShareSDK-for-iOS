//
//  RenrenConnector.h
//  ShareSDKConnector
//
//  Created by 冯鸿杰 on 16/9/28.
//  Copyright © 2016年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  人人网连接器
 */
@interface RenrenConnector : NSObject

/**
 *  连接人人网SDK以供ShareSDK可以正常使用人人网客户端进行SSO授权。
 *
 *  @param rennClientClass 人人网SDK中的类型，应先导入RennSDK.framework,再传入[RennClient class]到此参数。
 */
+ (void)connect:(Class)rennClientClass;

@end
