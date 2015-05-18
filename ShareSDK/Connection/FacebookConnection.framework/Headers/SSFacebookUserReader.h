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
#import "SSFacebookAgeRangeReader.h"
#import "SSFacebookCoverReader.h"
#import "SSFacebookCurrencyReader.h"
#import "SSFacebookHometownReader.h"
#import "SSFacebookLocationReader.h"
#import "SSFacebookPaymentPricePointReader.h"
#import "SSFacebookSecuritySettingReader.h"
#import "SSFacebookSignficantOtherReader.h"
#import "SSFacebookVideoUploadLimitsReader.h"

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
@interface SSFacebookUserReader : NSObject
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
 *	@brief	用户姓名
 */
///#end
///#begin en
/**
 *	@brief	Name
 */
///#end
@property (nonatomic,readonly) NSString *name;

///#begin zh-cn
/**
 *	@brief	名字
 */
///#end
///#begin en
/**
 *	@brief	first name.
 */
///#end
@property (nonatomic,readonly) NSString *firstName;

///#begin zh-cn
/**
 *	@brief	中间名字
 */
///#end
///#begin en
/**
 *	@brief	Middle name.
 */
///#end
@property (nonatomic,readonly) NSString *middleName;

///#begin zh-cn
/**
 *	@brief	姓
 */
///#end
///#begin en
/**
 *	@brief	Last name.
 */
///#end
@property (nonatomic,readonly) NSString *lastName;

///#begin zh-cn
/**
 *	@brief	性别
 */
///#end
///#begin en
/**
 *	@brief	Gender.
 */
///#end
@property (nonatomic,readonly) NSString *gender;

///#begin zh-cn
/**
 *	@brief	语言环境
 */
///#end
///#begin en
/**
 *	@brief	Locale.
 */
///#end
@property (nonatomic,readonly) NSString *locale;

///#begin zh-cn
/**
 *	@brief	语言
 */
///#end
///#begin en
/**
 *	@brief	language.
 */
///#end
@property (nonatomic,readonly) NSArray *languages;

///#begin zh-cn
/**
 *	@brief	个人主页链接
 */
///#end
///#begin en
/**
 *	@brief	Personal homepage link.
 */
///#end
@property (nonatomic,readonly) NSString *link;

///#begin zh-cn
/**
 *	@brief	注册用户名称
 */
///#end
///#begin en
/**
 *	@brief	User name.
 */
///#end
@property (nonatomic,readonly) NSString *username;

///#begin zh-cn
/**
 *	@brief	年龄范围
 */
///#end
///#begin en
/**
 *	@brief	Age range.
 */
///#end
@property (nonatomic,readonly) SSFacebookAgeRangeReader *ageRange;

///#begin zh-cn
/**
 *	@brief	匿名用户标识
 */
///#end
///#begin en
/**
 *	@brief	Third party id.
 */
///#end
@property (nonatomic,readonly) NSString *thirdPartyId;

///#begin zh-cn
/**
 *	@brief	安装应用标识
 */
///#end
///#begin en
/**
 *	@brief	installed.
 */
///#end
@property (nonatomic,readonly) BOOL installed;

///#begin zh-cn
/**
 *	@brief	时区偏移值
 */
///#end
///#begin en
/**
 *	@brief	Time zone.
 */
///#end
@property (nonatomic,readonly) NSNumber *timezone;

///#begin zh-cn
/**
 *	@brief	更新时间
 */
///#end
///#begin en
/**
 *	@brief	Updated time.
 */
///#end
@property (nonatomic,readonly) NSString *updatedTime;

///#begin zh-cn
/**
 *	@brief	认证状态
 */
///#end
///#begin en
/**
 *	@brief	Verified
 */
///#end
@property (nonatomic,readonly) BOOL verified;

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
@property (nonatomic,readonly) NSString *bio;

///#begin zh-cn
/**
 *	@brief	生日
 */
///#end
///#begin en
/**
 *	@brief	Birthday
 */
///#end
@property (nonatomic,readonly) NSString *birthday;

///#begin zh-cn
/**
 *	@brief	照片封面
 */
///#end
///#begin en
/**
 *	@brief	Cover information.
 */
///#end
@property (nonatomic,readonly) SSFacebookCoverReader *cover;

///#begin zh-cn
/**
 *	@brief	货币设置信息
 */
