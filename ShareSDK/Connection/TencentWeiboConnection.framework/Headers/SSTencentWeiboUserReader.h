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
@interface SSTencentWeiboUserReader : NSObject
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
 *	@brief	出生天
 */
///#end
///#begin en
/**
 *	@brief	Birth day.
 */
///#end
@property (nonatomic,readonly) NSInteger birthDay;

///#begin zh-cn
/**
 *	@brief	出生月
 */
///#end
///#begin en
/**
 *	@brief	Birth month.
 */
///#end
@property (nonatomic,readonly) NSInteger birthMonth;

///#begin zh-cn
/**
 *	@brief	出生年
 */
///#end
///#begin en
/**
 *	@brief	Birth year.
 */
///#end
@property (nonatomic,readonly) NSInteger birthYear;

///#begin zh-cn
/**
 *	@brief	城市id
 */
///#end
///#begin en
/**
 *	@brief	City code.
 */
///#end
@property (nonatomic,readonly) NSString *cityCode;

///#begin zh-cn
/**
 *	@brief	职业信息
 */
///#end
///#begin en
/**
 *	@brief	Career list of this person.
 */
///#end
@property (nonatomic, readonly) NSArray *comp;

///#begin zh-cn
/**
 *	@brief	国家id
 */
///#end
///#begin en
/**
 *	@brief	Country code.
 */
///#end
@property (nonatomic,readonly) NSString *countryCode;

///#begin zh-cn
/**
 *	@brief	教育信息
 */
///#end
///#begin en
/**
 *	@brief	Education list of this person.
 */
///#end
@property (nonatomic, readonly) NSArray *edu;

///#begin zh-cn
/**
 *	@brief	邮箱
 */
///#end
///#begin en
/**
 *	@brief	E-mail Address.
 */
///#end
@property (nonatomic, readonly) NSString *email;

///#begin zh-cn
/**
 *	@brief	经验值
 */
///#end
///#begin en
/**
 *	@brief	Experience
 */
///#end
@property (nonatomic,readonly) NSInteger exp;

///#begin zh-cn
/**
 *	@brief	听众数
 */
///#end
///#begin en
/**
 *	@brief	Fans number.
 */
///#end
@property (nonatomic,readonly) NSInteger fansnum;

///#begin zh-cn
/**
 *	@brief	收藏数
 */
///#end
///#begin en
/**
 *	@brief	Favorited number.
 */
///#end
@property (nonatomic,readonly) NSInteger favnum;

///#begin zh-cn
/**
 *	@brief	头像url
 */
///#end
///#begin en
/**
 *	@brief	Avatar URL.
 */
///#end
@property (nonatomic,readonly) NSString *head;

///#begin zh-cn
/**
 *	@brief	家乡所在城市id
 */
///#end
///#begin en
/**
 *	@brief	Home city code.
 */
///#end
@property (nonatomic,readonly) NSString *homecityCode;

///#begin zh-cn
/**
 *	@brief	家乡所在国家id
 */
///#end
///#begin en
/**
 *	@brief	Home country code.
 */
///#end
@property (nonatomic,readonly) NSString *homecountryCode;

///#begin zh-cn
/**
 *	@brief	个人主页
 */
///#end
///#begin en
/**
 *	@brief	Homepage
 */
///#end
@property (nonatomic,readonly) NSString *homepage;

///#begin zh-cn
/**
 *	@brief	家乡所在省id
 */
///#end
///#begin en
/**
 *	@brief	home Province code.
 */
///#end
@property (nonatomic,readonly) NSString *homeprovinceCode;

///#begin zh-cn
/**
 *	@brief	家乡所在城镇id
 */
///#end
///#begin en
/**
 *	@brief	Hometown code.
 */
///#end
@property (nonatomic,readonly) NSString *hometownCode;

///#begin zh-cn
/**
 *	@brief	收听的人数
 */
///#end
///#begin en
/**
 *	@brief	idol number.
 */
///#end
@property (nonatomic,readonly) NSInteger idolnum;

///#begin zh-cn
/**
 *	@brief	行业id
 */
///#end
///#begin en
/**
 *	@brief	Industry code.
 */
///#end
@property (nonatomic,readonly) NSInteger industryCode;

///#begin zh-cn
/**
 *	@brief	个人介绍
 */
///#end
///#begin en
/**
 *	@brief	Introduction
 */
///#end
@property (nonatomic,readonly) NSString *introduction;

///#begin zh-cn
/**
 *	@brief	是否企业机构
 */
///#end
///#begin en
/**
 *	@brief	Are Enterprise?
 */
///#end
@property (nonatomic,readonly) BOOL isent;

