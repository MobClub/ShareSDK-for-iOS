//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSRenRenHometown.h"
#import "SSRenRenWork.h"
#import "SSRenRenSchool.h"
#import "SSRenRenCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSRenRenBasicInformation.h"

/**
 *	@brief	用户信息
 */
@interface SSRenRenUser : SSCDataObject
{
@private
    SSRenRenCredential *_credential;
}

/**
 *	@brief	表示用户id
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	表示用户名
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户头像列表
 */
@property (nonatomic,readonly) NSArray *avatar;

/**
 *	@brief	表示是否为星级用户，值“1”表示“是”；值“0”表示“不是”
 */
@property (nonatomic,readonly) NSInteger star;

/**
 *	@brief	用户基本信息
 */
@property (nonatomic,readonly) SSRenRenBasicInformation *basicInformation;

/**
 *	@brief	用户学校信息
 */
@property (nonatomic,readonly) NSArray *education;

/**
 *	@brief	工作信息
 */
@property (nonatomic,readonly) NSArray *work;

/**
 *	@brief	喜欢
 */
@property (nonatomic,readonly) NSArray *like;

/**
 *	@brief	感情状态
 *  INLOVE          恋爱中
 *  OTHER           其他
 *  SINGLE          单身
 *  MARRIED         已婚
 *  UNOBVIOUSLOVE	暗恋
 *  DIVORCE         离异
 *  ENGAGE          订婚
 *  OUTLOVE         失恋
 */
@property (nonatomic,readonly) NSString *emotionalState;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSRenRenCredential *credential;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	用户信息
 */
+ (SSRenRenUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
