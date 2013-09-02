//
//  SSGooglePlusOrganization.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	组织信息
 */
@interface SSGooglePlusOrganization : SSCDataObject

/**
 *	@brief	The name of the organization.
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	The department within the organization. Deprecated.
 */
@property (nonatomic,readonly) NSString *department;

/**
 *	@brief	The person's job title or role within the organization.
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	The type of organization. Possible values are:
 *          "work" - Work.
 *          "school" - School.
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	The date the person joined this organization.
 */
@property (nonatomic,readonly) NSString *startDate;

/**
 *	@brief	The date the person left this organization.
 */
@property (nonatomic,readonly) NSString *endDate;

/**
 *	@brief	The location of this organization. Deprecated.
 */
@property (nonatomic,readonly) NSString *location;

/**
 *	@brief	A short description of the person's role in this organization. Deprecated.
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	If "true", indicates this organization is the person's primary one (typically interpreted as current one).
 */
@property (nonatomic,readonly) BOOL primary;

/**
 *	@brief	创建组织信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	组织信息
 */
+ (SSGooglePlusOrganization *)organizationWithResponse:(NSDictionary *)response;


@end
