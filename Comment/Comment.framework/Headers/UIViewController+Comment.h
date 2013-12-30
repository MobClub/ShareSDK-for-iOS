//
//  UIViewController+Comment.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCCommentListViewController.h"
#import "SSCCommentViewController.h"
#import "SSCCommentToolbar.h"

@interface UIViewController (Comment)

/**
 *	@brief	弹出评论列表视图控制器
 *
 *  @param  contentId   内容唯一标识
 *  @param  title       标题
 *	@param 	animated 	动画标识，YES 表示动画过渡， NO 表示无动画过渡
 *
 *  @return 评论列表视图控制器
 */
- (SSCCommentListViewController *)presentCommentListViewControllerWithContentId:(NSString *)contentId
                                                                          title:(NSString *)title
                                                                       animated:(BOOL)animated;

/**
 *	@brief	从导航控制器中放入评论列表视图控制器，此方法必须要当前视图控制器在导航视图容器中。
 *
 *  @param  contentId   内容唯一标识
 *  @param  title       标题
 *	@param 	animated 	动画标识，YES 表示动画过渡， NO 表示无动画过渡
 */
- (SSCCommentListViewController *)pushCommentListViewControllerWithContentId:(NSString *)contentId
                                                                       title:(NSString *)title
                                                                    animated:(BOOL)animated;

/**
 *	@brief	弹出评论视图控制器
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	被评论信息，如果为nil，则表示对主题进行评论
 *	@param 	animated 	动画标识，YES 表示动画过渡， NO 表示无动画过渡
 *	@param 	resultHandler 	评论回调事件
 *
 *	@return	评论视图控制器
 */
- (SSCCommentViewController *)presentCommentViewControllerWithContentId:(NSString *)contentId
                                                                  title:(NSString *)title
                                                                comment:(id<ISSCComment>)comment
                                                               animated:(BOOL)animated
                                                                 result:(SSCReplyResultEvent)resultHandler;

/**
 *	@brief	从导航控制器中放入评论视图控制器，此方法必须要当前视图控制器在导航视图容器中。
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	被评论信息，如果为nil，则表示对主题进行评论
 *	@param 	animated 	动画标识，YES 表示动画过渡， NO 表示无动画过渡
 *	@param 	resultHandler 	评论回调事件
 *
 *	@return	评论视图控制器
 */
- (SSCCommentViewController *)pushCommentViewControllerWithContentId:(NSString *)contentId
                                                               title:(NSString *)title
                                                             comment:(id<ISSCComment>)comment
                                                            animated:(BOOL)animated
                                                              result:(SSCReplyResultEvent)resultHandler;



/**
 *	@brief	显示评论工具栏
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 */
- (SSCCommentToolbar *)showCommentToolbarWithContentId:(NSString *)contentId
                                                 title:(NSString *)title;



@end
