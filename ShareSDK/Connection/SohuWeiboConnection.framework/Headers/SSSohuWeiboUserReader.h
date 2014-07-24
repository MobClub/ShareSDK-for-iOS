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
@interface SSSohuWeiboUserReader : NSObject
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
 *	@brief	Raw data.
 */
///#end
@property (nonatomic,readonly) NSDictionary *sourceData;

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
 *	@brief	昵称
 */
///#end
///#begin en
/**
 *	@brief	Nickname.
 */
///#end
@property (nonatomic,readonly) NSString *screenName;

///#begin zh-cn
/**
 *	@brief	姓名（未使用，有可能会被作为个性域名使用）
 */
///#end
///#begin en
/**
 *	@brief	Name (not used, it may be used as a personalized domain name).
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	地区（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *location;

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
@property (nonatomic,readonly) NSString *description;

///#begin zh-cn
/**
 *	@brief	个人主页（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *url;

///#begin zh-cn
/**
 *	@brief	用户头像
 */
///#end
///#begin en
/**
 *	@brief	Avatar path.
 */
///#end
@property (nonatomic,readonly) NSString *profileImageUrl;

///#begin zh-cn
/**
 *	@brief	勿扰（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) BOOL bProtected;

///#begin zh-cn
/**
 *	@brief	粉丝数
 */
///#end
///#begin en
/**
 *	@brief	Fans count.
 */
///#end
@property (nonatomic,readonly) NSInteger followersCount;

///#begin zh-cn
/**
 *	@brief	背景颜色（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *profileBackgroundColor;

///#begin zh-cn
/**
 *	@brief	文字颜色（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *profileTextColor;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *profileLinkColor;

///#begin zh-cn
/**
 *	@brief	侧栏颜色（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *profileSidebarFillColor;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) NSString *profileSidebarBorderColor;

///#begin zh-cn
/**
 *	@brief	关注数
 */
///#end
///#begin en
/**
 *	@brief	Friends count.
 */
///#end
@property (nonatomic,readonly) NSInteger friendsCount;

///#begin zh-cn
/**
 *	@brief	创建时间
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
 *	@brief	收藏数
 */
///#end
///#begin en
/**
 *	@brief	Favorites count.
 */
///#end
@property (nonatomic,readonly) NSInteger favouritesCount;

///#begin zh-cn
/**
 *	@brief	偏移值（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) NSString *utcOffset;

///#begin zh-cn
/**
 *	@brief	时区（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) NSString *timeZone;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) NSString *profileBackgroundImageUrl;

///#begin zh-cn
/**
 *	@brief	通知（暂无）
 */
///#end
///#begin en
/**
 *	@brief	None
 */
///#end
@property (nonatomic,readonly) NSString *notifications;

///#begin zh-cn
/**
 *	@brief	是否支持地理位置
 */
///#end
///#begin en
/**
 *	@brief	Whether to support location
 */
///#end
@property (nonatomic,readonly) BOOL geoEnabled;

///#begin zh-cn
/**
 *	@brief	微博数
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
 *	@brief	是否关注
 */
///#end
///#begin en
/**
 *	@brief	Following flag.
 */
///#end
@property (nonatomic,readonly) BOOL following;

///#begin zh-cn
/**
 *	@brief	是否认证
 */
///#end
///#begin en
/**
 *	@brief	Whether verified.
 */
///#end
@property (nonatomic,readonly) BOOL verified;

///#begin zh-cn
/**
 *	@brief	语言
 */
///#end
///#begin en
/**
 *	@brief	Language.
 */
///#end
@property (nonatomic,readonly) NSString *lang;

///#begin zh-cn
/**
 *	@brief	暂无
 */
///#end
///#begin en
/**
 *	@brief	None.
 */
///#end
@property (nonatomic,readonly) BOOL contributorsEnabled;

///#begin zh-cn
/**
 *	@brief	性别,1 男  0  女。
 */
///#end
///#begin en
/**
 *	@brief	Gender,1 Male  0  Female。
 */
///#end
@property (nonatomic,readonly) NSInteger gender;

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
+ (SSSohuWeiboUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
