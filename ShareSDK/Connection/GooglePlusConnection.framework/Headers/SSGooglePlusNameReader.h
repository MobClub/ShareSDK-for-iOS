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
 *	@brief	名字信息读取器
 */
///#end
///#begin en
/**
 *	@brief	Name Reader.
 */
///#end
@interface SSGooglePlusNameReader : NSObject
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
 *	@brief	The full name of this person, including middle names, suffixes, etc.
 */
///#end
///#begin en
/**
 *	@brief	The full name of this person, including middle names, suffixes, etc.
 */
///#end
@property (nonatomic,readonly) NSString *formatted;

///#begin zh-cn
/**
 *	@brief	The family name (last name) of this person.
 */
///#end
///#begin en
/**
 *	@brief	The family name (last name) of this person.
 */
///#end
@property (nonatomic,readonly) NSString *familyName;

///#begin zh-cn
/**
 *	@brief	The given name (first name) of this person.
 */
///#end
///#begin en
/**
 *	@brief	The given name (first name) of this person.
 */
///#end
@property (nonatomic,readonly) NSString *givenName;

///#begin zh-cn
/**
 *	@brief	The middle name of this person.
 */
///#end
///#begin en
/**
 *	@brief	The middle name of this person.
 */
///#end
@property (nonatomic,readonly) NSString *middleName;

///#begin zh-cn
/**
 *	@brief	The honorific prefixes (such as "Dr." or "Mrs.") for this person.
 */
///#end
///#begin en
/**
 *	@brief	The honorific prefixes (such as "Dr." or "Mrs.") for this person.
 */
///#end
@property (nonatomic,readonly) NSString *honorificPrefix;

///#begin zh-cn
/**
 *	@brief	The honorific suffixes (such as "Jr.") for this person.
 */
///#end
///#begin en
/**
 *	@brief	The honorific suffixes (such as "Jr.") for this person.
 */
///#end
@property (nonatomic,readonly) NSString *honorificSuffix;

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
 *	@brief	创建名字信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
///#end
///#begin en
/**
 *	@brief	Create a name reader.
 *
 *	@param 	sourceData 	Raw data.
 *
 *	@return	Reader object.
 */
///#end
+ (SSGooglePlusNameReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
