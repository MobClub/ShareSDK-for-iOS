//
//  SSGooglePlusEmail.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	邮箱信息
 */
@interface SSGooglePlusEmail : SSCDataObject

/**
 *	@brief	The email address.
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	The type of address. Possible values are:
 *          "home" - Home email address.
 *          "work" - Work email address.
 *          "other" - Other.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	If "true", indicates this email address is the person's primary one.
 */
@property (nonatomic,readonly) BOOL primary;

/**
 *	@brief	创建邮箱信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	邮箱信息
 */
+ (SSGooglePlusEmail *)emailWithResponse:(NSDictionary *)response;



@end
