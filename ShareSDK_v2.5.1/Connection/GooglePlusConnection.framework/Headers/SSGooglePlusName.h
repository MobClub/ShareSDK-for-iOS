//
//  SSGooglePlusName.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	名字
 */
@interface SSGooglePlusName : SSCDataObject

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
 *	@brief	创建名字信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	名字信息对象
 */
+ (SSGooglePlusName *)nameWithResponse:(NSDictionary *)response;


@end
