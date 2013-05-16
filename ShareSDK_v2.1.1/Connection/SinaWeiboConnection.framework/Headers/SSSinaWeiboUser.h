//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSinaWeiboCredential.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/ISSCUserDescriptor.h>

@class SSSinaWeiboStatus;

/**
 *	@brief	新浪微博用户信息
 */
@interface SSSinaWeiboUser : NSObject <NSCoding,
                                       ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSSinaWeiboCredential *_credential;
}

/**
 *	@brief	授权信息，如果为nil则表示非当前应用授权用户
 */
@property (nonatomic,retain) SSSinaWeiboCredential *credential;

/**
 *	@brief	字符串型的用户UID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	用户昵称
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	友好显示名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户所在省级ID
 */
@property (nonatomic,readonly) NSInteger province;

/**
 *	@brief	用户所在城市ID
 */
@property (nonatomic,readonly) NSInteger city;

/**
 *	@brief	用户所在地
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	用户个人描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	用户博客地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	用户头像地址，50×50像素
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	用户的微博统一URL地址
 */
@property (nonatomic,readonly) NSString *profileUrl;

/**
 *	@brief	用户的个性化域名
 */
@property (nonatomic,readonly) NSString *domain;

/**
 *	@brief	用户的微号
 */
@property (nonatomic,readonly) NSString *weihao;

/**
 *	@brief	性别，m：男、f：女、n：未知
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	粉丝数
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	关注数
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	微博数
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	收藏数
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	用户创建（注册）时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	暂未支持
 */
@property (nonatomic,readonly) BOOL following;

/**
 *	@brief	是否允许所有人给我发私信，true：是，false：否
 */
@property (nonatomic,readonly) BOOL allowAllActMsg;

/**
 *	@brief	是否允许标识用户的地理位置，true：是，false：否
 */
@property (nonatomic,readonly) BOOL geoEnabled;

/**
 *	@brief	是否是微博认证用户，即加V用户，true：是，false：否
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	暂未支持
 */
@property (nonatomic,readonly) NSInteger verifiedType;

/**
 *	@brief	用户备注信息，只有在查询用户关系时才返回此字段
 */
@property (nonatomic,readonly) NSString *remark;

/**
 *	@brief	用户的最近一条微博信息字段
 */
@property (nonatomic,readonly) SSSinaWeiboStatus *status;

/**
 *	@brief	是否允许所有人对我的微博进行评论，true：是，false：否
 */
@property (nonatomic,readonly) BOOL allowAllComment;

/**
 *	@brief	用户大头像地址
 */
@property (nonatomic,readonly) NSString *avatarLarge;

/**
 *	@brief	认证原因
 */
@property (nonatomic,readonly) NSString *verifiedReason;

/**
 *	@brief	该用户是否关注当前登录用户，true：是，false：否
 */
@property (nonatomic,readonly) BOOL followMe;

/**
 *	@brief	用户的在线状态，0：不在线、1：在线
 */
@property (nonatomic,readonly) NSInteger onlineStatus;

/**
 *	@brief	用户的互粉数
 */
@property (nonatomic,readonly) NSInteger biFollowersCount;

/**
 *	@brief	用户当前的语言版本，zh-cn：简体中文，zh-tw：繁体中文，en：英语
 */
@property (nonatomic,readonly) NSString *lang;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;


/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSSinaWeiboUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
