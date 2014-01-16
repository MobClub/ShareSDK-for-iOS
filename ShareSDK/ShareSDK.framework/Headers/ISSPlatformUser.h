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

@protocol ISSPlatformApp;
@protocol ISSPlatformCredential;

/**
 *	@brief	平台用户协议
 */
@protocol ISSPlatformUser <NSObject>

@required

/**
 *	@brief	获取用户所属应用
 *
 *	@return	应用信息对象
 */
- (id<ISSPlatformApp>)app;

/**
 *	@brief	获取授权凭证
 *
 *	@return	授权凭证
 */
- (id<ISSPlatformCredential>)credential;

/**
 *	@brief	设置授权凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(id<ISSPlatformCredential>)credential;

/**
 *	@brief	获取用户的原始数据信息，与各个平台定义的用户信息结构相同
 *
 *	@return	原始数据信息
 */
- (NSDictionary *)sourceData;

/**
 *	@brief	设置用户的原始数据信息
 *
 *	@param 	sourceData 	原始数据信息
 */
- (void)setSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	获取用户所属平台类型
 *
 *	@return	平台类型
 */
- (ShareType)type;

/**
 *	@brief	获取用户ID
 *
 *	@return	用户ID
 */
- (NSString *)uid;

/**
 *	@brief	获取用户昵称
 *
 *	@return	用户昵称
 */
- (NSString *)nickname;

/**
 *	@brief	获取用户个人头像
 *
 *	@return	个人头像路径
 */
- (NSString *)profileImage;

/**
 *	@brief	获取用户性别
 *
 *	@return	性别：0 男； 1 女； 2 未知
 */
- (NSInteger)gender;

/**
 *	@brief	获取用户个人主页
 *
 *	@return	个人主页地址
 */
- (NSString *)url;

/**
 *	@brief	获取用户个人简介
 *
 *	@return	个人简介
 */
- (NSString *)aboutMe;

/**
 *	@brief	获取用户认证类型
 *
 *	@return	认证类型：－1 未知； 0 未认证； 1 认证。
 */
- (NSInteger)verifyType;

/**
 *	@brief	获取用户认证信息
 *
 *	@return	认证信息
 */
- (NSString *)verifyReason;

/**
 *	@brief	获取用户生日（单位：秒）
 *
 *	@return	生日
 */
- (NSString *)birthday;

/**
 *	@brief	获取用户粉丝数
 *
 *	@return	粉丝数量
 */
- (NSInteger)followerCount;

/**
 *	@brief	获取用户关注数
 *
 *	@return	关注数量
 */
- (NSInteger)friendCount;

/**
 *	@brief	获取用户分享数
 *
 *	@return	分享数量
 */
- (NSInteger)shareCount;

/**
 *	@brief	获取用户的注册时间（单位：秒）
 *
 *	@return	注册时间
 */
- (NSTimeInterval)regAt;

/**
 *	@brief	获取用户等级
 *
 *	@return	等级
 */
- (NSInteger)level;

/**
 *	@brief	获取用户的教育信息列表
 *
 *	@return	教育信息列表
 */
- (NSArray *)educations;

/**
 *	@brief	获取用户的职业信息列表
 *
 *	@return	职业信息列表
 */
- (NSArray *)works;

@end
