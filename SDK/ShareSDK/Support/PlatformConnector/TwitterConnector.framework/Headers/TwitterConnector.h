//
//  TwitterConnector.h
//  TwitterConnector
//
//  Created by Max on 2018/6/20.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterConnector : NSObject

/**
 设置 twitter 获取用户信息,分享 的接口版本。
 @param ver 获取用户信息，分享 的接口版本 ver=1,2。 默认使用twitter 的 V1.x 接口=1,使用twitter 相关的V2接口=2
 */
+ (void)setAuthVersion:(NSString*)ver;

@end
