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

///#begin zh-cn
/**
 *	@brief	货币信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Currency Reader.
 */
///#end
@interface SSFacebookCurrencyReader : NSObject
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
 *	@brief	货币信息Id
 */
///#end
///#begin en
/**
 *	@brief	Currency information Id
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	首选货币ISO-4217-3编码 (默认USD)
 */
///#end
///#begin en
/**
 *	@brief	Preferred currency ISO-4217-3 encoding (default USD)
 */
///#end
@property (nonatomic,readonly) NSString *userCurrency;

///#begin zh-cn
/**
 *	@brief	对应首选货币的一个单位可交换的Facebook Credits数量
 */
///#end
///#begin en
/**
 *	@brief	A number of Facebook Credits currency exchangeable preferred units
 */
///#end
@property (nonatomic,readonly) CGFloat currencyExchange;

///#begin zh-cn
/**
 *	@brief	对应Facebook Credits的一个单位可交换的首选货币数量
 */
///#end
///#begin en
/**
 *	@brief	Preferred currency Facebook Credits in a corresponding number of units exchangeable
 */
///#end
@property (nonatomic,readonly) CGFloat currencyExchangeInverse;

///#begin zh-cn
/**
 *	@brief	货币价格偏移值，如$1.20在API中返回120。此值转换回真实货币数量可由 API返回货币价格 ／ 偏移值 ＝ 真实货币价格
 */
///#end
///#begin en
/**
 *	@brief	Currency prices offset value. If $ 1.20 is returned in the API 120. This value is converted back to the real quantity of money. Currency prices by API returns / Offset = true currency prices
 */
///#end
@property (nonatomic,readonly) CGFloat currencyOffset;

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
 *	@brief	创建年货币信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create currency reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSFacebookCurrencyReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
