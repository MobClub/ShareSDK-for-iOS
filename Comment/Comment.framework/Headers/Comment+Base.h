//
//  Comment+Base.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "Comment.h"
#import "SSCCommentMenuItem.h"
#import "SSCCommentListView.h"
#import "SSCCommentListViewController.h"
#import "SSCCommentToolbar.h"
#import "ISSCComment.h"
#import "ISSCCounter.h"
#import "SSCViewDesc.h"
#import "SSCCommentViewController.h"

@interface Comment (Base)

#pragma mark - 评论、称赞、分享（含UI）

/**
 *	@brief	创建评论视图
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	被评论的评论内容，如果为nil，则表示对主题进行评论
 *	@param 	shareDesc 	分享操作相关设置
 *	@param 	viewDesc 	视图描述，用于定义视图样式、显示方式等
 *  @param  resultHandler   返回事件回调
 *
 *	@return	评论视图控制器
 */
+ (SSCCommentViewController *)commentViewWithContentId:(NSString *)contentId
                                                 title:(NSString *)title
                                               comment:(id<ISSCComment>)comment
                                             shareDesc:(SSCShareDesc *)shareDesc
                                              viewDesc:(SSCViewDesc *)viewDesc
                                                result:(SSCReplyResultEvent)resultHandler;



/**
 *	@brief	创建评论列表页面
 *
 *	@param 	container 	视图容器，指定列表视图在那个视图中显示。
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	contentView 	内容视图
 *  @param  shareDesc   分享操作相关设置
 *	@param 	viewDesc 	视图描述，用于定义视图样式、显示方式等。
 *
 *	@return	评论列表页面视图控制器
 */
+ (SSCCommentListViewController *)commentListViewPageWithContentId:(NSString *)contentId
                                                             title:(NSString *)title
                                                       contentView:(UIView *)contentView
                                                         shareDesc:(SSCShareDesc *)shareDesc
                                                          viewDesc:(SSCViewDesc *)viewDesc;

/**
 *	@brief	创建复合评论列表视图
 *
 *	@param 	contentId 	内容唯一标识
 *  @param  title   标题
 *	@param 	menuItems 	菜单项集合
 *	@param 	frame 	显示范围
 *  @param  shareDesc   分享操作相关设置
 *	@param 	viewDesc 	视图描述，用于定义视图样式等
 *
 *	@return	评论列表视图
 */
+ (SSCCommentListView *)complexCommentListViewWithContentId:(NSString *)contentId
                                                      title:(NSString *)title
                                                  menuItems:(NSArray *)menuItems
                                                      frame:(CGRect)frame
                                                  shareDesc:(SSCShareDesc *)shareDesc
                                                   viewDesc:(SSCViewDesc *)viewDesc;


/**
 *	@brief	创建评论列表视图
 *
 *	@param 	cotentId 	内容唯一标识
 *  @param  title   标题
 *	@param 	order 	排序方法
 *  @param  frame   显示范围
 *  @param  shareDesc   分享操作相关设置
 *	@param 	viewDesc 	视图描述，用于定义视图样式等
 *
 *	@return	评论列表视图
 */
+ (SSCCommentListView *)commentListViewWithContentId:(NSString *)contentId
                                               title:(NSString *)title
                                               order:(NSComparator)order
                                               frame:(CGRect)frame
                                           shareDesc:(SSCShareDesc *)shareDesc
                                            viewDesc:(SSCViewDesc *)viewDesc;

/**
 *	@brief	创建评论工具栏
 *
 *	@param 	contentId 	内容唯一标识
 *  @param  title   标题
 *  @param  frame   显示范围
 *  @param  shareDesc   分享操作相关设置
 *	@param 	viewDesc 	视图描述，用于定义视图样式等（暂未使用）
 *
 *	@return	评论工具栏
 */
