//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSYouDaoNoteCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>

/**
 *	@brief	用户信息
 */
@interface SSYouDaoNoteUser : NSObject <NSCoding>
{
@private
    NSMutableDictionary *_sourceData;
    SSYouDaoNoteCredential *_credential;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSYouDaoNoteCredential *credential;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *uid;

/**
 *	@brief	用户注册时间，单位毫秒
 */
@property (nonatomic,readonly) CGFloat registerTime;

/**
 *	@brief	用户已经使用了的空间大小，单位字节
 */
@property (nonatomic,readonly) long usedSize;

/**
 *	@brief	用户总的空间大小，单位字节
 */
@property (nonatomic,readonly) long totalSize;

/**
 *	@brief	用户最后登录时间，单位毫秒
 */
@property (nonatomic,readonly) CGFloat lastLoginTime;

/**
 *	@brief	用户最后修改时间，单位毫秒
 */
@property (nonatomic,readonly) CGFloat lastModifyTime;

/**
 *	@brief	该应用的默认笔记本
 */
@property (nonatomic,readonly) NSString *defaultNotebook;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *user;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	用户信息
 */
+ (SSYouDaoNoteUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
