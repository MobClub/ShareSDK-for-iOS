//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	名字信息读取器
 */
@interface SSGooglePlusNameReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

/**
 *	@brief	The full name of this person, including middle names, suffixes, etc.
 */
@property (nonatomic,readonly) NSString *formatted;

/**
 *	@brief	The family name (last name) of this person.
 */
@property (nonatomic,readonly) NSString *familyName;

/**
 *	@brief	The given name (first name) of this person.
 */
@property (nonatomic,readonly) NSString *givenName;

/**
 *	@brief	The middle name of this person.
 */
@property (nonatomic,readonly) NSString *middleName;

/**
 *	@brief	The honorific prefixes (such as "Dr." or "Mrs.") for this person.
 */
@property (nonatomic,readonly) NSString *honorificPrefix;

/**
 *	@brief	The honorific suffixes (such as "Jr.") for this person.
 */
@property (nonatomic,readonly) NSString *honorificSuffix;

/**
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建名字信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusNameReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
