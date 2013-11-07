//
//  SSTwitterUserMentionReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	提及用户信息读取器
 */
@interface SSTwitterUserMentionReader : NSObject
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
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	用户ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	用提及用户信息的起始位置和结束位置索引
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户屏幕名称
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建提及用户信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterUserMentionReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
