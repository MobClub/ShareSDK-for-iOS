//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSohuWeiboCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	用户信息
 */
@interface SSSohuWeiboUser : NSObject <NSCoding,
                                       ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSSohuWeiboCredential *_credential;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSSohuWeiboCredential *credential;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	昵称
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	姓名（未使用，有可能会被作为个性域名使用）
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	地区（暂无）
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	个人简介
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	个人主页（暂无）
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	用户头像
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	勿扰（暂无）
 */
@property (nonatomic,readonly) BOOL bProtected;

/**
 *	@brief	粉丝数
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	背景颜色（暂无）
 */
@property (nonatomic,readonly) NSString *profileBackgroundColor;

/**
 *	@brief	文字颜色（暂无）
 */
@property (nonatomic,readonly) NSString *profileTextColor;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *profileLinkColor;

/**
 *	@brief	侧栏颜色（暂无）
 */
@property (nonatomic,readonly) NSString *profileSidebarFillColor;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *profileSidebarBorderColor;

/**
 *	@brief	关注数
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) NSDate *createdAt;

/**
 *	@brief	收藏数
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	偏移值（暂无）
 */
@property (nonatomic,readonly) NSString *utcOffset;

/**
 *	@brief	时区（暂无）
 */
@property (nonatomic,readonly) NSString *timeZone;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *profileBackgroundImageUrl;

/**
 *	@brief	通知（暂无）
 */
@property (nonatomic,readonly) NSString *notifications;

/**
 *	@brief	是否支持地理位置
 */
@property (nonatomic,readonly) BOOL geoEnabled;

/**
 *	@brief	微博数
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	是否关注
 */
@property (nonatomic,readonly) BOOL following;

/**
 *	@brief	是否认证
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	语言
 */
@property (nonatomic,readonly) NSString *lang;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL contributorsEnabled;

/**
 *	@brief	性别,1 男  0  女。
 */
@property (nonatomic,readonly) NSInteger gender;


/**
 *	@brief	创建搜狐微博用户信息
 *
 *	@param 	response 	回复对象
 *
 *	@return	用户信息
 */
+ (SSSohuWeiboUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
