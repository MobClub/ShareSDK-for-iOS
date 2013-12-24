//
//  SSGooglePlusOrganizationReader.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-10-25.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	组织信息读取器
 */
@interface SSGooglePlusOrganizationReader : NSObject
{
@private
    NSDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,readonly) NSDictionary *sourceData;

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
 *	@brief	初始化读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
- (id)initWithSourceData:(NSDictionary *)sourceData;

/**
 *	@brief	创建组织信息读取器
 *
 *	@param 	sourceData 	原数据
 *
 *	@return	读取器实例对象
 */
+ (SSGooglePlusOrganizationReader *)readerWithSourceData:(NSDictionary *)sourceData;

@end
