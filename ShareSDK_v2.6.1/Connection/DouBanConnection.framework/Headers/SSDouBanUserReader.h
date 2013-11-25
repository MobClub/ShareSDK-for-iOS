//
//  SSDouBanUserReader.h
//  DouBanConnection
//
//  Created by 冯 鸿杰 on 13-10-22.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	用户信息读取器
 */
@interface SSDouBanUserReader : NSObject
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
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	用户昵称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	头像小图
 */
@property (nonatomic,readonly) NSString *avatar;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *alt;

/**
 *	@brief	注册时间
 */
@property (nonatomic,readonly) NSString *created;

/**
 *	@brief	城市id
 */
@property (nonatomic,readonly) NSString *locId;

/**
 *	@brief	所在地全称
 */
@property (nonatomic,readonly) NSString *locName;

/**
 *	@brief	描述
 */
@property (nonatomic,readonly) NSString *desc;

/**
 *	@brief	大头像
 */
@property (nonatomic,readonly) NSString *largeAvatar;

/**
 *	@brief	小头像
 */
@property (nonatomic,readonly) NSString *smallAvatar;

/**
 *	@brief	用户名号
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	类型
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *signature;

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
+ (SSDouBanUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
