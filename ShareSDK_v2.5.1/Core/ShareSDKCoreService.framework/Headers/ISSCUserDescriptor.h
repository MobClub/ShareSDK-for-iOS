//
//  ISSCOpenAppUser.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-26.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCTypeDef.h"

/**
 *	@brief	开放应用用户信息
 */
@protocol ISSCUserDescriptor <NSObject>

@required

/**
 *	@brief	获取用户ID
 *
 *	@return	用户ID
 */
- (NSString *)uid;

/**
 *	@brief	获取昵称
 *
 *	@return	昵称
 */
- (NSString *)nickname;

/**
 *	@brief	获取用户头像
 *
 *	@return	用户头像
 */
- (NSString *)icon;

/**
 *	@brief	获取性别，0 男； 1 女； 2 未知
 *
 *	@return	性别
 */
- (NSInteger)gender;

/**
 *	@brief	获取用户个人主页
 *
 *	@return	个人主页
 */
- (NSString *)url;

/**
 *	@brief	获取个人简介
 *
 *	@return 个人简介
 */
- (NSString *)aboutMe;

/**
 *	@brief	获取认证类型：－1 未知； 0 未认证； 1 认证。
 *
 *	@return	认证类型
 */
- (NSInteger)verifyType;

/**
 *	@brief	获取认证信息
 *
 *	@return	认证信息
 */
- (NSString *)verifyReason;

/**
 *	@brief	获取生日
 *
 *	@return	生日
 */
- (NSString *)birthday;

/**
 *	@brief	获取粉丝数
 *
 *	@return	粉丝数
 */
- (NSInteger)followerCount;

/**
 *	@brief	获取关注数
 *
 *	@return	关注数
 */
- (NSInteger)friendCount;

/**
 *	@brief	获取分享数
 *
 *	@return	分享数
 */
- (NSInteger)shareCount;

/**
 *	@brief	获取注册时间
 *
 *	@return	注册时间（秒）
 */
- (NSTimeInterval)regAt;

/**
 *	@brief	获取用户等级
 *
 *	@return	用户等级
 */
- (NSInteger)level;

/**
 *	@brief	获取教育信息
 *
 *	@return	教育信息
 */
- (NSArray *)educations;

/**
 *	@brief	获取职业信息
 *
 *	@return	职业信息
 */
- (NSArray *)works;

/**
 *	@brief	获取分享平台类型
 *
 *  @since  ver1.2.4
 *
 *	@return	分享平台类型
 */
- (SSCShareType)type;

/**
 *	@brief	获取于平台相关的用户信息，用户结构可以参考各个平台连接器中定义
 *
 *	@return	用户信息
 */
- (id)localUser;

/**
 *	@brief	获取源用户信息数据，此属性根据不同平台取得的用户信息结构不相同，详细请参考官方API文档描述。
 *
 *	@return	源用户信息数据
 */
- (NSDictionary *)sourceData;

@end