+ (SSCCommentToolbar *)commentToolbarWithContentId:(NSString *)contentId
                                             title:(NSString *)title
                                             frame:(CGRect)frame
                                         shareDesc:(SSCShareDesc *)shareDesc
                                          viewDesc:(SSCViewDesc *)viewDesc;

/**
 *	@brief	显示分享菜单
 *
 *	@param 	container 	用于显示分享界面的容器，如果只显示在iPhone客户端可以传入nil。如果需要在iPad上显示需要指定容器。
 *	@param 	shareList 	平台类型列表
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行分享，如果为nil，则表示对内容进行分享。
 *	@param 	contentEntity 	分享内容实体。用于定义各个平台分享评论时的内容。
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  authOptions 授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等），默认可传入nil
 *  @param  shareOptions    分享选项，用于定义分享视图部分属性（如：标题、一键分享列表、功能按钮等）,默认可传入nil
 *  @param  resultHandler  分享返回事件处理
 */
+ (id<ISSShareActionSheet>)showShareActionSheet:(id<ISSContainer>)container
                                      shareList:(NSArray *)shareList
                                      contentId:(NSString *)contentId
                                          title:(NSString *)title
                                        comment:(id<ISSCComment>)comment
                                  contentEntity:(id<ISSContent>)contentEntity
                                  statusBarTips:(BOOL)statusBarTips
                                    authOptions:(id<ISSAuthOptions>)authOptions
                                   shareOptions:(id<ISSShareOptions>)shareOptions
                                         result:(SSPublishContentEventHandler)resultHandler;


#pragma mark - 评论、称赞、分享（无UI）

/**
 *	@brief	获取主题信息
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	resultHandler 	返回处理器，在接口返回时触发。
 */
+ (void)topicWithContentId:(NSString *)contentId
                    result:(SSCGetTopicResultEvent)resultHandler;

/**
 *	@brief	获取评论列表
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	order 	排序方法
 *
 *	@return	评论列表对象
 */
+ (id<ISSCCommentList>)commentListWithContentId:(NSString *)contentId
                                          title:(NSString *)title
                                          order:(NSComparator)order;

/**
 *	@brief	对内容/评论进行评论
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行评论，如果为nil，则表示对内容进行评论。
 *	@param 	message 	评论内容
 *  @param  user    评论用户，此项必填。为社交平台授权用户信息。
 *	@param 	resultHandler 	返回处理器，在接口返回时触发。
 */
+ (void)commentWithContentId:(NSString *)contentId
                       title:(NSString *)title
                     comment:(id<ISSCComment>)comment
                     message:(NSString *)message
                        user:(id<ISSPlatformUser>)user
                      result:(SSCReplyResultEvent)resultHandler;

/**
 *	@brief	对内容／评论进行称赞
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行评论，如果为nil，则表示对内容进行评论。
 *  @param  user    称赞用户，如果为nil，则为匿名用户。应传入社交平台授权用户信息。
 *	@param 	statusHandler 	状态处理器，对于称赞过程中的状态变更由此回调进行捕获。
 */
+ (void)likeWithContentId:(NSString *)contentId
                    title:(NSString *)title
                  comment:(id<ISSCComment>)comment
                     user:(id<ISSPlatformUser>)user
                   result:(SSCLikeResultEvent)resultHandler;

/**
 *	@brief	一键分享内容
 *
 *  @param  shareList   分享列表（邮件、短信、微信、QQ、Pinterest、Google+、打印、拷贝除外）
 *  @param  contentId   内容标识
 *  @param  title       标题
 *  @param  comment     评论信息对象，非nil，表示对评论进行分享，如果为nil，则表示对内容进行分享。
 *	@param 	contentEntity 	分享内容实体。用于定义各个平台分享评论时的内容。
 *  @param  statusBarTips   状态栏提示
 *	@param 	authOptions 	授权选项，用于指定接口在需要授权时的一些属性（如：是否自动授权，授权视图样式等）,设置未nil则表示采用默认选项
 *  @param  shareOptions    分享选项
 *	@param 	resultHandler 	返回事件
 */
