//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSFacebookAgeRange.h"
#import "SSFacebookCurrency.h"
#import "SSFacebookHometown.h"
#import "SSFacebookLocation.h"
#import "SSFacebookPaymentPricePoint.h"
#import "SSFacebookSecuritySetting.h"
#import "SSFacebookSignficantOther.h"
#import "SSFacebookVideoUploadLimits.h"
#import "SSFacebookCredential.h"
#import "SSFacebookCover.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	用户信息
 */
@interface SSFacebookUser : NSObject <NSCoding,
                                      ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSFacebookCredential *_credential;
}

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
@property (nonatomic,readonly) SSFacebookAgeRange *ageRange;

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
@property (nonatomic,readonly) SSFacebookCover *cover;

/**
 *	@brief	货币设置信息
 */
@property (nonatomic,readonly) SSFacebookCurrency *currency;

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
@property (nonatomic,readonly) SSFacebookHometown *hometown;


/**
 *	@brief	 性取向
 */
@property (nonatomic,readonly) NSArray *interestedIn;

/**
 *	@brief	所在城市
 */
@property (nonatomic,readonly) SSFacebookLocation *location;

/**
 *	@brief	政治观点
 */
@property (nonatomic,readonly) NSString *political;

/**
 *	@brief	支付价格点
 */
@property (nonatomic,readonly) SSFacebookPaymentPricePoint *paymentPricepoints;

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
@property (nonatomic,readonly) SSFacebookSecuritySetting *securitySettings;

/**
 *	@brief	The user's significant other
 */
@property (nonatomic,readonly) SSFacebookSignficantOther *significantOther;

/**
 *	@brief	视频上传限制
 */
@property (nonatomic,readonly) SSFacebookVideoUploadLimits *videoUploadLimits;

/**
 *	@brief	个人主页
 */
@property (nonatomic,readonly) NSString *website;

/**
 *	@brief	职业信息
 */
@property (nonatomic,readonly) NSArray *work;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSFacebookCredential *credential;


/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复信息
 *
 *	@return	用户信息
 */
+ (SSFacebookUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