///#begin zh-cn
/**
 *	@brief	是否在当前用户的黑名单中，0-不是，1-是
 */
///#end
///#begin en
/**
 *	@brief	Whether the current user's blacklist, 0 - no, 1 - Yes
 */
///#end
@property (nonatomic,readonly) BOOL ismyblack;

///#begin zh-cn
/**
 *	@brief	是否是当前用户的听众，0-不是，1-是
 */
///#end
///#begin en
/**
 *	@brief	If the current user's audience, 0 - no, 1 - Yes
 */
///#end
@property (nonatomic,readonly) BOOL ismyfans;

///#begin zh-cn
/**
 *	@brief	是否是当前用户的偶像，0-不是，1-是
 */
///#end
///#begin en
/**
 *	@brief	Whether it is the current user's idol, 0 - no, 1 - Yes
 */
///#end
@property (nonatomic,readonly) BOOL ismyidol;

///#begin zh-cn
/**
 *	@brief	是否实名认证，1-已实名认证，2-未实名认证
 */
///#end
///#begin en
/**
 *	@brief	Whether the real-name authentication 1 - has real-name authentication 2 - not real-name authentication
 */
///#end
@property (nonatomic,readonly) NSInteger isrealname;

///#begin zh-cn
/**
 *	@brief	是否认证用户，0-不是，1-是
 */
///#end
///#begin en
/**
 *	@brief	Whether the VIP user, 0 - no, 1 - Yes
 */
///#end
@property (nonatomic,readonly) BOOL isvip;

///#begin zh-cn
/**
 *	@brief	微博等级
 */
///#end
///#begin en
/**
 *	@brief	Level.
 */
///#end
@property (nonatomic,readonly) NSInteger level;

///#begin zh-cn
/**
 *	@brief	所在地
 */
///#end
///#begin en
/**
 *	@brief	Location.
 */
///#end
@property (nonatomic,readonly) NSString *location;

///#begin zh-cn
/**
 *	@brief	互听好友数
 */
///#end
///#begin en
/**
 *	@brief	Mutual fans number.
 */
///#end
@property (nonatomic,readonly) NSInteger mutualFansNum;

///#begin zh-cn
/**
 *	@brief	用户帐户名
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
 *	@brief	用户昵称
 */
///#end
///#begin en
/**
 *	@brief	Nickname
 */
///#end
@property (nonatomic,readonly) NSString *nick;

///#begin zh-cn
/**
 *	@brief	用户唯一id，与name相对应
 */
///#end
///#begin en
/**
 *	@brief	user id, and name the corresponding
 */
///#end
@property (nonatomic,readonly) NSString *openid;

///#begin zh-cn
/**
 *	@brief	地区id
 */
///#end
///#begin en
/**
 *	@brief	Province code.
 */
///#end
@property (nonatomic,readonly) NSString *provinceCode;

///#begin zh-cn
/**
 *	@brief	注册时间
 */
///#end
///#begin en
/**
 *	@brief	Registration Time
 */
///#end
@property (nonatomic,readonly) NSTimeInterval regtime;

///#begin zh-cn
/**
 *	@brief	是否允许所有人给当前用户发私信，0-仅有偶像，1-名人+听众，2-所有人
 */
///#end
///#begin en
/**
 *	@brief	Whether to allow everyone to send private messages to the current user, 0 - only Idol 1 - Celebrity + audience 2 - everyone
 */
///#end
@property (nonatomic,readonly) NSInteger sendPrivateFlag;

///#begin zh-cn
/**
 *	@brief	用户性别，1-男，2-女，0-未填写
 */
///#end
///#begin en
/**
 *	@brief	Gender，1-Male，2-Female，0-Not filled
 */
///#end
@property (nonatomic,readonly) NSInteger sex;

///#begin zh-cn
/**
 *	@brief	标签
 */
///#end
///#begin en
/**
 *	@brief	Tag list.
 */
///#end
@property (nonatomic,readonly) NSArray *tag;

///#begin zh-cn
/**
 *	@brief	最近的一条原创微博信息
 */
///#end
///#begin en
/**
 *	@brief	The last Tweet information.
 */
///#end
@property (nonatomic,readonly) NSArray *tweetinfo;

///#begin zh-cn
/**
 *	@brief	发表的微博数
 */
///#end
///#begin en
/**
 *	@brief	Tweet number.
 */
///#end
@property (nonatomic,readonly) NSInteger tweetnum;

///#begin zh-cn
/**
 *	@brief	认证信息
 */
///#end
///#begin en
/**
 *	@brief	Verify information.
 */
///#end
@property (nonatomic,readonly) NSString *verifyinfo;

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
+ (SSTencentWeiboUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
