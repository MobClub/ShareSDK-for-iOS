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

#import "Comment.h"
#import "SSCCommentMenuItem.h"
#import "SSCCommentListView.h"
#import "SSCCommentListViewController.h"
#import "SSCCommentToolbar.h"
#import "ISSCComment.h"
#import "ISSCCounter.h"
#import "SSCViewDesc.h"
#import "SSCCommentViewController.h"
#import <ShareSDK/SSHTTPClient.h>

@interface Comment (Base)

#pragma mark - 评论、称赞、分享（含UI）

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Create a comment view.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Peer-reviewed content, if it is nil, it means to comment on the topic
 *	@param 	shareDesc 	Share operate related settings
 *	@param 	viewDesc 	View description for defining view styles, etc.
 *  @param  resultHandler   Result handler.
 *
 *	@return	Comment view.
 */
///#end
+ (SSCCommentViewController *)commentViewWithContentId:(NSString *)contentId
                                                 title:(NSString *)title
                                               comment:(id<ISSCComment>)comment
                                             shareDesc:(SSCShareDesc *)shareDesc
                                              viewDesc:(SSCViewDesc *)viewDesc
                                                result:(SSCReplyResultEvent)resultHandler;



///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Create comment list view page.
 *
 *	@param 	container 	View of the container, specify the list view is displayed in the view.
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title string.
 *	@param 	contentView 	Content view.
 *  @param  shareDesc   Share operate related settings
 *	@param 	viewDesc 	View description for defining view styles, etc.
 *
 *	@return	Comment list view page.
 */
///#end
+ (SSCCommentListViewController *)commentListViewPageWithContentId:(NSString *)contentId
                                                             title:(NSString *)title
                                                       contentView:(UIView *)contentView
                                                         shareDesc:(SSCShareDesc *)shareDesc
                                                          viewDesc:(SSCViewDesc *)viewDesc;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Create a complex comment list view.
 *
 *	@param 	contentId 	Content id.
 *  @param  title   Title string.
 *	@param 	menuItems 	Menu items.
 *	@param 	frame 	Display rect.
 *  @param  shareDesc   Share operate related settings
 *	@param 	viewDesc 	View description for defining view styles, etc.
 *
 *	@return	Comment list view.
 */
///#end
+ (SSCCommentListView *)complexCommentListViewWithContentId:(NSString *)contentId
                                                      title:(NSString *)title
                                                  menuItems:(NSArray *)menuItems
                                                      frame:(CGRect)frame
                                                  shareDesc:(SSCShareDesc *)shareDesc
                                                   viewDesc:(SSCViewDesc *)viewDesc;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Create a comment list view.
 *
 *	@param 	cotentId 	Content id.
 *  @param  title   Title
 *	@param 	order 	Order method.
 *  @param  frame   Display rect.
 *  @param  shareDesc   Share operate related settings
 *	@param 	viewDesc 	View description for defining view styles, etc.
 *
 *	@return	Comment list view.
 */
///#end
+ (SSCCommentListView *)commentListViewWithContentId:(NSString *)contentId
                                               title:(NSString *)title
                                               order:(NSComparator)order
                                               frame:(CGRect)frame
                                           shareDesc:(SSCShareDesc *)shareDesc
                                            viewDesc:(SSCViewDesc *)viewDesc;
///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Create a comment toolbar.
 *
 *	@param 	contentId 	Content id.
 *  @param  title   Title
 *  @param  frame   Display rect
 *  @param  shareDesc   Share operate related settings
 *	@param 	viewDesc 	View description for defining view styles, etc. (Not used)
 *
 *	@return	Comment toolbar.
 */
///#end
+ (SSCCommentToolbar *)commentToolbarWithContentId:(NSString *)contentId
                                             title:(NSString *)title
                                             frame:(CGRect)frame
                                         shareDesc:(SSCShareDesc *)shareDesc
                                          viewDesc:(SSCViewDesc *)viewDesc;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Share menu display
 *
 *	@param 	container 	A container for the display share view, if only displayed in the iPhone client can pass nil. If you want to display on the iPad needs to be specified container.
 *	@param 	shareList 	Platform type list.
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *	@param 	contentEntity 	Share content entity. Used to define the contents of each platform to share comments.
 *  @param  statusBarTips   The status bar prompts flag: YES: Display; NO: Hidden
 *  @param  authOptions     Auth options.
 *  @param  shareOptions    Share options.
 *  @param  resultHandler  Result handler.
 */
///#end
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

///#begin zh-cn
/**
 *	@brief	获取主题信息
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	resultHandler 	返回处理器，在接口返回时触发。
 */
