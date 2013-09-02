//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSRenRenIndustry.h"
#import "SSRenRenJob.h"

/**
 *	@brief	工作
 */
@interface SSRenRenWork : SSCDataObject

/**
 *	@brief	公司名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	入职日期
 */
@property (nonatomic,readonly) NSString *time;

/**
 *	@brief	行业
 */
@property (nonatomic,readonly) SSRenRenIndustry *industry;

/**
 *	@brief	职位
 */
@property (nonatomic,readonly) SSRenRenJob *job;


/**
 *	@brief	创建工作信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	工作信息
 */
+ (SSRenRenWork *)workWithResponse:(NSDictionary *)response;

@end
