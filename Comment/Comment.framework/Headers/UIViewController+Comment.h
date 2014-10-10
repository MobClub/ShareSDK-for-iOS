///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <UIKit/UIKit.h>
#import "SSCCommentListViewController.h"
#import "SSCCommentViewController.h"
#import "SSCCommentToolbar.h"

@interface UIViewController (Comment)

///#begin zh-cn
/**
 *	@brief	弹出评论列表视图控制器
 *
 *  @param  contentId   内容唯一标识
 *  @param  title       标题
 *	@param 	animated 	动画标识，YES 表示动画过渡， NO 表示无动画过渡
 *
 *  @return 评论列表视图控制器
 */
///#end
///#begin en
/**
 *	@brief	Presend a comment list view controller.
 *
 *  @param  contentId   Content id
 *  @param  title       Title
 *	@param 	animated 	Animated flag, YES, said animated transitions, NO means no animated transitions
 *
 *  @return A comment list view controller.
 */
///#end
- (SSCCommentListViewController *)presentCommentListViewControllerWithContentId:(NSString *)contentId
                                                                          title:(NSString *)title
                                                                       animated:(BOOL)animated;

///#begin zh-cn
/**
 *	@brief	从导航控制器中放入评论列表视图控制器，此方法必须要当前视图控制器在导航视图容器中。
 *
 *  @param  contentId   内容唯一标识
 *  @param  title       标题
 *	@param 	animated 	动画标识，YES 表示动画过渡， NO 表示无动画过渡
 */
///#end
///#begin en
/**
 *	@brief	Add comment list view controller from the navigation controller, this method must be the current view controller in the navigation view container.
 *
 *  @param  contentId   Content id.
 *  @param  title       Title
 *	@param 	animated 	Animated flag, YES, said animated transitions, NO means no animated transitions
 */
///#end
- (SSCCommentListViewController *)pushCommentListViewControllerWithContentId:(NSString *)contentId
                                                                       title:(NSString *)title
                                                                    animated:(BOOL)animated;

///#begin zh-cn
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
///#end
///#begin en
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
///#end
- (SSCCommentViewController *)presentCommentViewControllerWithContentId:(NSString *)contentId
                                                                  title:(NSString *)title
                                                                comment:(id<ISSCComment>)comment
                                                               animated:(BOOL)animated
                                                                 result:(SSCReplyResultEvent)resultHandler;
///#begin zh-cn
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
///#end
///#begin en
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
///#end
- (SSCCommentViewController *)pushCommentViewControllerWithContentId:(NSString *)contentId
                                                               title:(NSString *)title
                                                             comment:(id<ISSCComment>)comment
                                                            animated:(BOOL)animated
                                                              result:(SSCReplyResultEvent)resultHandler;


///#begin zh-cn
/**
 *	@brief	显示评论工具栏
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 */
///#end
///#begin en
/**
 *	@brief	Show comment toolbar.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title.
 */
///#end
- (SSCCommentToolbar *)showCommentToolbarWithContentId:(NSString *)contentId
                                                 title:(NSString *)title;



@end
