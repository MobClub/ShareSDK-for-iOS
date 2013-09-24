//
//  SSGooglePlusUrl.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	URL对象
 */
@interface SSGooglePlusUrl : SSCDataObject

/**
 *	@brief	The URL value.
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	The type of URL. Possible values are:
 *          "home" - URL for home.
 *          "work" - URL for work.
 *          "blog" - URL for blog.
 *          "profile" - URL for profile.
 *          "other" - Other.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	If "true", this URL is the person's primary URL.
 */
@property (nonatomic,readonly) BOOL primary;

/**
 *	@brief	创建邮箱信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	邮箱信息
 */
+ (SSGooglePlusUrl *)urlWithResponse:(NSDictionary *)response;

@end
