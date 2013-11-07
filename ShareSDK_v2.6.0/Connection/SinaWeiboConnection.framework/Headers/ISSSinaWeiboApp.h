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
#import "SSSinaWeiboUser.h"
#import "SSSinaWeiboErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSSinaWeiboRequestMethodGet = 0, /**< GET方式 */
	SSSinaWeiboRequestMethodPost = 1, /**< POST方式 */
	SSSinaWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSSinaWeiboRequestMethod;

/**
 *	@brief	新浪微博应用协议
 */
@protocol ISSSinaWeiboApp <ISSPlatformApp>

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)appKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)appSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	获取SSO回调地址列表
 *
 *	@return	回调地址列表
 */
- (NSArray *)ssoCallbackUrls;

/**
 *	@brief	检测是否允许使用客户端进行分享
 *
 *	@return	YES 表示允许， NO 表示不允许
 */
- (BOOL)checkAllowClientShare;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSSinaWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	发布一条新微博
 *
 *	@param 	status 	微博内容
 *  @param  locationCoordinate  地理位置信息，可以为nil
 *  @param  result  回调方法
 */
- (void)updateWithStatus:(NSString *)status
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	上传图片并发布一条新微博
 *
 *	@param 	status 	微博内容
 *	@param 	pic 	图片数据
 *  @param  locationCoordinate  地理位置信息，可以为nil
 *  @param  result  回调方法
 */
- (void)uploadWithStatus:(NSString *)status
                     pic:(id<ISSCAttachment>)pic
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	指定一个图片URL地址抓取后上传并同时发布一条新微博
 *
 *	@param 	status 	微博内容
 *	@param 	url 	图片的URL地址，必须以http开头。
 *  @param  locationCoordinate  地理位置信息，可以为nil
 *  @param  result  回调方法
 */
- (void)uploadWithStatus:(NSString *)status
                     url:(NSString *)url
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	调用新浪微博客户端进行分享
 *
 *	@param 	text 	分享内容
 *	@param 	image 	图片
 *  @param  result  回调方法
 */
- (void)shareWithText:(NSString *)text
                image:(id<ISSCAttachment>)image
               result:(SSShareResultEvent)result;

/**
 *	@brief	调用新浪微博客户端进行网页分享
 *
 *	@param 	text 	分享内容
 *	@param 	webPageId 	网页标识
 *	@param 	webPageTitle 	网页标题
 *	@param 	webPageDescription 	网页描述
 *	@param 	webPageThumbnail 	网页缩略图
 *	@param 	webPageUrl 	网页链接
 *  @param  result  回调方法
 */
- (void)shareWithText:(NSString *)text
            webPageId:(NSString *)webPageId
         webPageTitle:(NSString *)webPageTitle
   webPageDescription:(NSString *)webPageDescription
     webPageThumbnail:(id<ISSCAttachment>)webPageThumbnail
           webPageUrl:(NSString *)webPageUrl
               result:(SSShareResultEvent)result;


/**
 *	@brief	获取默认授权用户的粉丝列表
 *
 *	@param 	cursor 	返回结果的游标，下一页用返回值里的next_cursor，上一页用previous_cursor，默认为0。
 *	@param 	count 	单页返回的记录条数，默认为50，最大不超过200。
 *	@param 	trimStatus 	返回值中user字段中的status字段开关，0：返回完整status字段、1：status字段仅返回status_id，默认为1。
 *  @param  result  回调方法
 */
