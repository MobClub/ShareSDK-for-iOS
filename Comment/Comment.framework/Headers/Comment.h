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

///#begin zh-cn
/**
 *	@brief	评论称赞模块
 */
///#end
///#begin en
/**
 *	@brief	Common & Like
 */
///#end
@interface Comment : NSObject

#pragma mark - 评论、称赞、分享（含UI）

///#begin zh-cn
/**
 *	@brief	显示评论视图
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	被评论的评论内容，如果为nil，则表示对主题进行评论
 *  @param  resultHandler       返回事件回调
 *  
 *  @return 评论视图控制器
 */
///#end
///#begin en
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
///#end
+ (SSCCommentViewController *)commentViewWithContentId:(NSString *)contentId
                                                 title:(NSString *)title
                                               comment:(id<ISSCComment>)comment
                                                result:(SSCReplyResultEvent)resultHandler;

///#begin zh-cn
/**
 *	@brief	创建评论列表页面
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *
 *	@return	评论列表页面视图控制器
 */
///#end
///#begin en
/**
 *	@brief	Create a comment list page view.
 *
 *	@param 	contentId 	Content id.
 *	@param 	title 	Title
 *
 *	@return	Comment list view controller.
 */
///#end
+ (SSCCommentListViewController *)commentListViewPageWithContentId:(NSString *)contentId
                                                             title:(NSString *)title;

///#begin zh-cn
/**
 *	@brief	创建复合评论列表视图
 *
 *	@param 	contentId 	内容唯一标识
 *  @param  title   标题
 *	@param 	menuItems 	菜单项集合
 *	@param 	frame 	显示范围
 *
 *	@return	评论列表视图
 */
///#end
///#begin en
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
///#end
+ (SSCCommentListView *)complexCommentListViewWithContentId:(NSString *)contentId
                                                      title:(NSString *)title
                                                  menuItems:(NSArray *)menuItems
                                                      frame:(CGRect)frame;

///#begin zh-cn
/**
 *	@brief	创建评论列表视图
 *
 *	@param 	cotentId 	内容唯一标识
 *  @param  title   标题
 *	@param 	order 	排序方法
 *  @param  frame   显示范围
 *
 *	@return	评论列表视图
 */
///#end
///#begin en
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
///#end
+ (SSCCommentListView *)commentListViewWithContentId:(NSString *)contentId
                                               title:(NSString *)title
                                               order:(NSComparator)order
                                               frame:(CGRect)frame;
///#begin zh-cn
/**
 *	@brief	创建评论工具栏
 *
 *	@param 	contentId 	内容唯一标识
 *  @param  title   标题
 *  @param  frame   显示范围
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
 *  @param  frame   Display rect.
 *
 *	@return	Comment toolbar object.
 */
///#end
+ (SSCCommentToolbar *)commentToolbarWithContentId:(NSString *)contentId
                                             title:(NSString *)title
                                             frame:(CGRect)frame;

///#begin zh-cn
/**
 *	@brief	显示分享菜单
 *
 *	@param 	contentId 	内容唯一标识
 *	@param 	title 	标题
 *	@param 	comment 	评论信息对象，非nil，表示对评论进行分享，如果为nil，则表示对内容进行分享。
 *	@param 	contentEntity 	分享内容实体。用于定义各个平台分享评论时的内容。
 *  @param  resultHandler  分享返回事件处理
 */
///#end
///#begin en
/**
 *	@brief	A share menu to display.
 *
 *	@param 	contentId 	Content id
 *	@param 	title 	Title
 *	@param 	comment 	Comment objects, if it is non-nil, expressed comments to share, if it is nil, it means that the content is shared.
 *	@param 	contentEntity 	Share content entity. Used to define the contents of each platform to share comments.
 *  @param  resultHandler  Result handler，callback to capture state changes
 */
///#end
+ (id<ISSShareActionSheet>)showShareActionSheetWithContentId:(NSString *)contentId
                                                       title:(NSString *)title
                                                     comment:(id<ISSCComment>)comment
                                               contentEntity:(id<ISSContent>)contentEntity
                                                      result:(SSPublishContentEventHandler)resultHandler;


#pragma mark - 评论、称赞、分享（无UI）

///#begin zh-cn
/**
 *	@brief	一键分享内容
 *
 *  @param  shareList   分享列表（邮件、短信、微信、QQ、Pinterest、Google+、打印、拷贝除外）
 *  @param  contentId   内容标识
 *  @param  title       标题
 *  @param  comment     评论信息对象，非nil，表示对评论进行分享，如果为nil，则表示对内容进行分享。
 *	@param 	contentEntity 	分享内容实体。用于定义各个平台分享评论时的内容。
 *	@param 	resultHandler 	返回事件
 */
///#end
///#begin en
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
///#end
+ (void)oneKeyShareContentWithShareList:(NSArray *)shareList
                              contentId:(NSString *)contentId
                                  title:(NSString *)title
                                comment:(id<ISSCComment>)comment
                          contentEntity:(id<ISSContent>)contentEntity
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
 *	@param 	resultHandler 	Result handler，callback to capture state changes
 */
///#end
+ (void)shareContentWithType:(ShareType)type
                   contentId:(NSString *)contentId
                       title:(NSString *)title
                     comment:(id<ISSCComment>)comment
               contentEntity:(id<ISSContent>)contentEntity
                      result:(SSPublishContentEventHandler)resultHandler;

#pragma mark - 其他

/**
 *	@brief	设置用户信息,对于第三方应用如果有自己的用户系统可以调用此接口传入相关用户信息。一旦设置则此用户将作为评论、称赞用户。
 *
 *	@param 	uid 	用户标识
 *	@param 	nickname 	昵称
 *	@param 	profileImage 	用户头像
 */
+ (void)setUserInfoWithId:(NSString *)uid
                 nickname:(NSString *)nickname
             profileImage:(NSString *)profileImage;


@end
