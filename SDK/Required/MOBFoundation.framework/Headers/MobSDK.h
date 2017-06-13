//
//  MobSDK.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/2/23.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 MobSDK
 */
@interface MobSDK : NSObject

/**
 获取版本号

 @return 版本号
 */
+ (NSString *)version;

/**
 获取应用标识
 
 @return 应用标识
 */
+ (NSString *)appKey;

/**
 获取应用密钥

 @return 应用密钥
 */
+ (NSString *)appSecret;

/**
 变更应用密钥，针对服务器刷新应用密钥后，可以通过该方法进行修改

 @param appSecret 应用密钥
 */
+ (void)changeAppSecret:(NSString *)appSecret;

@end