+ (void)oneKeyShareContentWithShareList:(NSArray *)shareList
                              contentId:(NSString *)contentId
                                  title:(NSString *)title
                                comment:(id<ISSCComment>)comment
                          contentEntity:(id<ISSContent>)contentEntity
                          statusBarTips:(BOOL)statusBarTips
                            authOptions:(id<ISSAuthOptions>)authOptions
                           shareOptions:(id<ISSShareOptions>)shareOptions
                                 result:(SSPublishContentEventHandler)resultHandler;

/**
 *	@brief	对内容／评论进行分享
 *
 *  @param  type        分享类型
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行分享，如果为nil，则表示对内容进行分享。
 *  @param  contentEntity   分享内容实体。用于定义各个平台分享评论时的内容。
 *  @param  statusBarTips   状态栏提示标识：YES：显示； NO：隐藏
 *  @param  authOptions     授权选项
 *  @param  shareOptions    分享选项
 *	@param 	resultHandler 	状态处理器，对于分享过程中的状态变更由此回调进行捕获
 */
+ (void)shareContentWithType:(ShareType)type
                   contentId:(NSString *)contentId
                       title:(NSString *)title
                     comment:(id<ISSCComment>)comment
               contentEntity:(id<ISSContent>)contentEntity
               statusBarTips:(BOOL)statusBarTips
                 authOptions:(id<ISSAuthOptions>)authOptions
                shareOptions:(id<ISSShareOptions>)shareOptions
                      result:(SSPublishContentEventHandler)resultHandler;

#pragma mark - 其他

/**
 *	@brief	根据排序规则名称创建排序规则
 *
 *	@param 	name 	名称
 *
 *	@return	排序规则
 */
+ (NSComparator)orderWithName:(SSCCommentListOrderName)name;

/**
 *	@brief	创建评论菜单项
 *
 *	@param 	title 	标题
 *	@param 	order 	排序
 *
 *	@return	菜单项对象
 */
+ (SSCCommentMenuItem *)commentMenuItemWithTitle:(NSString *)title
                                           order:(NSComparator)order;

/**
 *	@brief	设置评论内容过滤器
 *
 *	@param 	filter 	内容过滤器对象
 */
+ (void)setContentFilter:(id<ISSCContentFilter>)filter;

/**
 *	@brief	设置评论内容超过长度事件处理器，如果不设置则使用默认提示。
 *
 *	@param 	handler 	事件处理器
 */
+ (void)setContentOutOfMaxLengthEvent:(SSCContentOutOfMaxLengthEvent)handler;

/**
 *	@brief	设置是否启用状态栏消息提示。如果为YES则表示在评论和分享时会在状态栏显示提示信息。默认为YES
 *
 *	@param 	enabled 	YES 表示启用，NO 表示不启用。
 */
+ (void)setStatusBarTipsEnabled:(BOOL)enabled;

/**
 *	@brief	创建内容过滤器
 *
 *	@param 	regex 	正则表达式
 *  @param  filteredHandler 过滤事件处理器，当满足过滤条件时触发。
 *
 *	@return	过滤器对象
 */
+ (id<ISSCContentFilter>)contentFilterWithRegex:(NSString *)regex
                                filteredHandler:(SSCFilteredEvent)filteredHandler;

/**
 *	@brief	创建内容长度过滤器
 *
 *	@param 	maxlength 	最大长度
 *	@param 	minLength 	最小长度
 *	@param 	filteredHandler 	过滤事件处理器，当满足过滤条件时触发。
 *
 *	@return	过滤器对象
 */
+ (id<ISSCContentFilter>)contentFilterWithMaxLength:(NSInteger)maxlength
                                          minLength:(NSInteger)minLength
                                    filteredHandler:(SSCFilteredEvent)filteredHandler;


@end
