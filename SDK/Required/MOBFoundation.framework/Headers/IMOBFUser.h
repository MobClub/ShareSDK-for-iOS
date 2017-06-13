//
//  IJIMUser.h
//  Jimu
//
//  Created by 冯鸿杰 on 17/2/10.
//  Copyright © 2017年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMOBFDataModel.h"

/**
 用户信息协议
 */
@protocol IMOBFUser <IMOBFDataModel>

/**
 获取用户令牌

 @return 令牌
 */
- (NSString *)token;

/**
 获取用户ID

 @return 用户ID
 */
- (NSString *)uid;

/**
 获取用户头像

 @return 头像
 */
- (NSString *)avatar;

/**
 获取用户昵称

 @return 昵称
 */
- (NSString *)nickname;

/**
 获取头像列表，包含不同尺寸的头像地址

 @return 头像列表信息
 */
- (id<IMOBFDataModel>)avatars;

/**
 获取性别

 @return 性别
 */
- (id)gender;

/**
 获取生日

 @return 生日
 */
- (NSDate *)birthday;

/**
 获取年龄

 @return 年龄
 */
- (NSInteger)age;

/**
 获取星座

 @return 星座
 */
- (id)constellation;

/**
 获取生肖

 @return 生肖
 */
- (id)zodiac;

/**
 获取国家

 @return 国家
 */
- (id)country;

/**
 获取省份

 @return 省份
 */
- (id)province;

/**
 获取城市

 @return 城市
 */
- (id)city;

/**
 *  签名（500个字符以内）
 */
- (NSString *)signature;

/**
 *  邮件
 */
- (NSString *)email;

/**
 *  地址（500个字符以内）
 */
- (NSString *)address;

/**
 *  邮编
 */
- (NSInteger)zipCode;

/**
 *  个人说明（800个字符以内）
 */
- (NSString *)resume;

/**
 *  手机号
 */
- (NSString *)phone;

/**
 *  手机区号
 */
- (NSString *)phoneZone;

/**
 *  自定义字段
 */
- (id<IMOBFDataModel>)customInfo;

@end
