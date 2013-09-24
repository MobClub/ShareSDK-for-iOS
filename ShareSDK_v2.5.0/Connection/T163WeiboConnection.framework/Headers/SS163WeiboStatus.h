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

@class SS163WeiboUser;

/**
 *	@brief	微博信息
 */
@interface SS163WeiboStatus : NSObject <NSCoding,
                                        ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	微博ID
 */
@property (nonatomic,readonly) NSString *sid;

/**
 *	@brief	微博信息来源
 */
@property (nonatomic,readonly) NSString *source;

/**
 *	@brief	微博类型，normal即原创，retweet即转发，reply即评论，deleted即删除
 */
@property (nonatomic,readonly) NSString *flag;

/**
 *	@brief	微博作者信息，具体字段见用户(users)
 */
@property (nonatomic,readonly) SS163WeiboUser *user;

/**
 *	@brief	微博创建时间
 */
@property (nonatomic,readonly) NSDate *createdAt;

/**
 *	@brief	微博正文
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	回复的微博id
 */
@property (nonatomic,readonly) NSString *inReplyToStatusId;

/**
 *	@brief	回复的微博作者的id
 */
@property (nonatomic,readonly) NSString *inReplyToUserId;

/**
 *	@brief	回复的微博作者的个性网址
 */
@property (nonatomic,readonly) NSString *inReplyToScreenName;

/**
 *	@brief	被转发数
 */
@property (nonatomic,readonly) NSInteger retweetCount;

/**
 *	@brief	被评论数
 */
@property (nonatomic,readonly) NSInteger commentsCount;

/**
 *	@brief	用户收藏时间（如未收藏则为null）
 */
@property (nonatomic,readonly) NSDate *favoritedAt;

/**
 *	@brief	回复的微博正文
 */
@property (nonatomic,readonly) NSString *inReplyToStatusText;

/**
 *	@brief	回复微博的作者昵称
 */
@property (nonatomic,readonly) NSString *inReplyToUserName;

/**
 *	@brief	是否收藏
 */
@property (nonatomic,readonly) BOOL favorited;

/**
 *	@brief	timeline上该微博的游标，在timeline上需传递此参数进行分页
 */
@property (nonatomic,readonly) NSString *cursorId;

/**
 *	@brief	整个对话中根微博ID
 */
@property (nonatomic,readonly) NSString *rootInReplyToStatusId;

/**
 *	@brief	是否被其他用户转发
 */
@property (nonatomic,readonly) BOOL isRetweetByUser;

/**
 *	@brief	转发用户ID（返回用户关注者中第一个转发此微博）
 */
@property (nonatomic,readonly) NSString *retweetUserId;

/**
 *	@brief	转发用户的昵称
 */
@property (nonatomic,readonly) NSString *retweetUserName;

/**
 *	@brief	转发用户的个性网址
 */
@property (nonatomic,readonly) NSString *retweetUserScreenName;

/**
 *	@brief	转发时间
 */
@property (nonatomic,readonly) NSDate *retweetCreatedAt;

/**
 *	@brief	微博原文作者的user_id
 */
@property (nonatomic,readonly) NSString *rootInReplyToUserId;

/**
 *	@brief	微博原文作者的screen_name
 */
@property (nonatomic,readonly) NSString *rootInReplyToScreenName;

/**
 *	@brief	微博原文作者的昵称
 */
@property (nonatomic,readonly) NSString *rootInReplyToUserName;

/**
 *	@brief	微博原文内容
 */
@property (nonatomic,readonly) NSString *rootInReplyToStatusText;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *geo;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *inReplyToMusicInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *inReplyToPreviewLinkInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *inReplyToSongInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *inReplyToVideoInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *musicInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *previewLinkInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *songInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *rootInReplyToMusicInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *rootInReplyToPreviewLinkInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *rootInReplyToSongInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *rootInReplyToVideoInfos;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSInteger rootRetweetCount;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) BOOL truncated;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *venue;

/**
 *	@brief	暂无
 */
@property (nonatomic,readonly) NSString *videoInfos;

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;


/**
 *	@brief	创建微博信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	微博信息
 */
+ (SS163WeiboStatus *)statusWithResponse:(NSDictionary *)response;

@end
