//
//  SSRenRenIndustry.h
//  RenRenConnection
//
//  Created by vimfung on 13-7-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	行业
 */
@interface SSRenRenIndustry : SSCDataObject

/**
 *	@brief	行业类别
 */
@property (nonatomic,readonly) NSString *industryCategory;

/**
 *	@brief	行业详情
 */
@property (nonatomic,readonly) NSString *industryDetail;

/**
 *	@brief	创建行业信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	行业信息对象
 */
+ (SSRenRenIndustry *)industryWithResponse:(NSDictionary *)response;


@end
