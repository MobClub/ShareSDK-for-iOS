//
//  SSTencentWeiboUserReader.h
//  TencentWeiboConnection
//
//  Created by vimfung on 13-10-20.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	用户信息读取器
 */
@interface SSTencentWeiboUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;


/**
 *	@brief	出生天
 */
@property (nonatomic,readonly) NSInteger birthDay;

/**
 *	@brief	出生月
 */
@property (nonatomic,readonly) NSInteger birthMonth;

/**
 *	@brief	出生年
 */
@property (nonatomic,readonly) NSInteger birthYear;

/**
 *	@brief	城市id
 */
@property (nonatomic,readonly) NSString *cityCode;

/**
 *	@brief	职业信息
 */
@property (nonatomic, readonly) NSArray *comp;

/**
 *	@brief	国家id
 */
@property (nonatomic,readonly) NSString *countryCode;

/**
 *	@brief	教育信息
 */
@property (nonatomic, readonly) NSArray *edu;

/**
 *	@brief	邮箱
 */
@property (nonatomic, readonly) NSString *email;

/**
 *	@brief	经验值
 */
@property (nonatomic,readonly) NSInteger exp;

/**
 *	@brief	听众数
 */
@property (nonatomic,readonly) NSInteger fansnum;

/**
 *	@brief	收藏数
 */
@property (nonatomic,readonly) NSInteger favnum;

/**
 *	@brief	头像url
 */
@property (nonatomic,readonly) NSString *head;

/**
 *	@brief	家乡所在城市id
 */
@property (nonatomic,readonly) NSString *homecityCode;

/**
 *	@brief	家乡所在国家id
 */
@property (nonatomic,readonly) NSString *homecountryCode;

/**
 *	@brief	个人主页
 */
@property (nonatomic,readonly) NSString *homepage;

/**
 *	@brief	家乡所在省id
 */
@property (nonatomic,readonly) NSString *homeprovinceCode;

/**
 *	@brief	家乡所在城镇id
 */
@property (nonatomic,readonly) NSString *hometownCode;

/**
 *	@brief	收听的人数
 */
@property (nonatomic,readonly) NSInteger idolnum;

/**
 *	@brief	行业id
 */
@property (nonatomic,readonly) NSInteger industryCode;

/**
 *	@brief	个人介绍
 */
@property (nonatomic,readonly) NSString *introduction;

/**
 *	@brief	是否企业机构
 */
@property (nonatomic,readonly) BOOL isent;

/**
 *	@brief	是否在当前用户的黑名单中，0-不是，1-是
 */
@property (nonatomic,readonly) BOOL ismyblack;

/**
 *	@brief	是否是当前用户的听众，0-不是，1-是
 */
@property (nonatomic,readonly) BOOL ismyfans;

/**
 *	@brief	是否是当前用户的偶像，0-不是，1-是
 */
@property (nonatomic,readonly) BOOL ismyidol;

/**
 *	@brief	是否实名认证，1-已实名认证，2-未实名认证
 */
@property (nonatomic,readonly) NSInteger isrealname;

/**
 *	@brief	是否认证用户，0-不是，1-是
 */
@property (nonatomic,readonly) BOOL isvip;

/**
 *	@brief	微博等级
 */
@property (nonatomic,readonly) NSInteger level;

/**
 *	@brief	所在地
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	互听好友数
 */
@property (nonatomic,readonly) NSInteger mutualFansNum;

/**
 *	@brief	用户帐户名
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户昵称
 */
@property (nonatomic,readonly) NSString *nick;

/**
 *	@brief	用户唯一id，与name相对应
 */
@property (nonatomic,readonly) NSString *openid;

/**
 *	@brief	地区id
 */
@property (nonatomic,readonly) NSString *provinceCode;

/**
 *	@brief	注册时间
 */
@property (nonatomic,readonly) NSTimeInterval regtime;

/**
 *	@brief	是否允许所有人给当前用户发私信，0-仅有偶像，1-名人+听众，2-所有人
 */
@property (nonatomic,readonly) NSInteger sendPrivateFlag;

/**
 *	@brief	用户性别，1-男，2-女，0-未填写
 */
@property (nonatomic,readonly) NSInteger sex;

/**
 *	@brief	标签
 */
@property (nonatomic,readonly) NSArray *tag;

/**
 *	@brief	最近的一条原创微博信息
 */
@property (nonatomic,readonly) NSArray *tweetinfo;

/**
 *	@brief	发表的微博数
 */
@property (nonatomic,readonly) NSInteger tweetnum;

/**
 *	@brief	认证信息
 */
@property (nonatomic,readonly) NSString *verifyinfo;

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
+ (SSTencentWeiboUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
