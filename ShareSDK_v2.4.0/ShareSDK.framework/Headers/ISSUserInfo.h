//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareSDKTypeDef.h"

/**
 *	@brief	用户信息协议
 */
@protocol ISSUserInfo <NSObject>

@required

/**
 *	@brief	获取用户ID
 *
 *	@return	用户ID
 */
- (NSString *)uid;

/**
 *	@brief	获取性别；0:男 1:女 2:未知
 *
 *	@return	性别
 */
- (NSInteger)gender;

/**
 *	@brief	获取昵称
 *
 *	@return	昵称
 */
- (NSString *)nickname;

/**
 *	@brief	获取头像
 *
 *	@return	头像
 */
- (NSString *)icon;

/**
 *	@brief	获取生日
 *
 *	@return	生日
 */
- (NSDate *)birthday;

/**
 *	@brief	获取年龄
 *
 *	@return	年龄
 */
- (NSInteger)age;

/**
 *	@brief	获取手机号码
 *
 *	@return	手机号码
 */
- (NSString *)mobile;

/**
 *	@brief	获取认证信息
 *
 *	@return	认证信息
 */
- (NSString *)verify;

/**
 *	@brief	获取认证类型
 *
 *	@return	认证类型
 */
- (NSInteger)verifyType;

/**
 *	@brief	获取社区地址
 *
 *	@return	社区地址
 */
- (NSString *)url;

/**
 *	@brief	获取粉丝数量
 *
 *	@return	粉丝数量
 */
- (NSInteger)fansCount;

/**
 *	@brief	获取关注数量
 *
 *	@return	关注数量
 */
- (NSInteger)idolCount;

/**
 *	@brief	获取微博数量
 *
 *	@return	微博数量
 */
- (NSInteger)statusCount;

/**
 *	@brief	获取用户等级
 *
 *	@return	用户等级
 */
- (NSInteger)level;

/**
 *	@brief	获取学历信息
 *
 *	@return	学历
 */
- (NSString *)education;

/**
 *	@brief	获取学校信息
 *
 *	@return	学校
 */
- (NSString *)school;


/**
 *	@brief	获取职业信息
 *
 *	@return	职业
 */
- (NSString *)career;

/**
 *	@brief	获取个人描述
 *
 *	@return	个人描述
 */
- (NSString *)desc;

/**
 *	@brief	获取源用户信息数据，此属性根据不同平台取得的用户信息结构不相同，详细请参考官方API文档描述。
 *
 *	@return	源用户信息数据
 */
- (NSDictionary *)sourceData;

/**
 *	@brief	获取分享平台类型
 *
 *  @since  ver1.2.4
 *
 *	@return	分享平台类型
 */
- (ShareType)type;

/**
 *	@brief	获取于平台相关的用户信息，用户结构可以参考各个平台连接器中定义
 *
 *	@return	用户信息
 */
- (id)localUser;

@end
