///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "SSTwitterEntitiesReader.h"

@class SSTwitterTweetsReader;

///#begin zh-cn
/**
 *	@brief	用户信息读取器
 */
///#end
///#begin en
/**
 *	@brief	User Reader.
 */
///#end
@interface SSTwitterUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

///#begin zh-cn
/**
 *	@brief	源数据
 */
///#end
///#begin en
/**
 *	@brief	Raw data
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

///#begin zh-cn
/**
 *	@brief	表示用户启用“贡献者模式”，让用户所发布的tweet同步到另一个帐户。
 */
///#end
///#begin en
/**
 *	@brief	Said user to enable "contributor Mode", allowing users to synchronize tweet released to another account.
 */
///#end
@property (nonatomic,readonly) BOOL contributorsEnabled;

///#begin zh-cn
/**
 *	@brief	帐号创建时间
 */
///#end
///#begin en
/**
 *	@brief	Created time.
 */
///#end
@property (nonatomic,readonly) NSString *createdAt;

///#begin zh-cn
/**
 *	@brief	如果为true，表示用户没有改变用户配置文件的主题或背景的。
 */
///#end
///#begin en
/**
 *	@brief	If true, indicates that the user does not change the user profile theme or background.
 */
///#end
@property (nonatomic,readonly) BOOL defaultProfile;

///#begin zh-cn
/**
 *	@brief	如果为true，表示该用户还没有上传自己的头像,默认的鸡蛋头像代替。
 */
///#end
///#begin en
/**
 *	@brief	If true, indicates that the user has not upload your own avatar, the default egg avatar instead.
 */
///#end
@property (nonatomic,readonly) BOOL defaultProfileImage;

///#begin zh-cn
/**
 *	@brief	用户描述
 */
///#end
///#begin en
/**
 *	@brief	User description.
 */
///#end
@property (nonatomic,readonly) NSString *description;

///#begin zh-cn
/**
 *	@brief	已解析的URL或由用户定义的描述字段的实体。
 */
///#end
///#begin en
/**
 *	@brief	URL parsed entity or by a user-defined description of the field.
 */
///#end
@property (nonatomic,readonly) SSTwitterEntitiesReader *entities;

///#begin zh-cn
/**
 *	@brief	收藏数量
 */
///#end
///#begin en
/**
 *	@brief	Favourites number.
 */
///#end
@property (nonatomic,readonly) NSInteger favouritesCount;

///#begin zh-cn
/**
 *	@brief	如果为true，表示关注此用户时需要发送关注请求
 */
///#end
///#begin en
/**
 *	@brief	If true, expressed the need to send a follow request Watch this user
 */
///#end
@property (nonatomic,readonly) BOOL followRequestSent;

///#begin zh-cn
/**
 *	@brief	如果为true，表示当前授权用户关注了此用户
 */
///#end
///#begin en
/**
 *	@brief	If true, indicates that the current authorized user concerns of the user
 */
///#end
@property (nonatomic,readonly) BOOL following;

///#begin zh-cn
/**
 *	@brief	粉丝数量
 */
///#end
///#begin en
/**
 *	@brief	Fans number.
 */
///#end
@property (nonatomic,readonly) NSInteger followersCount;

///#begin zh-cn
/**
 *	@brief	关注数量
 */
///#end
///#begin en
/**
 *	@brief	Friends number.
 */
///#end
@property (nonatomic,readonly) NSInteger friendsCount;

///#begin zh-cn
/**
 *	@brief	启用地理位置标识，发送tweet时如果需要附带地理位置，则此值必须为true
 */
///#end
///#begin en
/**
 *	@brief	Enable location identification, if necessary with a location, this value must be true when sending tweet
 */
///#end
@property (nonatomic,readonly) BOOL geoEnabled;

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
@property (nonatomic,readonly) long long Id;

///#begin zh-cn
/**
 *	@brief	用户ID字符串
 */
