//
//  SSGooglePlusPlaceLived.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	居住地
 */
@interface SSGooglePlusPlaceLived : SSCDataObject

/**
 *	@brief	A place where this person has lived. For example: "Seattle, WA", "Near Toronto".
 */
@property (nonatomic,readonly) NSString *value;

/**
 *	@brief	If "true", this place of residence is this person's primary residence.
 */
@property (nonatomic,readonly) BOOL primary;

/**
 *	@brief	创建居住地信息
 *
 *	@param 	response 	回复信息
 *
 *	@return	居住地信息
 */
+ (SSGooglePlusPlaceLived *)placeLivedWithResponse:(NSDictionary *)response;



@end
