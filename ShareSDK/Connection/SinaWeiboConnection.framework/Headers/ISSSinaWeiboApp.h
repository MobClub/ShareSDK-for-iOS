//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSSinaWeiboUser.h"
#import "SSSinaWeiboErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method
 */
typedef enum
{
	SSSinaWeiboRequestMethodGet = 0, /**< GET方式 */
	SSSinaWeiboRequestMethodPost = 1, /**< POST方式 */
	SSSinaWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSSinaWeiboRequestMethod;

/**
 *	@brief	Sina Weibo App Protocol.
 */
@protocol ISSSinaWeiboApp <ISSPlatformApp>

/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
- (NSString *)appKey;

/**
 *	@brief	Get app secret.
 *
 *	@return	App secret.
 */
- (NSString *)appSecret;

/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Get SSO callback URLs.
 *
 *	@return	SSO callback URLs.
 */
- (NSArray *)ssoCallbackUrls;

/**
 *	@brief	Detects whether clients are allowed to share
 *
 *	@return	YES means allow, NO means no
 */
- (BOOL)checkAllowClientShare;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSSinaWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Publish a new status.
 *
 *	@param 	status 	Content string.
 *  @param  locationCoordinate  Location information, which can be nil
 *  @param  result  Result handler.
 */
- (void)updateWithStatus:(NSString *)status
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	Upload image and publish a new status.
 *
 *	@param 	status 	Content string.
 *	@param 	pic 	Image attachment.
 *  @param  locationCoordinate  Location information, which can be nil
 *  @param  result  Result handler.
 */
- (void)uploadWithStatus:(NSString *)status
                     pic:(id<ISSCAttachment>)pic
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	After specifying a URL address to crawl upload pictures and also publish a new status.
 *
 *	@param 	status 	Content string.
 *	@param 	url 	Image URL address, must begin with http.
 *  @param  locationCoordinate  Location information, which can be nil
 *  @param  result  Result handler.
 */
- (void)uploadWithStatus:(NSString *)status
                     url:(NSString *)url
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	Call Sina Weibo client for sharing
 *
 *	@param 	text 	Content string.
 *	@param 	image 	Image attachment.
 *  @param  result  Result handler.
 */
- (void)shareWithText:(NSString *)text
                image:(id<ISSCAttachment>)image
               result:(SSShareResultEvent)result;

/**
 *	@brief	Call Sina Weibo client for web page sharing
 *
 *	@param 	text 	Content string.
 *	@param 	webPageId 	Web page id.
 *	@param 	webPageTitle 	Web page title.
 *	@param 	webPageDescription 	Web page description.
 *	@param 	webPageThumbnail 	Web page thumbnail.
 *	@param 	webPageUrl 	Web page url
 *  @param  result  Result handler
 */
- (void)shareWithText:(NSString *)text
            webPageId:(NSString *)webPageId
         webPageTitle:(NSString *)webPageTitle
   webPageDescription:(NSString *)webPageDescription
     webPageThumbnail:(id<ISSCAttachment>)webPageThumbnail
           webPageUrl:(NSString *)webPageUrl
               result:(SSShareResultEvent)result;

/**
 *	@brief	Get my followers.
 *
 *	@param 	cursor 	Return result cursor, use the return value in the next next_cursor, previous use previous_cursor, the default is 0.
 *	@param 	count 	The number of records returned by one page, the default is 50, the maximum does not exceed 200.
 *	@param 	trimStatus 	The return value of the field in the user status field switch, 0: Back to full status field, 1: status field returns only status_id, the default is 1.
 *  @param  result  Result handler.
 */
- (void)myFollowersWithCursor:(NSInteger)cursor
                        count:(NSInteger)count
                   trimStatus:(NSInteger)trimStatus
                       result:(void(^)(BOOL result, NSArray *users, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;

/**
 *	@brief	Get comments.
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	Status id.
 */
- (void)commentsWithStatusId:(long long)statusId
                      result:(void(^)(BOOL result, NSArray *comments, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;

/**
 *	@brief	Get comments.
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	Status id.
 *  @param  page        Page No，Default is 1。
 *  @param  count       The number of records returned by one page, the default is 50.
 *  @param  sinceId     If this parameter is specified, then return ID Larger than since_id comment information (ie later than since_id time status), the default is 0.
 *  @param  maxId       If this parameter is specified, then return ID is less than or equal to max_id status, the default is 0.
 *  @param  filterByAuthor      Filter author type 0: All 1: I am concerned about people, 2: strangers, the default is 0.
 */
- (void)commentsWithStatusId:(long long)statusId
                        page:(NSInteger)page
                       count:(NSInteger)count
                     sinceId:(long long)sinceId
                       maxId:(long long)maxId
              filterByAuthor:(NSInteger)filterByAuthor
                      result:(void(^)(BOOL result, NSArray *comments, NSInteger totalNumber, NSInteger nextCursor, NSInteger previousCursor, CMErrorInfo *error))result;

/**
 *	@brief	Get favorites.
 *
 *  @since  ver1.0.3
 *
 *  @param  result  Result handler.
 */
- (void)favorites:(void(^)(BOOL result, NSArray *favorites, NSInteger totalNumber, CMErrorInfo *error))result;

/**
 *	@brief	Get favorites.
 *
 *  @since  ver1.0.3
 *
 *	@param 	page 	page No，Default is 1.
 *	@param 	count 	The number of records returned by one page, the default is 50.
 *  @param  result  Result handler.
 */
- (void)favoritesWithPage:(NSInteger)page
                    count:(NSInteger)count
                   result:(void(^)(BOOL result, NSArray *favorites, NSInteger totalNumber, CMErrorInfo *error))result;

/**
 *	@brief	Reply comment.
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	Need to comment status id.
 *	@param 	commentId 	Need to repley comment id.
 *	@param 	comment 	Reply to comment content, content is not more than 140 characters.
 *  @param  result  Result handler.
 */
- (void)replyCommentWithStatusId:(long long)statusId
                       commentId:(long long)commentId
                         comment:(NSString *)comment
                          result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	Reply comment.
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	Need to comment status id
 *	@param 	commentId 	Need to reply comment id.
 *	@param 	comment 	Reply to comment content, content is not more than 140 characters.
 *	@param 	withoutMention 	Reply whether to automatically add "Reply @username", 0: yes, 1: No, the default is 0.
 *	@param 	commentOri 	When comments repost status, whether to the original comment status, 0: no, 1: yes, the default is 0.
 *  @param  result  Result handler.
 */
- (void)replyCommentWithStatusId:(long long)statusId
                       commentId:(long long)commentId
                         comment:(NSString *)comment
                  withoutMention:(NSInteger)withoutMention
                      commentOri:(NSInteger)commentOri
                          result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	Comment status.
 *
 *	@param 	statusId 	Need to comment status ID.
 *	@param 	comment 	Content, content is not more than 140 characters.
 *  @param  result  Result handler.
 */
- (void)commentStatusWithId:(long long)statusId
                    comment:(NSString *)comment
                     result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	Comment status.
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	Need to comment status ID.
 *	@param 	comment 	Content, content is not more than 140 characters.
 *	@param 	commentOri 	When comments repost status, whether to the original comment status, 0: no, 1: yes, the default is 0.
 *  @param  result  Result handler.
 */
- (void)commentStatusWithId:(long long)statusId
                    comment:(NSString *)comment
                 commentOri:(NSInteger)commentOri
                     result:(void(^)(BOOL result, id comment, CMErrorInfo *error))result;

/**
 *	@brief	Favorite Status.
 *
 *  @since  ver1.0.3
 *
 *	@param 	statusId 	Status id.
 *  @param  result  Result handler.
 */
- (void)favoriteStatusWithId:(long long)statusId
                      result:(void(^)(BOOL result, id favorite, CMErrorInfo *error))result;

/**
 *	@brief	Repost status.
 *
 *	@param 	statusId 	Status id.
 *  @param  result  Result handler.
 */
- (void)repostStatusWithId:(long long)statusId
                    result:(void(^)(BOOL result, id status, CMErrorInfo *error))result;

/**
 *	@brief	Repost status.
 *
 *	@param 	statusId 	Status id.
 *	@param 	status 	Repost text is added, the content is not more than 140 characters, do not fill the default is "转发微博"
 *	@param 	isComment 	Whether to repost and comment status. 0: no, 1: Comments to the current Status, 2: Comments to the original Status, 3: all comments, default is 0.
 *  @param  result  Result handler.
 */
- (void)repostStatusWithId:(long long)statusId
                    status:(NSString *)status
                 isComment:(NSInteger)isComment
                    result:(void(^)(BOOL result, id status, CMErrorInfo *error))result;

/**
 *	@brief	Get my timeline.
 *
 *	@param 	page 	Page No，Default is 1
 *	@param 	count 	The number of records returned by one page, the maximum does not exceed 100, the default is 20.
 *	@param 	sinceId 	If this parameter is specified, then return ID Less than or equal to since_id status information (ie later than since_id time status), the default is 0.
 *	@param 	maxId 	If this parameter is specified, then return ID is less than or equal to max_id status, the default is 0.
 *	@param 	baseApp 	Whether the current application only access to data. 0 NO (all data), 1 YES (current application only), the default is 0.
 *	@param 	feature 	Filter type ID, 0: All 1: Original, 2: Picture 3: Video 4: Music, default is 0.
 *	@param 	trimUser 	The return value of user field switch, 0: return the complete user field, 1: user field returns only user_id, default is 0.
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
