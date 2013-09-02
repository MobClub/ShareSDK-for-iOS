//
//  SSRenRenJob.h
//  RenRenConnection
//
//  Created by vimfung on 13-7-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	职位
 */
@interface SSRenRenJob : SSCDataObject

/**
 *	@brief	职位类别
 */
@property (nonatomic,readonly) NSString *jobCategory;

/**
 *	@brief	职位详情
 */
@property (nonatomic,readonly) NSString *jobDetail;

/**
 *	@brief	创建职位信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	职位信息
 */
+ (SSRenRenJob *)jobWithResponse:(NSDictionary *)response;


@end
