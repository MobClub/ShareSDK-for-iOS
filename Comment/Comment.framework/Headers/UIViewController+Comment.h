//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SSCCommentListViewController.h"
#import "SSCCommentViewController.h"
#import "SSCCommentToolbar.h"

@interface UIViewController (Comment)

/**
 *	@brief	Presend a comment list view controller.
 *
 *  @param  contentId   Content id
 *  @param  title       Title
 *	@param 	animated 	Animated flag, YES, said animated transitions, NO means no animated transitions
 *
 *  @return A comment list view controller.
 */
- (SSCCommentListViewController *)presentCommentListViewControllerWithContentId:(NSString *)contentId
                                                                          title:(NSString *)title
                                                                       animated:(BOOL)animated;

/**
 *	@brief	Add comment list view controller from the navigation controller, this method must be the current view controller in the navigation view container.
 *
 *  @param  contentId   Content id.
 *  @param  title       Title
 *	@param 	animated 	Animated flag, YES, said animated transitions, NO means no animated transitions
 */
- (SSCCommentListViewController *)pushCommentListViewControllerWithContentId:(NSString *)contentId
                                                                       title:(NSString *)title
                                                                    animated:(BOOL)animated;

/**
 *	@brief	present a comment view controller.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Commented information, if it is nil, it means to comment on the topic
 *	@param 	animated 	Animated flag, YES, said animated transitions, NO means no animated transitions
 *	@param 	resultHandler 	Result handler.
 *
 *	@return	A comment view controller.
 */
- (SSCCommentViewController *)presentCommentViewControllerWithContentId:(NSString *)contentId
                                                                  title:(NSString *)title
                                                                comment:(id<ISSCComment>)comment
                                                               animated:(BOOL)animated
                                                                 result:(SSCReplyResultEvent)resultHandler;
/**
 *	@brief	Add comment view controller from the navigation controller, this method must be the current view controller in the navigation view container.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Commented information, if it is nil, it means to comment on the topic
 *	@param 	animated 	Animated flag, YES, said animated transitions, NO means no animated transitions
 *	@param 	resultHandler 	Result handler.
 *
 *	@return	Comment view controller.
 */
- (SSCCommentViewController *)pushCommentViewControllerWithContentId:(NSString *)contentId
                                                               title:(NSString *)title
                                                             comment:(id<ISSCComment>)comment
                                                            animated:(BOOL)animated
                                                              result:(SSCReplyResultEvent)resultHandler;


/**
 *	@brief	Show comment toolbar.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title.
 */
- (SSCCommentToolbar *)showCommentToolbarWithContentId:(NSString *)contentId
                                                 title:(NSString *)title;



@end
