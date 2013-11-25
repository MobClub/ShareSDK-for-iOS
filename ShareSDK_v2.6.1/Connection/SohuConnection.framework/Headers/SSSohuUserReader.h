//
//  SSSohuUserReader.h
//  SohuConnection
//
//  Created by 冯 鸿杰 on 13-10-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	用户信息读取器
 */
@interface SSSohuUserReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	用户展示页的URL
 */
@property (nonatomic,readonly) NSString *homeUrl;

/**
 *	@brief	用户头像小图的URL
 */
@property (nonatomic,readonly) NSString *icon;

/**
 *	@brief	昵称
 */
@property (nonatomic,readonly) NSString *nick;

/**
 *	@brief	搜狐用户ID
 */
@property (nonatomic,readonly) NSString *openId;

/**
 *	@brief	用户名字
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户头像大图的URL
 */
@property (nonatomic,readonly) NSString *image;

/**
 *	@brief	出生年份
 */
@property (nonatomic) NSInteger birthdayYear;

/**
 *	@brief	出生月份
 */
@property (nonatomic) NSInteger birthdayMonth;

/**
 *	@brief	出生日期
 */
@property (nonatomic) NSInteger birthdayDay;

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
+ (SSSohuUserReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