///#end
///#begin en
/**
 *	@brief	User id string.
 */
///#end
@property (nonatomic,readonly) NSString *idStr;

///#begin zh-cn
/**
 *	@brief	When true, indicates that the user is a participant in Twitter's
 */
///#end
///#begin en
/**
 *	@brief	When true, indicates that the user is a participant in Twitter's
 */
///#end
@property (nonatomic,readonly) BOOL isTranslator;

///#begin zh-cn
/**
 *	@brief	用户自定义的接口语言编码, 有可能会影响Tweet内容的编码
 */
///#end
///#begin en
/**
 *	@brief	 user-defined interface language, may affect the Tweet content encoding
 */
///#end
@property (nonatomic,readonly) NSString *lang;

///#begin zh-cn
/**
 *	@brief	公共列表成员数量
 */
///#end
///#begin en
/**
 *	@brief	listed count.
 */
///#end
@property (nonatomic,readonly) NSInteger listedCount;

///#begin zh-cn
/**
 *	@brief	在个人帐号中定义的位置信息
 */
///#end
///#begin en
/**
 *	@brief	Location information as defined in the personal account
 */
///#end
@property (nonatomic,readonly) NSString *location;

///#begin zh-cn
/**
 *	@brief	用户名称
 */
///#end
///#begin en
/**
 *	@brief	Name.
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	已过时。表示授权用户是否选择了通过短信收到该用户的Tweets
 */
///#end
///#begin en
/**
 *	@brief	Deprecated。Indicates whether the authorized user to receive the user's chosen via SMS Tweets
 */
///#end
@property (nonatomic,readonly) BOOL notifications;

///#begin zh-cn
/**
 *	@brief	个人资料页的背景颜色（16进制颜色值）
 */
///#end
///#begin en
/**
 *	@brief	Profile background color（hexadecimal color value）
 */
///#end
@property (nonatomic,readonly) NSString *profileBackgroundColor;

///#begin zh-cn
/**
 *	@brief	个人资料页的背景图像(基于HTTP)
 */
///#end
///#begin en
/**
 *	@brief	Profile background image URL(HTTP)
 */
///#end
@property (nonatomic,readonly) NSString *profileBackgroundImageUrl;

///#begin zh-cn
/**
 *	@brief	个人资料页的背景图像(基于HTTPS)
 */
///#end
///#begin en
/**
 *	@brief	Profile background image URL(HTTPS)
 */
///#end
@property (nonatomic,readonly) NSString *profileBackgroundImageUrlHttps;

///#begin zh-cn
/**
 *	@brief	如果为true，表示该用户设置的profile_background_image_url应该是平铺显示。
 */
///#end
///#begin en
/**
 *	@brief	If true, indicates that the user settings profile_background_image_url should be tiled.
 */
///#end
@property (nonatomic,readonly) BOOL profileBackgroundTile;

///#begin zh-cn
/**
 *	@brief	个人资料的Banner路径（基于HTTPS）
 */
///#end
///#begin en
/**
 *	@brief	Profile banner URL（HTTPS）
 */
///#end
@property (nonatomic,readonly) NSString *profileBannerUrl;

///#begin zh-cn
/**
 *	@brief	用户头像(基于HTTP)
 */
///#end
///#begin en
/**
 *	@brief	Profile image URL(HTTP)
 */
///#end
@property (nonatomic,readonly) NSString *profileImageUrl;

///#begin zh-cn
/**
 *	@brief	用户头像(基于HTTPS)
 */
///#end
///#begin en
/**
 *	@brief	Profile image URL (HTTPS)
 */
///#end
@property (nonatomic,readonly) NSString *profileImageUrlHttps;

///#begin zh-cn
/**
 *	@brief	个人资料链接颜色（16进制颜色值）
 */
///#end
///#begin en
/**
 *	@brief	Profile link color（hexadecimal color value）
 */
///#end
@property (nonatomic,readonly) NSString *profileLinkColor;

