//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSohuCredential.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	搜狐用户
 */
@interface SSSohuUser : NSObject <ISSPlatformUser,
                                  NSCoding,
                                  ISSCDataObject>
/**
 *	@brief	所属平台
 */
@property (nonatomic,readonly) id<ISSPlatformApp> app;

/**
 *	@brief	授权信息，如果为nil则表示非当前应用授权用户
 */
@property (nonatomic,retain) id<ISSPlatformCredential> credential;

/**
 *	@brief	用户的原始数据信息，与各个平台定义的用户信息结构相同
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	平台类型
 */
@property (nonatomic,readonly) ShareType type;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	用户昵称
 */
@property (nonatomic,readonly) NSString *nickname;

/**
 *	@brief	个人头像路径
 */
@property (nonatomic,readonly) NSString *profileImage;

/**
 *	@brief	性别：0 男； 1 女； 2 未知
 */
@property (nonatomic,readonly) NSInteger gender;

/**
 *	@brief	个人主页地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	个人简介
 */
@property (nonatomic,readonly) NSString *aboutMe;

/**
 *	@brief	认证类型：－1 未知； 0 未认证； 1 认证
 */
@property (nonatomic,readonly) NSInteger verifyType;

/**
 *	@brief	认证信息
 */
@property (nonatomic,readonly) NSString *verifyReason;

/**
 *	@brief	用户生日（单位：秒）
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	用户粉丝数
 */
@property (nonatomic,readonly) NSInteger followerCount;

/**
 *	@brief	用户关注数
 */
@property (nonatomic,readonly) NSInteger friendCount;

/**
 *	@brief	用户分享数
 */
@property (nonatomic,readonly) NSInteger shareCount;

/**
 *	@brief	用户的注册时间（单位：秒）
 */
@property (nonatomic,readonly) NSTimeInterval regAt;

/**
 *	@brief	用户等级
 */
@property (nonatomic,readonly) NSInteger level;

/**
 *	@brief	用户的教育信息列表
 */
@property (nonatomic,readonly) NSArray *educations;

/**
 *	@brief	用户的职业信息列表
 */
@property (nonatomic,readonly) NSArray *works;

/**
 *	@brief	初始化化用户信息
 *
 *	@param 	app 	应用信息
 *
 *	@return	用户信息对象
 */
- (id)initWithApp:(id<ISSPlatformApp>)app;

@end
