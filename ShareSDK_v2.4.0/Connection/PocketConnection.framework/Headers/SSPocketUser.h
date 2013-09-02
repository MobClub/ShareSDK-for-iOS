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
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSPocketCredential.h"

/**
 *	@brief	用户信息
 */
@interface SSPocketUser : SSCDataObject
{
@private
    SSPocketCredential *_credential;
}

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSPocketCredential *credential;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *userName;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSPocketUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
