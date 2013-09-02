//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSohuCredential.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/ISSCUserDescriptor.h>

/**
 *	@brief	搜狐用户
 */
@interface SSSohuUser : NSObject <NSCoding,
                                  ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
    SSSohuCredential *_credential;
}

/**
 *	@brief	授权信息，如果为nil则表示非当前应用授权用户
 */
@property (nonatomic,retain) SSSohuCredential *credential;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	用户展示页的URL
 */
@property (nonatomic,readonly) NSString *homeUrl;

/**
 *	@brief	用户头像小图的URL
 */
@property (nonatomic,readonly) NSString *icon;

/**
 *	@brief	昵称
 */
@property (nonatomic,readonly) NSString *nick;

/**
 *	@brief	搜狐用户ID
 */
@property (nonatomic,readonly) NSString *openId;

/**
 *	@brief	用户名字
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户头像大图的URL
 */
@property (nonatomic,readonly) NSString *image;

/**
 *	@brief	出生年份
 */
@property (nonatomic) NSInteger birthdayYear;

/**
 *	@brief	出生月份
 */
@property (nonatomic) NSInteger birthdayMonth;

/**
 *	@brief	出生日期
 */
@property (nonatomic) NSInteger birthdayDay;


/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSSohuUser *)userWithResponse:(NSDictionary *)response;

/**
 *	@brief	创建用户信息描述器
 *
 *	@return	描述器对象
 */
- (id<ISSCUserDescriptor>)descriptor;

@end
