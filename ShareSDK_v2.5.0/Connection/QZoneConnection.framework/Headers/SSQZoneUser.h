//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSQZoneCredential.h"
#import <ShareSDKCoreService/ISSCUserDescriptor.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	QQ空间用户
 */
@interface SSQZoneUser : NSObject <NSCoding,
                                   ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSQZoneCredential *_credential;
}

/**
 *	@brief	源数据结构
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	授权凭证
 */
@property (nonatomic,retain) SSQZoneCredential *credential;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) NSString *openId;

/**
 *	@brief	昵称
 */
@property (nonatomic,readonly) NSString *nickname;

/**
 *	@brief	大小为30×30像素的头像URL
 */
@property (nonatomic,readonly) NSString *figureurl;

/**
 *	@brief	大小为50×50像素的头像URL
 */
@property (nonatomic,readonly) NSString *figureurl1;

/**
 *	@brief	大小为100×100像素的头像URL
 */
@property (nonatomic,readonly) NSString *figureurl2;

/**
 *	@brief	性别,如果获取不到则默认返回“男”
 */
@property (nonatomic,readonly) NSString *gender;

/**
 *	@brief	标识是否为年费黄钻用户（NO：不是； YES：是）
 */
@property (nonatomic,readonly) BOOL isYellowYearVip;

/**
 *	@brief	标识用户是否为黄钻用户（NO：不是；YES：是）
 */
@property (nonatomic,readonly) BOOL vip;

/**
 *	@brief	黄钻等级
 */
@property (nonatomic,readonly) NSInteger level;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSQZoneUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
