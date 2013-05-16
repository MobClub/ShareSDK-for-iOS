//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	提及用户信息
 */
@interface SSTwitterUserMention : NSObject
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	用户ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	用户ID字符串
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	用提及用户信息的起始位置和结束位置索引
 */
@property (nonatomic,readonly) NSArray *indices;

/**
 *	@brief	用户名称
 */
@property (nonatomic,readonly) NSString *name;

/**
 *	@brief	用户屏幕名称
 */
@property (nonatomic,readonly) NSString *screenName;

/**
 *	@brief	创建提及用户信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	提及用户信息
 */
+ (SSTwitterUserMention *)userMentionWithResponse:(NSDictionary *)response;

@end
