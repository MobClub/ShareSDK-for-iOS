//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	货币信息
 */
@interface SSFacebookCurrency : NSObject <NSCoding,
                                          ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

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
 *	@brief	创建货币信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	货币信息
 */
+ (SSFacebookCurrency *)currencyWithResponse:(NSDictionary *)response;

@end