///#begin zh-cn
/**
 *	@brief	个人资料页侧栏边框线颜色（16进制颜色值）
 */
///#end
///#begin en
/**
 *	@brief	Profile sidebar border color（hexadecimal color value）
 */
///#end
@property (nonatomic,readonly) NSString *profileSidebarBorderColor;

///#begin zh-cn
/**
 *	@brief	个人资料页侧栏填充颜色（16进制颜色值）
 */
///#end
///#begin en
/**
 *	@brief	Profile page sidebar fill color (hexadecimal color value)
 */
///#end
@property (nonatomic,readonly) NSString *profileSidebarFillColor;

///#begin zh-cn
/**
 *	@brief	个人资料页的文本颜色（16进制颜色值）
 */
///#end
///#begin en
/**
 *	@brief	Profile text color (hexadecimal color value)
 */
///#end
@property (nonatomic,readonly) NSString *profileTextColor;

///#begin zh-cn
/**
 *	@brief	为true时表示用户使用自己上传的背景图
 */
///#end
///#begin en
/**
 *	@brief	Is true, said users upload their own background
 */
///#end
@property (nonatomic,readonly) BOOL profileUseBackgroundImage;

///#begin zh-cn
/**
 *	@brief	为true表示tweets将被保护
 */
///#end
///#begin en
/**
 *	@brief	True to tweets will be protected
 */
///#end
@property (nonatomic,readonly) BOOL Protected;

///#begin zh-cn
/**
 *	@brief	屏幕显示名称，唯一
 */
///#end
///#begin en
/**
 *	@brief	Screen name，Unique
 */
///#end
@property (nonatomic,readonly) NSString *screenName;

///#begin zh-cn
/**
 *	@brief	Indicates that the user would like to see media inline
 */
///#end
///#begin en
/**
 *	@brief	Indicates that the user would like to see media inline
 */
///#end
@property (nonatomic,readonly) BOOL showAllInlineMedia;

///#begin zh-cn
/**
 *	@brief	最近一条Tweet或者Retweet
 */
///#end
///#begin en
/**
 *	@brief	Recently a Tweet or Retweet
 */
///#end
@property (nonatomic,readonly) SSTwitterTweetsReader *status;

///#begin zh-cn
/**
 *	@brief	tweet数量
 */
///#end
///#begin en
/**
 *	@brief	Statuses count.
 */
///#end
@property (nonatomic,readonly) NSInteger statusesCount;

///#begin zh-cn
/**
 *	@brief	时区
 */
///#end
///#begin en
/**
 *	@brief	time zone
 */
///#end
@property (nonatomic,readonly) NSString *timeZone;

///#begin zh-cn
/**
 *	@brief	个人主页
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
 *	@brief	时区偏移量（单位：秒）
 */
///#end
///#begin en
/**
 *	@brief	UTC offset（unit：seconds）
 */
///#end
@property (nonatomic,readonly) NSInteger utcOffset;

///#begin zh-cn
/**
 *	@brief	为ture表示认证帐号
 */
///#end
///#begin en
/**
 *	@brief	Is true indicates verified.
 */
///#end
@property (nonatomic,readonly) BOOL verified;

///#begin zh-cn
/**
 *	@brief	When present, indicates a textual representation of the two-letter country codes this user is withheld from.
 */
///#end
///#begin en
/**
 *	@brief	When present, indicates a textual representation of the two-letter country codes this user is withheld from.
 */
///#end
@property (nonatomic,readonly) NSString *withheldInCountries;

///#begin zh-cn
/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
///#end
///#begin en
/**
 *	@brief	When present, indicates whether the content being withheld is the "status" or a "user."
 */
///#end
@property (nonatomic,readonly) NSString *withheldScope;

///#begin zh-cn
/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
- (id)initWithSourceData:(NSDictionary *)sourceData;

///#begin zh-cn
/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSTwitterUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
