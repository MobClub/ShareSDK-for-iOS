//
//  SSFacebookUserReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

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

/**
 *	@brief	用户信息读取器
 */
@interface SSFacebookUserReader : NSObject
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
 *	@brief	用户姓名
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	名字
 */
@property (nonatomic,readonly) NSString *firstName;

/**
 *	@brief	中间名字
 */
@property (nonatomic,readonly) NSString *middleName;

/**
 *	@brief	姓
 */
@property (nonatomic,readonly) NSString *lastName;

/**
 *	@brief	性别
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	语言环境
 */
@property (nonatomic,readonly) NSString *locale;

/**
 *	@brief	语言
 */
@property (nonatomic,readonly) NSArray *languages;

/**
 *	@brief	个人主页链接
 */
@property (nonatomic,readonly) NSString *link;

/**
 *	@brief	注册用户名称
 */
@property (nonatomic,readonly) NSString *username;

/**
 *	@brief	年龄范围
 */
@property (nonatomic,readonly) SSFacebookAgeRangeReader *ageRange;

/**
 *	@brief	匿名用户标识
 */
@property (nonatomic,readonly) NSString *thirdPartyId;

/**
 *	@brief	按照应用标识
 */
@property (nonatomic,readonly) BOOL installed;

/**
 *	@brief	时区偏移值
 */
@property (nonatomic,readonly) NSNumber *timezone;

/**
 *	@brief	更新时间
 */
@property (nonatomic,readonly) NSString *updatedTime;

/**
 *	@brief	认证状态
 */
@property (nonatomic,readonly) BOOL verified;

/**
 *	@brief	用户描述
 */
@property (nonatomic,readonly) NSString *bio;

/**
 *	@brief	生日
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	照片封面
 */
@property (nonatomic,readonly) SSFacebookCoverReader *cover;

/**
 *	@brief	货币设置信息
 */
@property (nonatomic,readonly) SSFacebookCurrencyReader *currency;

/**
 *	@brief	设备信息
 */
@property (nonatomic,readonly) NSArray *devices;

/**
 *	@brief	教育信息
 */
@property (nonatomic,readonly) NSArray *education;

/**
 *	@brief	电子邮件
 */
@property (nonatomic,readonly) NSString *email;

/**
 *	@brief	家乡
 */
@property (nonatomic,readonly) SSFacebookHometownReader *hometown;


/**
 *	@brief	 性取向
 */
@property (nonatomic,readonly) NSArray *interestedIn;

/**
 *	@brief	所在城市
 */
@property (nonatomic,readonly) SSFacebookLocationReader *location;

/**
 *	@brief	政治观点
 */
@property (nonatomic,readonly) NSString *political;

/**
 *	@brief	支付价格点
 */
@property (nonatomic,readonly) SSFacebookPaymentPricePointReader *paymentPricepoints;

/**
 *	@brief	喜欢的运动员
 */
@property (nonatomic,readonly) NSArray *favoriteAthletes;

/**
 *	@brief	喜欢的球队
 */
@property (nonatomic,readonly) NSArray *favoriteTeams;

/**
 *	@brief	用户头像
 */
@property (nonatomic,readonly) id picture;

/**
 *	@brief	座右铭
 */
@property (nonatomic,readonly) NSString *quotes;

/**
 *	@brief	婚恋状态
 */
@property (nonatomic,readonly) NSString *relationshipStatus;

/**
 *	@brief	宗教
 */
@property (nonatomic,readonly) NSString *religion;

/**
 *	@brief	安全设置
 */
@property (nonatomic,readonly) SSFacebookSecuritySettingReader *securitySettings;

/**
 *	@brief	The user's significant other
 */
@property (nonatomic,readonly) SSFacebookSignficantOtherReader *significantOther;

/**
 *	@brief	视频上传限制
 */
@property (nonatomic,readonly) SSFacebookVideoUploadLimitsReader *videoUploadLimits;

/**
 *	@brief	个人主页
 */
@property (nonatomic,readonly) NSString *website;

/**
 *	@brief	职业信息
 */
@property (nonatomic,readonly) NSArray *work;

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
+ (SSFacebookUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
