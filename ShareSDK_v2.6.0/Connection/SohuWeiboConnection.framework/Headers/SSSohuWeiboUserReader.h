//
//  SSSohuWeiboUserReader.h
//  SohuWeiboConnection
//
//  Created by 冯 鸿杰 on 13-10-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	用户信息读取器
 */
@interface SSSohuWeiboUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

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
@property (nonatomic,readonly) NSString *createdAt;

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
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSSohuWeiboUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