///#end
///#begin en
/**
 *	@brief	Get Topic information
 *
 *	@param 	contentId 	Content id.
 *	@param 	resultHandler 	Result handler. trigger interface returns.
 */
///#end
+ (void)topicWithContentId:(NSString *)contentId
                    result:(SSCGetTopicResultEvent)resultHandler;

///#begin zh-cn
/**
 *	@brief	获取评论列表
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	order 	排序方法
 *
 *	@return	评论列表对象
 */
///#end
///#begin en
/**
 *	@brief	Get comment list.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title string.
 *	@param 	order 	Order method
 *
 *	@return	Comment list.
 */
///#end
+ (id<ISSCCommentList>)commentListWithContentId:(NSString *)contentId
                                          title:(NSString *)title
                                          order:(NSComparator)order;

///#begin zh-cn
/**
 *	@brief	对内容/评论进行评论
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行评论，如果为nil，则表示对内容进行评论。
 *	@param 	message 	评论内容
 *  @param  user    评论用户，此项必填。为社交平台授权用户信息。
 *	@param 	resultHandler 	返回处理器，在接口返回时触发。
 *
 *  @return HTTP客户端对象
 */
///#end
///#begin en
/**
 *	@brief	The content / comment comment
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to comment, if it is nil, it means that the content is comment.
 *	@param 	message 	Comment content.
 *  @param  user    Comments user, this is required. For the social platform authorized user information.
 *	@param 	resultHandler 	Result handler, trigger interface returns.
 *
 *  @return HTTP client object
 */
///#end
+ (SSHTTPClient *)commentWithContentId:(NSString *)contentId
                                 title:(NSString *)title
                               comment:(id<ISSCComment>)comment
                               message:(NSString *)message
                                  user:(id<ISSPlatformUser>)user
                                result:(SSCReplyResultEvent)resultHandler;

///#begin zh-cn
/**
 *	@brief	对内容／评论进行称赞
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行评论，如果为nil，则表示对内容进行称赞。
 *  @param  user    称赞用户，如果为nil，则为匿名用户。应传入社交平台授权用户信息。
 *	@param 	statusHandler 	状态处理器，对于称赞过程中的状态变更由此回调进行捕获。
 */
///#end
///#begin en
/**
 *	@brief	Contents / comments be liked
 *
 *	@param 	contentId 	Content id
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to like, if it is nil, it means that the content is liked.
 *  @param  user    Praised user, if it is nil, compared to anonymous users. Should pass information to authorized users.
 *	@param 	statusHandler 	Result handler， a callback to capture state changes.
 */
///#end
+ (void)likeWithContentId:(NSString *)contentId
                    title:(NSString *)title
                  comment:(id<ISSCComment>)comment
                     user:(id<ISSPlatformUser>)user
                   result:(SSCLikeResultEvent)resultHandler;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	One key share content.
 *
 *  @param  shareList   Platform type list（E-mail, SMS, WeChat, QQ, Pinterest, Google+, print, copy except）
 *  @param  contentId   Content id.
 *  @param  title       Title
 *  @param  comment     Comment objects, if it is non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *	@param 	contentEntity 	Share content entity. Used to define the contents of each platform to share comments.
 *  @param  statusBarTips   The status bar prompts flag: YES: Display; NO: Hidden
 *	@param 	authOptions 	Auth options.
 *  @param  shareOptions    Share options.
 *	@param 	resultHandler 	Result handler，callback to capture state changes
 */
///#end
+ (void)oneKeyShareContentWithShareList:(NSArray *)shareList
                              contentId:(NSString *)contentId
                                  title:(NSString *)title
                                comment:(id<ISSCComment>)comment
                          contentEntity:(id<ISSContent>)contentEntity
                          statusBarTips:(BOOL)statusBarTips
                            authOptions:(id<ISSAuthOptions>)authOptions
                           shareOptions:(id<ISSShareOptions>)shareOptions
                                 result:(SSPublishContentEventHandler)resultHandler;

///#begin zh-cn
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
///#end
///#begin en
/**
 *	@brief	Contents / comments to share
 *
 *  @param  type        Platform type.
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *  @param  contentEntity   Share content entity. Used to define the contents of each platform to share comments.
 *  @param  statusBarTips   The status bar prompts flag: YES: Display; NO: Hidden
 *  @param  authOptions     Auth options.
 *  @param  shareOptions    Share options.
 *	@param 	resultHandler 	Result handler，callback to capture state changes
 */
///#end
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

///#begin zh-cn
/**
 *	@brief	根据排序规则名称创建排序规则
 *
 *	@param 	name 	名称
 *
 *	@return	排序规则
 */
