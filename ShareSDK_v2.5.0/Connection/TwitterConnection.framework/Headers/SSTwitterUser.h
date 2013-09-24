//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSTwitterEntities.h"
#import "SSTwitterCredential.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/ISSCUserDescriptor.h>

@class SSTwitterTweets;

/**
 *	@brief	用户信息
 */
@interface SSTwitterUser : NSObject <NSCoding,
                                     ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSTwitterCredential *_credential;
}

/**
 *	@brief	表示用户启用“贡献者模式”，让用户所发布的tweet同步到另一个帐户。
 */
@property (nonatomic,readonly) BOOL contributorsEnabled;

/**
 *	@brief	帐号创建时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	如果为true，表示用户没有改变用户配置文件的主题或背景的。
 */
@property (nonatomic,readonly) BOOL defaultProfile;

/**
 *	@brief	如果为true，表示该用户还没有上传自己的头像,默认的鸡蛋头像代替。
 */
@property (nonatomic,readonly) BOOL defaultProfileImage;

/**
 *	@brief	用户描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	已解析的URL或由用户定义的描述字段的实体。
 */
@property (nonatomic,readonly) SSTwitterEntities *entities;

/**
 *	@brief	收藏数量
 */
@property (nonatomic,readonly) NSInteger favouritesCount;

/**
 *	@brief	如果为true，表示关注此用户时需要发送关注请求
 */
@property (nonatomic,readonly) BOOL followRequestSent;

/**
 *	@brief	如果为true，表示当前授权用户关注了此用户
 */
@property (nonatomic,readonly) BOOL following;

/**
 *	@brief	粉丝数量
 */
@property (nonatomic,readonly) NSInteger followersCount;

/**
 *	@brief	关注数量
 */
@property (nonatomic,readonly) NSInteger friendsCount;

/**
 *	@brief	启用地理位置标识，发送tweet时如果需要附带地理位置，则此值必须为true
 */
@property (nonatomic,readonly) BOOL geoEnabled;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	用户ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	When true, indicates that the user is a participant in Twitter's
 */
@property (nonatomic,readonly) BOOL isTranslator;

/**
 *	@brief	用户自定义的接口语言编码, 有可能会影响Tweet内容的编码
 */
@property (nonatomic,readonly) NSString *lang;

/**
 *	@brief	公共列表成员数量
 */
@property (nonatomic,readonly) NSInteger listedCount;

/**
 *	@brief	在个人帐号中定义的位置信息
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	已过时。表示授权用户是否选择了通过短信收到该用户的Tweets
 */
@property (nonatomic,readonly) BOOL notifications;

/**
 *	@brief	个人资料页的背景颜色（16进制颜色值）
 */
@property (nonatomic,readonly) NSString *profileBackgroundColor;

/**
 *	@brief	个人资料页的背景图像(基于HTTP)
 */
@property (nonatomic,readonly) NSString *profileBackgroundImageUrl;

/**
 *	@brief	个人资料页的背景图像(基于HTTPS)
 */
@property (nonatomic,readonly) NSString *profileBackgroundImageUrlHttps;

/**
 *	@brief	如果为true，表示该用户设置的profile_background_image_url应该是平铺显示。
 */
@property (nonatomic,readonly) BOOL profileBackgroundTile;

/**
 *	@brief	个人资料的Banner路径（基于HTTPS）
 */
@property (nonatomic,readonly) NSString *profileBannerUrl;

/**
 *	@brief	用户头像(基于HTTP)
 */
@property (nonatomic,readonly) NSString *profileImageUrl;

/**
 *	@brief	用户头像(基于HTTPS)
 */
@property (nonatomic,readonly) NSString *profileImageUrlHttps;

/**
 *	@brief	个人资料链接颜色（16进制颜色值）
 */
@property (nonatomic,readonly) NSString *profileLinkColor;

/**
 *	@brief	个人资料页侧栏边框线颜色（16进制颜色值）
 */
@property (nonatomic,readonly) NSString *profileSidebarBorderColor;

/**
 *	@brief	个人资料页侧栏填充颜色（16进制颜色值）
 */
@property (nonatomic,readonly) NSString *profileSidebarFillColor;

/**
 *	@brief	个人资料页的文本颜色（16进制颜色值）
 */
@property (nonatomic,readonly) NSString *profileTextColor;

/**
 *	@brief	为true时表示用户使用自己上传的背景图
 */
@property (nonatomic,readonly) BOOL profileUseBackgroundImage;

/**
 *	@brief	为true表示tweets将被保护
 */
@property (nonatomic,readonly) BOOL Protected;

/**
 *	@brief	屏幕显示名称，唯一
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	Indicates that the user would like to see media inline
 */
@property (nonatomic,readonly) BOOL showAllInlineMedia;

/**
 *	@brief	最近一条Tweet或者Retweet
 */
@property (nonatomic,readonly) SSTwitterTweets *status;

/**
 *	@brief	tweet数量
 */
@property (nonatomic,readonly) NSInteger statusesCount;

/**
 *	@brief	时区
 */
@property (nonatomic,readonly) NSString *timeZone;

/**
 *	@brief	个人主页
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	时区偏移量（单位：秒）
 */
@property (nonatomic,readonly) NSInteger utcOffset;

/**
 *	@brief	为ture表示认证帐号
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	When present, indicates a textual representation of the two-letter country codes this user is withheld from.
 */
@property (nonatomic,readonly) NSString *withheldInCountries;

/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
@property (nonatomic,readonly) NSString *withheldScope;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSTwitterCredential *credential;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	用户信息
 */
+ (SSTwitterUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
