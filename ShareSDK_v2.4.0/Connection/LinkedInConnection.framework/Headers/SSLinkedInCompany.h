//
//  SSLinkedInCompany.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	公司信息
 */
@interface SSLinkedInCompany : SSCDataObject


/**
 *	@brief	行业
 */
@property (nonatomic,readonly) NSString *industry;

/**
 *	@brief	名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	创建公司信息
 *
 *	@param 	response 	回复对象
 *
 *	@return	公司信息
 */
+ (SSLinkedInCompany *)companyWithResponse:(NSDictionary *)response;


@end
