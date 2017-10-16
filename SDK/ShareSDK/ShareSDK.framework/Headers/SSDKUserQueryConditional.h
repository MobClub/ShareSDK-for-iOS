//
//  SSDKUserQuery.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/6.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户查询条件
 */
@interface SSDKUserQueryConditional : NSObject

/**
 *  创建用户标识查询条件
 *
 *  @param uid 用户标识
 *
 *  @return 查询条件对象
 */
+ (SSDKUserQueryConditional *)userQueryConditionalByUserId:(NSString *)uid;

/**
 *  创建用户名称查询条件
 *
 *  @param userName 用户名称
 *
 *  @return 查询条件对象
 */
+ (SSDKUserQueryConditional *)userQueryConditionalByUserName:(NSString *)userName;

/**
 *  创建用户路径查询条件
 *
 *  @param path 用户主页路径
 *
 *  @return 查询条件对象
 */
+ (SSDKUserQueryConditional *)userQueryConditionalByPath:(NSString *)path;

@end