- (void)myFollowersWithCursor:(NSInteger)cursor
                        count:(NSInteger)count
                   trimStatus:(NSInteger)trimStatus
                       result:(void(^)(BOOL result, NSArray *users, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;

/**
 *	@brief	获取某微博的评论列表
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	微博ID
 */
- (void)commentsWithStatusId:(long long)statusId
                      result:(void(^)(BOOL result, NSArray *comments, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;

/**
 *	@brief	获取某微博的评论列表
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	微博ID
 *  @param  page        返回结果的页码，默认为1。
 *  @param  count       单页返回的记录条数，默认为50。
 *  @param  sinceId     若指定此参数，则返回ID比since_id大的评论（即比since_id时间晚的评论），默认为0。
 *  @param  maxId       若指定此参数，则返回ID小于或等于max_id的评论，默认为0。
 *  @param  filterByAuthor      作者筛选类型，0：全部、1：我关注的人、2：陌生人，默认为0。
 */
- (void)commentsWithStatusId:(long long)statusId
                        page:(NSInteger)page
                       count:(NSInteger)count
                     sinceId:(long long)sinceId
                       maxId:(long long)maxId
              filterByAuthor:(NSInteger)filterByAuthor
                      result:(void(^)(BOOL result, NSArray *comments, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;

/**
 *	@brief	获取收藏列表
 *
 *  @since  ver1.0.3
 *
 *  @param  result  返回回调
 */
- (void)favorites:(void(^)(BOOL result, NSArray *favorites, NSInteger totalNumber, CMErrorInfo *error))result;

/**
 *	@brief	获取收藏列表
 *
 *  @since  ver1.0.3
 *
 *	@param 	page 	返回结果的页码，默认为1
 *	@param 	count 	单页返回的记录条数，默认为50。
 *  @param  result  返回回调
 */
- (void)favoritesWithPage:(NSInteger)page
                    count:(NSInteger)count
                   result:(void(^)(BOOL result, NSArray *favorites, NSInteger totalNumber, CMErrorInfo *error))result;

/**
 *	@brief	回复评论
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	需要评论的微博ID。
 *	@param 	commentId 	需要回复的评论ID。
 *	@param 	comment 	回复评论内容，内容不超过140个汉字。
 *  @param  result  返回回调
 */
- (void)replyCommentWithStatusId:(long long)statusId
                       commentId:(long long)commentId
                         comment:(NSString *)comment
                          result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	回复评论
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	需要评论的微博ID。
 *	@param 	commentId 	需要回复的评论ID。
 *	@param 	comment 	回复评论内容，内容不超过140个汉字。
 *	@param 	withoutMention 	回复中是否自动加入“回复@用户名”，0：是、1：否，默认为0。
 *	@param 	commentOri 	当评论转发微博时，是否评论给原微博，0：否、1：是，默认为0。
 *  @param  result  返回回调
 */
- (void)replyCommentWithStatusId:(long long)statusId
                       commentId:(long long)commentId
                         comment:(NSString *)comment
                  withoutMention:(NSInteger)withoutMention
                      commentOri:(NSInteger)commentOri
                          result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	评论微博
 *
 *	@param 	statusId 	需要评论的微博ID。
 *	@param 	comment 	评论内容，内容不超过140个汉字
 *  @param  result  返回回调
 */
- (void)commentStatusWithId:(long long)statusId
                    comment:(NSString *)comment
                     result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;


/**
 *	@brief	评论微博
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	需要评论的微博ID。
 *	@param 	comment 	评论内容，内容不超过140个汉字。
 *	@param 	commentOri 	当评论转发微博时，是否评论给原微博，0：否、1：是，默认为0。
 *  @param  result  返回回调
 */
- (void)commentStatusWithId:(long long)statusId
                    comment:(NSString *)comment
                 commentOri:(NSInteger)commentOri
                     result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	收藏微博信息
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	微博ID
 *  @param  result  返回回调
 */
- (void)favoriteStatusWithId:(long long)statusId
                      result:(void(^)(BOOL result, id favorite, CMErrorInfo *error))result;

/**
 *	@brief	转发微博
 *
 *	@param 	statusId 	微博ID
 *  @param  result  返回回调
 */
- (void)repostStatusWithId:(long long)statusId
                    result:(void(^)(BOOL result, id status, CMErrorInfo *error))result;

/**
 *	@brief	转发微博
 *
 *	@param 	statusId 	微博ID
 *	@param 	status 	添加的转发文本，内容不超过140个汉字，不填则默认为“转发微博”。
 *	@param 	isComment 	是否在转发的同时发表评论，0：否、1：评论给当前微博、2：评论给原微博、3：都评论，默认为0 。
 *  @param  result  返回回调
 */
- (void)repostStatusWithId:(long long)statusId
                    status:(NSString *)status
                 isComment:(NSInteger)isComment
                    result:(void(^)(BOOL result, id status, CMErrorInfo *error))result;

/**
 *	@brief	获取我的微博列表
 *
 *	@param 	page 	返回结果的页码，默认为1
 *	@param 	count 	单页返回的记录条数，最大不超过100，默认为20。
 *	@param 	sinceId 	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
 *	@param 	maxId 	若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
 *	@param 	baseApp 	是否只获取当前应用的数据。0为否（所有数据），1为是（仅当前应用），默认为0。
 *	@param 	feature 	过滤类型ID，0：全部、1：原创、2：图片、3：视频、4：音乐，默认为0。
 *	@param 	trimUser 	返回值中user字段开关，0：返回完整user字段、1：user字段仅返回user_id，默认为0。
 */
- (void)myTimelineWithPage:(NSInteger)page
                     count:(NSInteger)count
                   sinceId:(long long)sinceId
                     maxId:(long long)maxId
                   baseApp:(NSInteger)baseApp
                   feature:(NSInteger)feature
                  trimUser:(NSInteger)trimUser
                    result:(void(^)(BOOL result, NSArray *statuses, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;


@end
