//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ISSCDataObject.h>

@class SSSinaWeiboUser;
@class SSSinaWeiboStatus;

/**
 *	@brief	新浪评论信息
 */
@interface SSSinaWeiboComment : NSObject <NSCoding,
                                          ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	评论创建时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	评论的ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	评论的内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	评论的来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	评论作者的用户信息
 */
@property (nonatomic,readonly) SSSinaWeiboUser *user;

/**
 *	@brief	评论的MID
 */
@property (nonatomic,readonly) NSString *mid;

/**
 *	@brief	字符串型的评论ID
 */
@property (nonatomic,readonly) NSString *idStr;

/**
 *	@brief	评论的微博信息
 */
@property (nonatomic,readonly) SSSinaWeiboStatus *status;

/**
 *	@brief	评论来源评论，当本评论属于对另一评论的回复时返回此字段
 */
@property (nonatomic,readonly) SSSinaWeiboComment *replyComment;

/**
 *	@brief	创建评论信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	评论信息
 */
+ (SSSinaWeiboComment *)commentWithResponse:(NSDictionary *)response;


@end
