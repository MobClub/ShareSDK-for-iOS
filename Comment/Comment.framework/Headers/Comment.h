//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import "ISSCContentFilter.h"
#import "ISSCCommentList.h"
#import "SSCommentTypeDef.h"
#import "UIViewController+Comment.h"
#import "SSCCommentListView.h"
#import "ISSCComment.h"
#import "SSCCommentViewController.h"

/**
 *	@brief	Common & Like
 */
@interface Comment : NSObject

#pragma mark - 评论、称赞、分享（含UI）

/**
 *	@brief	Create a comment view controller.
 *
 *	@param 	contentId 	Content id
 *	@param 	title 	Title
 *	@param 	comment 	Peer-reviewed content, if it is nil, it means to comment on the topic
 *  @param  resultHandler       Result handler.
 *
 *  @return Comment view controller.
 */
+ (SSCCommentViewController *)commentViewWithContentId:(NSString *)contentId
                                                 title:(NSString *)title
                                               comment:(id<ISSCComment>)comment
                                                result:(SSCReplyResultEvent)resultHandler;

/**
 *	@brief	Create a comment list page view.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *
 *	@return	Comment list view controller.
 */
+ (SSCCommentListViewController *)commentListViewPageWithContentId:(NSString *)contentId
                                                             title:(NSString *)title;

/**
 *	@brief	Create a complex comment list view.
 *
 *	@param 	contentId 	Content id
 *  @param  title   Title
 *	@param 	menuItems 	Menu items
 *	@param 	frame 	Display rect
 *
 *	@return	Comment list view.
 */
+ (SSCCommentListView *)complexCommentListViewWithContentId:(NSString *)contentId
                                                      title:(NSString *)title
                                                  menuItems:(NSArray *)menuItems
                                                      frame:(CGRect)frame;

/**
 *	@brief	Create a comment list view
 *
 *	@param 	cotentId 	Content id
 *  @param  title   Title
 *	@param 	order 	Order
 *  @param  frame   Display rect
 *
 *	@return	Comment list view.
 */
+ (SSCCommentListView *)commentListViewWithContentId:(NSString *)contentId
                                               title:(NSString *)title
                                               order:(NSComparator)order
                                               frame:(CGRect)frame;
/**
 *	@brief	Create a comment toolbar.
 *
 *	@param 	contentId 	Content id.
 *  @param  title   Title
 *  @param  frame   Display rect.
 *
 *	@return	Comment toolbar object.
 */
+ (SSCCommentToolbar *)commentToolbarWithContentId:(NSString *)contentId
                                             title:(NSString *)title
                                             frame:(CGRect)frame;

/**
 *	@brief	A share menu to display.
 *
 *	@param 	contentId 	Content id
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *	@param 	contentEntity 	Share content entity. Used to define the contents of each platform to share comments.
 *  @param  resultHandler  Result handler，callback to capture state changes
 */
+ (id<ISSShareActionSheet>)showShareActionSheetWithContentId:(NSString *)contentId
                                                       title:(NSString *)title
                                                     comment:(id<ISSCComment>)comment
                                               contentEntity:(id<ISSContent>)contentEntity
                                                      result:(SSPublishContentEventHandler)resultHandler;


#pragma mark - 评论、称赞、分享（无UI）

/**
 *	@brief	One key share content.
 *
 *  @param  shareList   Platform type list,（E-mail, SMS, WeChat, QQ, Pinterest, Google+, print, copy except）
 *  @param  contentId   Content id.
 *  @param  title       Title
 *  @param  comment     Comment objects, if it is non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *	@param 	contentEntity 	Share content entity. Used to define the contents of each platform to share comments.
 *	@param 	resultHandler 	Result handler，callback to capture state changes
 */
+ (void)oneKeyShareContentWithShareList:(NSArray *)shareList
                              contentId:(NSString *)contentId
                                  title:(NSString *)title
                                comment:(id<ISSCComment>)comment
                          contentEntity:(id<ISSContent>)contentEntity
                                 result:(SSPublishContentEventHandler)resultHandler;

/**
 *	@brief	Contents / comments to share
 *
 *  @param  type        Platform type.
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *  @param  contentEntity   Share content entity. Used to define the contents of each platform to share comments.
 *	@param 	resultHandler 	Result handler，callback to capture state changes
 */
+ (void)shareContentWithType:(ShareType)type
                   contentId:(NSString *)contentId
                       title:(NSString *)title
                     comment:(id<ISSCComment>)comment
               contentEntity:(id<ISSContent>)contentEntity
                      result:(SSPublishContentEventHandler)resultHandler;

@end
