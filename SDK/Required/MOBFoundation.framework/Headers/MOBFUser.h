//
//  MOBFUser.h
//  MOBFoundation
//
//  Created by 冯鸿杰 on 17/3/17.
//  Copyright © 2017年 MOB. All rights reserved.
//

#import <MOBFoundation/MOBFoundation.h>
#import "IMOBFUser.h"
#import "MOBFDataModel.h"

/**
 用户信息
 */
@interface MOBFUser : MOBFDataModel <IMOBFUser>

/**
 用户标识
 */
@property (nonatomic, copy, readonly) NSString *uid;

/**
 用户头像
 */
@property (nonatomic, copy) NSString *avatar;

/**
 用户昵称
 */
@property (nonatomic, copy) NSString *nickname;

/**
 创建第三方用户信息

 @param uid 用户标识，能够表示你的用户唯一性的标识
 @param avatar 用户头像地址
 @param nickname 用户名称
 @return 用户信息
 */
+ (MOBFUser *)userWithUid:(NSString *)uid avatar:(NSString *)avatar nickname:(NSString *)nickname;

@end
