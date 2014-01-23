//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Inherit value，The value used to identify whether an object inherits the parent
 */
@interface SSInheritValue : NSObject
{
@private
    NSString *_name;
}

/**
 *	@brief	Name
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	Initialize Inherit value object.
 *
 *	@param 	name 	Name，Specify the name of a property inherited object.
 *
 *	@return	Inherit value object.
 */
- (id)initWithName:(NSString *)name;

/**
 *	@brief	Create an Inherit value object.
 *
 *	@return	Inherit value object.
 */
+ (id)inherit;

/**
 *	@brief	Create inherit value object.
 *
 *	@param 	name 	Name，Specify the name of a property inherited object.
 *
 *	@return	Inherit value object.
 */
+ (id)inheritWithName:(NSString *)name;


@end
