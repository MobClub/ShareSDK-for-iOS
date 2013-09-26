//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSDouBanUser.h"
#import "SSDouBanEntity.h"
#import "SSDouBanSource.h"
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	广播信息
 */
@interface SSDouBanStatus : NSObject <NSCoding,
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
 *	@brief	是否可被回应
 */
@property (nonatomic,readonly) BOOL canReply;

/**
 *	@brief	attachments是一个json array格式的字符串， array里面的元素称为物,
 *          目前每条广播只支持单个物，物是每条广播表述的行为中的那个宾语，例如： xx推荐网址， 网址就是这个‘物’，
 */
@property (nonatomic,readonly) NSArray *attachments;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *category;

/**
 *	@brief	回应数
 */
@property (nonatomic,readonly) NSInteger commentsCount;

/**
 *	@brief	发广播的时间
 */
@property (nonatomic,readonly) NSString *createdAt;

/**
 *	@brief	暂无
 */
@property (nonatomic,retain) SSDouBanEntity *entities;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL hasPhoto;

/**
 *	@brief	广播id
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL isFollow;

/**
 *	@brief	赞的数量
 */
@property (nonatomic,readonly) NSInteger likeCount;

/**
 *	@brief	是否已经喜欢
 */
@property (nonatomic,readonly) BOOL liked;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL muted;

/**
 *	@brief	转播数
 */
@property (nonatomic,readonly) NSInteger resharedCount;

/**
 *	@brief	app key对应的应用名和应用url
 */
@property (nonatomic,readonly) SSDouBanSource *source;

/**
 *	@brief	web段在引号内展示的一段文本, 一般为用户输入的内容
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	广播的title
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *type;

/**
 *	@brief	发广播者
 */
@property (nonatomic,readonly) SSDouBanUser *user;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSDouBanStatus *)statusWithResponse:(NSDictionary *)response;

@end
