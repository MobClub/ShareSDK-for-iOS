//
//  SSTwitterContributorReader.h
//  TwitterConnection
//
//  Created by 冯 鸿杰 on 13-10-24.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	贡献者信息读取器
 */
@interface SSTwitterContributorReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	屏幕名称
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
 *	@brief	创建地方边界信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSTwitterContributorReader *)readerWithSourceData:(NSDictionary *)sourceData;


@end
