//
//  SSFacebookCurrencyReader.h
//  FacebookConnection
//
//  Created by 冯 鸿杰 on 13-10-23.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	货币信息读取器
 */
@interface SSFacebookCurrencyReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	货币信息Id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	首选货币ISO-4217-3编码 (默认USD)
 */
@property (nonatomic,readonly) NSString *userCurrency;

/**
 *	@brief	对应首选货币的一个单位可交换的Facebook Credits数量
 */
@property (nonatomic,readonly) CGFloat currencyExchange;

/**
 *	@brief	对应Facebook Credits的一个单位可交换的首选货币数量
 */
@property (nonatomic,readonly) CGFloat currencyExchangeInverse;

/**
 *	@brief	货币价格偏移值，如$1.20在API中返回120。此值转换回真实货币数量可由 API返回货币价格 ／ 偏移值 ＝ 真实货币价格
 */
@property (nonatomic,readonly) CGFloat currencyOffset;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;


/**
 *	@brief	创建年货币信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSFacebookCurrencyReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
