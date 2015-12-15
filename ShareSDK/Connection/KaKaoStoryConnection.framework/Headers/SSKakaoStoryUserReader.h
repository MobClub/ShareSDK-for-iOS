//
//  SSKakaoStoryUserReader.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/17.
//  Copyright © 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSKakaoStoryUserReader : NSObject

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	用户标识，对当前开发者帐号唯一
 */
@property (nonatomic,readonly) NSString *openID;

/**
 *	@brief	昵称
 */
@property (nonatomic,readonly) NSString *nickname;

/**
 *	@brief	性别，1为男性，2为女性
 */
@property (nonatomic,readonly) NSInteger sex;

/**
 *	@brief	普通用户个人资料填写的省份
 */
@property (nonatomic,readonly) NSString *province;

/**
 *	@brief	普通用户个人资料填写的城市
 */
@property (nonatomic,readonly) NSString *city;

/**
 *	@brief	国家，如中国为CN
 */
@property (nonatomic,readonly) NSString *country;

/**
 *	@brief	用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空
 */
@property (nonatomic,readonly) NSString *headImageUrl;

/**
 *	@brief	用户特权信息
 */
@property (nonatomic,readonly) NSArray *privilege;

/**
 *	@brief	用户统一标识。针对一个微信开放平台帐号下的应用，同一用户的unionid是唯一的。
 */
@property (nonatomic,readonly) NSString *unionID;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id) initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSKakaoStoryUserReader *) readerWithSourceData:(NSDictionary *)sourceData;



@end
