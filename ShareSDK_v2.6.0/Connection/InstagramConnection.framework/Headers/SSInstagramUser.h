//
//  SSinstagramUser.h
//  InstagramConnection
//
//  Created by 冯 鸿杰 on 13-10-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSInstagramCredential.h"
#import "SSInstagramCounts.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>

/**
 *	@brief	用户信息
 */
@interface SSInstagramUser : NSObject <ISSPlatformUser,
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
