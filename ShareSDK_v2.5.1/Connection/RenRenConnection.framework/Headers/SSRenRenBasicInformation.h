//
//  SSRenRenBasicInformation.h
//  RenRenConnection
//
//  Created by vimfung on 13-7-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSRenRenHometown.h"

/**
 *	@brief	基本信息
 */
@interface SSRenRenBasicInformation : SSCDataObject

/**
 *	@brief	用户性别
 *  FEMALE	女性
 *  MALE	男性
 */
@property (nonatomic,readonly) NSString *sex;

/**
 *	@brief	用户生日，格式为'yyyy-mm-dd'或'y0后-mm-dd'
 */
@property (nonatomic,readonly) NSString *birthday;

/**
 *	@brief	家乡信息
 */
@property (nonatomic,readonly) SSRenRenHometown *homeTown;

/**
 *	@brief	创建基本信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	基本信息实例对象
 */
+ (SSRenRenBasicInformation *)basicInformationWithResponse:(NSDictionary *)response;


@end
