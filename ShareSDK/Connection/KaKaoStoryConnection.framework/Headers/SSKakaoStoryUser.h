//
//  SSKakaoStoryUser.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/17.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSKakaoStoryCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *  KakaoStory用户信息
 */
@interface SSKakaoStoryUser : NSObject<ISSPlatformUser,
                                       NSCoding,
                                       ISSCDataObject>

///#begin zh-cn
/**
 *	@brief	所属平台
 */
///#end
///#begin en
/**
 *	@brief	The app object.
 */
///#end
@property (nonatomic,assign) id<ISSPlatformApp> app;

///#begin zh-cn
/**
 *	@brief	授权信息，如果为nil则表示非当前应用授权用户
 */
///#end
///#begin en
/**
 *	@brief	Authorization information, if it is nil, said non-current authorized users
 */
///#end
@property (nonatomic,strong) id<ISSPlatformCredential> credential;

///#begin zh-cn
/**
 *	@brief	用户的原始数据信息，与各个平台定义的用户信息结构相同
 */
///#end
///#begin en
/**
 *	@brief	Raw data，Information structure with the same user-defined for each platform
 */
///#end
@property (nonatomic,strong) NSDictionary *sourceData;

///#begin zh-cn
/**
 *	@brief	平台类型
 */
///#end
///#begin en
/**
 *	@brief	Platform type.
 */
///#end
@property (nonatomic,readonly) ShareType type;

///#begin zh-cn
/**
 *	@brief	用户ID
 */
///#end
///#begin en
/**
 *	@brief	User id.
 */
///#end
@property (nonatomic,readonly) NSString *uid;

///#begin zh-cn
/**
 *	@brief	用户昵称
 */
///#end
///#begin en
/**
 *	@brief	Nickname.
 */
///#end
@property (nonatomic,readonly) NSString *nickname;

///#begin zh-cn
/**
 *	@brief	个人头像路径
 */
///#end
///#begin en
/**
 *	@brief	Avatar path.
 */
///#end
@property (nonatomic,readonly) NSString *profileImage;

///#begin zh-cn
/**
 *	@brief	性别：0 男； 1 女； 2 未知
 */
///#end
///#begin en
/**
 *	@brief	Gender：0 Male； 1 Female； 2 Unknown.
 */
///#end
@property (nonatomic,readonly) NSInteger gender;

///#begin zh-cn
/**
 *	@brief	个人主页地址
 */
///#end
///#begin en
/**
 *	@brief	Personal homepage.
 */
///#end
@property (nonatomic,readonly) NSString *url;

///#begin zh-cn
/**
 *	@brief	个人简介
 */
///#end
///#begin en
/**
 *	@brief	Profile.
 */
///#end
@property (nonatomic,readonly) NSString *aboutMe;

///#begin zh-cn
/**
 *	@brief	认证类型：－1 未知； 0 未认证； 1 认证
 */
///#end
///#begin en
/**
 *	@brief	Verify type：－1 Unknown； 0 Not certified； 1 Certified
 */
///#end
@property (nonatomic,readonly) NSInteger verifyType;

///#begin zh-cn
/**
 *	@brief	认证信息
 */
///#end
///#begin en
/**
 *	@brief	Verify reason.
 */
///#end
@property (nonatomic,readonly) NSString *verifyReason;

///#begin zh-cn
/**
 *	@brief	用户生日（单位：秒）
 */
///#end
///#begin en
/**
 *	@brief	Birthday (unit: seconds)
 */
///#end
@property (nonatomic,readonly) NSString *birthday;

///#begin zh-cn
/**
 *	@brief	用户粉丝数
 */
///#end
///#begin en
/**
 *	@brief	Fans count.
 */
///#end
@property (nonatomic,readonly) NSInteger followerCount;

///#begin zh-cn
/**
 *	@brief	用户关注数
 */
///#end
///#begin en
/**
 *	@brief	Friends count.
 */
///#end
@property (nonatomic,readonly) NSInteger friendCount;

///#begin zh-cn
/**
 *	@brief	用户分享数
 */
///#end
///#begin en
/**
 *	@brief	The number of user to share.
 */
///#end
@property (nonatomic,readonly) NSInteger shareCount;

///#begin zh-cn
/**
 *	@brief	用户的注册时间（单位：秒）
 */
///#end
///#begin en
/**
 *	@brief	User registration time (unit: seconds)
 */
///#end
@property (nonatomic,readonly) NSTimeInterval regAt;

///#begin zh-cn
/**
 *	@brief	用户等级
 */
///#end
///#begin en
/**
 *	@brief	User level.
 */
///#end
@property (nonatomic,readonly) NSInteger level;

///#begin zh-cn
/**
 *	@brief	用户的教育信息列表
 */
///#end
///#begin en
/**
 *	@brief	Education information list of user
 */
///#end
@property (nonatomic,readonly) NSArray *educations;

///#begin zh-cn
/**
 *	@brief	用户的职业信息列表
 */
///#end
///#begin en
/**
 *	@brief	Career information list of user
 */
///#end
@property (nonatomic,readonly) NSArray *works;

///#begin zh-cn
/**
 *	@brief	初始化化用户信息
 *
 *	@param 	app 	应用信息
 *
 *	@return	用户信息对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize user information.
 *
 *	@param 	app 	The app object.
 *
 *	@return	User object.
 */
///#end
- (id)initWithApp:(id<ISSPlatformApp>)app;


@end
