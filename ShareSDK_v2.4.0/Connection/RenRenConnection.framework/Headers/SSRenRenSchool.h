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

/**
 *	@brief	大学信息
 */
@interface SSRenRenSchool : SSCDataObject

/**
 *	@brief	学校名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	入学日期
 */
@property (nonatomic,readonly) NSString *year;

/**
 *	@brief	所在专业
 */
@property (nonatomic,readonly) NSString *department;

/**
 *	@brief	学历
 *  DOCTOR      博士
 *  COLLEGE     本科
 *  GVY         校工
 *  PRIMARY     小学
 *  OTHER       其他
 *  TEACHER     教师
 *  MASTER      硕士
 *  HIGHSCHOOL	高中
 *  TECHNICAL	中专技校
 *  JUNIOR      初中
 *  SECRET      保密
 */
@property (nonatomic,readonly) NSString *educationBackground;


/**
 *	@brief	创建学校信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	学校信息
 */
+ (SSRenRenSchool *)schoolWithResponse:(NSDictionary *)response;

@end