///#end
///#begin en
/**
 *	@brief	Creating a collation based on the collation name
 *
 *	@param 	name 	Collation name
 *
 *	@return	Collation object
 */
///#end
+ (NSComparator)orderWithName:(SSCCommentListOrderName)name;

///#begin zh-cn
/**
 *	@brief	创建评论菜单项
 *
 *	@param 	title 	标题
 *	@param 	order 	排序
 *
 *	@return	菜单项对象
 */
///#end
///#begin en
/**
 *	@brief	Create a comment menu item.
 *
 *	@param 	title 	Title
 *	@param 	order 	Order
 *
 *	@return	Comment menu item.
 */
///#end
+ (SSCCommentMenuItem *)commentMenuItemWithTitle:(NSString *)title
                                           order:(NSComparator)order;

///#begin zh-cn
/**
 *	@brief	设置评论内容过滤器
 *
 *	@param 	filter 	内容过滤器对象
 */
///#end
///#begin en
/**
 *	@brief	Set Content Filter
 *
 *	@param 	filter 	Content filter object
 */
///#end
+ (void)setContentFilter:(id<ISSCContentFilter>)filter;


/**
 *	@brief	设置默认内容过滤事件处理器
 *
 *	@param 	handler 	事件处理器
 */
+ (void)setDefaultContentFilteredEvent:(SSCFilteredEvent)handler;

///#begin zh-cn
/**
 *	@brief	设置评论内容超过长度事件处理器，如果不设置则使用默认提示。
 *
 *	@param 	handler 	事件处理器
 *
 *  @deprecated
 */
///#end
///#begin en
/**
 *	@brief	Set review content exceeds the length of the event handler. If not set, the default prompt.
 *
 *	@param 	handler 	Event handler.
 *
 *  @deprecated
 */
///#end
+ (void)setContentOutOfMaxLengthEvent:(SSCContentOutOfMaxLengthEvent)handler;

///#begin zh-cn
/**
 *	@brief	设置是否启用状态栏消息提示。如果为YES则表示在评论和分享时会在状态栏显示提示信息。默认为YES
 *
 *	@param 	enabled 	YES 表示启用，NO 表示不启用。
 */
///#end
///#begin en
/**
 *	@brief	Set whether the status bar message prompts enabled. If YES, said in the status bar displays a prompt message in the comments and sharing time. The default is YES
 *
 *	@param 	enabled 	YES means enable, NO indicates disabled.
 */
///#end
+ (void)setStatusBarTipsEnabled:(BOOL)enabled;

///#begin zh-cn
/**
 *	@brief	创建内容过滤器
 *
 *	@param 	regex 	正则表达式
 *  @param  filteredHandler 过滤事件处理器，当满足过滤条件时触发。
 *
 *	@return	过滤器对象
 */
///#end
///#begin en
/**
 *	@brief	Create a content filter
 *
 *	@param 	regex 	Regex
 *  @param  filteredHandler Filter event handler is triggered when the meet the filter criteria.
 *
 *	@return	Filter object.
 */
///#end
+ (id<ISSCContentFilter>)contentFilterWithRegex:(NSString *)regex
                                filteredHandler:(SSCFilteredEvent)filteredHandler;

///#begin zh-cn
/**
 *	@brief	创建内容长度过滤器
 *
 *	@param 	maxlength 	最大长度
 *	@param 	minLength 	最小长度
 *	@param 	filteredHandler 	过滤事件处理器，当满足过滤条件时触发。
 *
 *	@return	过滤器对象
 */
///#end
///#begin en
/**
 *	@brief	Create a content-length filter
 *
 *	@param 	maxlength 	The maximum length
 *	@param 	minLength 	The minimum length
 *	@param 	filteredHandler 	Filter event handler is triggered when the meet the filter criteria.
 *
 *	@return	Filter object
 */
///#end
+ (id<ISSCContentFilter>)contentFilterWithMaxLength:(NSInteger)maxlength
                                          minLength:(NSInteger)minLength
                                    filteredHandler:(SSCFilteredEvent)filteredHandler;


///#begin zh-cn
/**
 *	@brief	设置用户信息,对于第三方应用如果有自己的用户系统可以调用此接口传入相关用户信息。一旦设置则此用户将作为评论、称赞用户。
 *
 *	@param 	userInfo 	用户信息
 */
///#end
///#begin en
/**
 *	@brief	Set user information for third-party applications have their own user system, if you can call this interface to pass relevant user information. Once set this user as a comment, praise users.
 *
 *	@param 	userInfo 	User information
 */
///#end
+ (void)setUserInfo:(id<ISSPlatformUser>)userInfo;


@end
