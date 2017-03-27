//
//  SSDKUser_Private.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/3/16.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <ShareSDK/SSDKUser.h>

@interface SSDKUser () <NSCoding>

/**
 *  初始化用户信息
 *
 *  @param object JSON对象
 *
 *  @return 用户信息
 */
- (instancetype)initWithJsonObject:(NSDictionary *)object;

/**
 *  创建用户信息
 *
 *  @param object JSON对象
 *
 *  @return 用户信息
 */
+ (SSDKUser *)userWithJsonObject:(NSDictionary *)object;

/**
 *  转换为JSON对象
 *
 *  @param user 用户信息
 *
 *  @return JSON对象
 */
+ (NSDictionary *)jsonObjectWithUser:(SSDKUser *)user;

@end
