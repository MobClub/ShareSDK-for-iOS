//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSSohuWeiboUser.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	微博信息
 */
@interface SSSohuWeiboStatus : NSObject <NSCoding,
                                         ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	创建时间
 */
@property (nonatomic,readonly) NSDate *createAt;

/**
 *	@brief	微博id
 */
@property (nonatomic,readonly) NSString *sid;

/**
 *	@brief	内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	是否收藏
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	转发微博id
 */
@property (nonatomic,readonly) NSString *inReplyToStatusId;

/**
 *	@brief	转发微博作者id
 */
@property (nonatomic,readonly) NSString *inReplyToUserId;

/**
 *	@brief	转发微博作者昵称
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	转发微博内容
 */
@property (nonatomic,readonly) NSString *inReplyToStatusText;

/**
 *	@brief	小图
 */
@property (nonatomic,readonly) NSString *smallPic;

/**
 *	@brief	中图
 */
@property (nonatomic,readonly) NSString *middlePic;

/**
 *	@brief	原图
 */
@property (nonatomic,readonly) NSString *originalPic;

/**
 *	@brief	用户信息
 */
@property (nonatomic,readonly) SSSohuWeiboUser *userInfo;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;


/**
 *	@brief	创建搜狐微博信息
 *
 *	@param 	response 	回复信息
 *
 *	@return	微博信息
 */
+ (SSSohuWeiboStatus *)statusWithResponse:(NSDictionary *)response;

@end