///#end
///#begin en
/**
 *	@brief	Currency information.
 */
///#end
@property (nonatomic,readonly) SSFacebookCurrencyReader *currency;

///#begin zh-cn
/**
 *	@brief	设备信息
 */
///#end
///#begin en
/**
 *	@brief	Devices.
 */
///#end
@property (nonatomic,readonly) NSArray *devices;

///#begin zh-cn
/**
 *	@brief	教育信息
 */
///#end
///#begin en
/**
 *	@brief	Education.
 */
///#end
@property (nonatomic,readonly) NSArray *education;

///#begin zh-cn
/**
 *	@brief	电子邮件
 */
///#end
///#begin en
/**
 *	@brief	E-mail.
 */
///#end
@property (nonatomic,readonly) NSString *email;

///#begin zh-cn
/**
 *	@brief	家乡
 */
///#end
///#begin en
/**
 *	@brief	Hometown.
 */
///#end
@property (nonatomic,readonly) SSFacebookHometownReader *hometown;

///#begin zh-cn
/**
 *	@brief	 性取向
 */
///#end
///#begin en
/**
 *	@brief	 Interested in.
 */
///#end
@property (nonatomic,readonly) NSArray *interestedIn;

///#begin zh-cn
/**
 *	@brief	所在城市
 */
///#end
///#begin en
/**
 *	@brief	Location.
 */
///#end
@property (nonatomic,readonly) SSFacebookLocationReader *location;

///#begin zh-cn
/**
 *	@brief	政治观点
 */
///#end
///#begin en
/**
 *	@brief	Political.
 */
///#end
@property (nonatomic,readonly) NSString *political;

///#begin zh-cn
/**
 *	@brief	支付价格点
 */
///#end
///#begin en
/**
 *	@brief	Payment price points.
 */
///#end
@property (nonatomic,readonly) SSFacebookPaymentPricePointReader *paymentPricepoints;

///#begin zh-cn
/**
 *	@brief	喜欢的运动员
 */
///#end
///#begin en
/**
 *	@brief	Favorite athletes.
 */
///#end
@property (nonatomic,readonly) NSArray *favoriteAthletes;

///#begin zh-cn
/**
 *	@brief	喜欢的球队
 */
///#end
///#begin en
/**
 *	@brief	Favorite teams.
 */
///#end
@property (nonatomic,readonly) NSArray *favoriteTeams;

///#begin zh-cn
/**
 *	@brief	用户头像
 */
///#end
///#begin en
/**
 *	@brief	Avatar.
 */
///#end
@property (nonatomic,readonly) id picture;

///#begin zh-cn
/**
 *	@brief	座右铭
 */
///#end
///#begin en
/**
 *	@brief	Quotes.
 */
///#end
@property (nonatomic,readonly) NSString *quotes;

///#begin zh-cn
/**
 *	@brief	婚恋状态
 */
///#end
///#begin en
/**
 *	@brief	Relationship status.
 */
///#end
@property (nonatomic,readonly) NSString *relationshipStatus;

///#begin zh-cn
/**
 *	@brief	宗教
 */
///#end
///#begin en
/**
 *	@brief	Religion.
 */
///#end
@property (nonatomic,readonly) NSString *religion;

///#begin zh-cn
/**
 *	@brief	安全设置
 */
///#end
///#begin en
/**
 *	@brief	secuity setting reader.
 */
///#end
@property (nonatomic,readonly) SSFacebookSecuritySettingReader *securitySettings;

///#begin zh-cn
/**
 *	@brief	The user's significant other
 */
///#end
///#begin en
/**
 *	@brief	The user's significant other
 */
///#end
@property (nonatomic,readonly) SSFacebookSignficantOtherReader *significantOther;

///#begin zh-cn
/**
 *	@brief	视频上传限制
 */
///#end
///#begin en
/**
 *	@brief	Video upload limits.
 */
///#end
@property (nonatomic,readonly) SSFacebookVideoUploadLimitsReader *videoUploadLimits;

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
@property (nonatomic,readonly) NSString *website;

///#begin zh-cn
/**
 *	@brief	职业信息
 */
///#end
///#begin en
/**
 *	@brief	Career information.
 */
///#end
@property (nonatomic,readonly) NSArray *work;

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
 *	@brief	Create user reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSFacebookUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
