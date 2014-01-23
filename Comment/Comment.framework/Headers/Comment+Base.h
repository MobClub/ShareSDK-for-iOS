//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
+ (SSCCommentViewController *)commentViewWithContentId:(NSString *)contentId
                                                 title:(NSString *)title
                                               comment:(id<ISSCComment>)comment
                                             shareDesc:(SSCShareDesc *)shareDesc
                                              viewDesc:(SSCViewDesc *)viewDesc
                                                result:(SSCReplyResultEvent)resultHandler;



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
+ (SSCCommentListViewController *)commentListViewPageWithContentId:(NSString *)contentId
                                                             title:(NSString *)title
                                                       contentView:(UIView *)contentView
                                                         shareDesc:(SSCShareDesc *)shareDesc
                                                          viewDesc:(SSCViewDesc *)viewDesc;

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
+ (SSCCommentListView *)complexCommentListViewWithContentId:(NSString *)contentId
                                                      title:(NSString *)title
                                                  menuItems:(NSArray *)menuItems
                                                      frame:(CGRect)frame
                                                  shareDesc:(SSCShareDesc *)shareDesc
                                                   viewDesc:(SSCViewDesc *)viewDesc;

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
+ (SSCCommentListView *)commentListViewWithContentId:(NSString *)contentId
                                               title:(NSString *)title
                                               order:(NSComparator)order
                                               frame:(CGRect)frame
                                           shareDesc:(SSCShareDesc *)shareDesc
                                            viewDesc:(SSCViewDesc *)viewDesc;
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
+ (SSCCommentToolbar *)commentToolbarWithContentId:(NSString *)contentId
                                             title:(NSString *)title
                                             frame:(CGRect)frame
                                         shareDesc:(SSCShareDesc *)shareDesc
                                          viewDesc:(SSCViewDesc *)viewDesc;

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
 *	@brief	Get Topic information
 *
 *	@param 	contentId 	Content id.
 *	@param 	resultHandler 	Result handler. trigger interface returns.
 */
+ (void)topicWithContentId:(NSString *)contentId
                    result:(SSCGetTopicResultEvent)resultHandler;

/**
 *	@brief	Get comment list.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title string.
 *	@param 	order 	Order method
 *
 *	@return	Comment list.
 */
+ (id<ISSCCommentList>)commentListWithContentId:(NSString *)contentId
                                          title:(NSString *)title
                                          order:(NSComparator)order;

/**
 *	@brief	The content / comment comment
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to comment, if it is nil, it means that the content is comment.
 *	@param 	message 	Comment content.
 *  @param  user    Comments user, this is required. For the social platform authorized user information.
 *	@param 	resultHandler 	Result handler, trigger interface returns.
 */
+ (void)commentWithContentId:(NSString *)contentId
                       title:(NSString *)title
                     comment:(id<ISSCComment>)comment
                     message:(NSString *)message
                        user:(id<ISSPlatformUser>)user
                      result:(SSCReplyResultEvent)resultHandler;

/**
 *	@brief	Contents / comments be liked
 *
 *	@param 	contentId 	Content id
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to like, if it is nil, it means that the content is liked.
 *  @param  user    Praised user, if it is nil, compared to anonymous users. Should pass information to authorized users.
 *	@param 	statusHandler 	Result handler， a callback to capture state changes.
 */
+ (void)likeWithContentId:(NSString *)contentId
                    title:(NSString *)title
                  comment:(id<ISSCComment>)comment
                     user:(id<ISSPlatformUser>)user
                   result:(SSCLikeResultEvent)resultHandler;

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
 *	@brief	Creating a collation based on the collation name
 *
 *	@param 	name 	Collation name
 *
 *	@return	Collation object
 */
+ (NSComparator)orderWithName:(SSCCommentListOrderName)name;

/**
 *	@brief	Create a comment menu item.
 *
 *	@param 	title 	Title
 *	@param 	order 	Order
 *
 *	@return	Comment menu item.
 */
+ (SSCCommentMenuItem *)commentMenuItemWithTitle:(NSString *)title
                                           order:(NSComparator)order;

/**
 *	@brief	Set Content Filter
 *
 *	@param 	filter 	Content filter object
 */
+ (void)setContentFilter:(id<ISSCContentFilter>)filter;

/**
 *	@brief	Set review content exceeds the length of the event handler. If not set, the default prompt.
 *
 *	@param 	handler 	Event handler.
 */
+ (void)setContentOutOfMaxLengthEvent:(SSCContentOutOfMaxLengthEvent)handler;

/**
 *	@brief	Set whether the status bar message prompts enabled. If YES, said in the status bar displays a prompt message in the comments and sharing time. The default is YES
 *
 *	@param 	enabled 	YES means enable, NO indicates disabled.
 */
+ (void)setStatusBarTipsEnabled:(BOOL)enabled;

/**
 *	@brief	Create a content filter
 *
 *	@param 	regex 	Regex
 *  @param  filteredHandler Filter event handler is triggered when the meet the filter criteria.
 *
 *	@return	Filter object.
 */
+ (id<ISSCContentFilter>)contentFilterWithRegex:(NSString *)regex
                                filteredHandler:(SSCFilteredEvent)filteredHandler;

/**
 *	@brief	Create a content-length filter
 *
 *	@param 	maxlength 	The maximum length
 *	@param 	minLength 	The minimum length
 *	@param 	filteredHandler 	Filter event handler is triggered when the meet the filter criteria.
 *
 *	@return	Filter object
 */
+ (id<ISSCContentFilter>)contentFilterWithMaxLength:(NSInteger)maxlength
                                          minLength:(NSInteger)minLength
                                    filteredHandler:(SSCFilteredEvent)filteredHandler;


@end
