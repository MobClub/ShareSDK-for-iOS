//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSViewDelegate.h"
#import "ISSShareViewDelegate.h"

/**
 *	@brief	分享选项协议
 */
@protocol ISSShareOptions <NSObject>

/**
 *	@brief	获取一键分享列表
 *
 *	@return	一键分享列表
 */
- (NSArray *)oneKeyShareList;


/**
 *	@brief	设置一键分享列表
 *
 *	@param 	oneKeyShareList 	一键分享列表
 */
- (void)setOneKeyShareList:(NSArray *)oneKeyShareList;

/**
 *	@brief	获取分享视图标题
 *
 *	@return	分享视图标题
 */
- (NSString *)title;

/**
 *	@brief	设置分享视图标题
 *
 *	@param 	title 	分享视图标题
 */
- (void)setTitle:(NSString *)title;

/**
 *	@brief	QQ分享按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 *
 *	@return	YES表示隐藏， NO表示显示
 */
- (BOOL)qqButtonHidden;

/**
 *	@brief	设置QQ分享按钮隐藏标识
 *
 *	@param 	qqButtonHidden 	YES表示隐藏， NO表示显示
 */
- (void)setQqButtonHidden:(BOOL)qqButtonHidden;

/**
 *	@brief	微信好友分享按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 *
 *	@return	YES表示隐藏， NO表示显示
 */
- (BOOL)wxSessionButtonHidden;

/**
 *	@brief	设置微信好友分享按钮隐藏标识
 *
 *	@param 	wxSessionButtonHidden 	YES表示隐藏， NO表示显示
 */
- (void)setWxSessionButtonHidden:(BOOL)wxSessionButtonHidden;

/**
 *	@brief	微信朋友圈分享按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 *
 *  @return YES表示隐藏， NO表示显示
 */
- (BOOL)wxTimelineButtonHidden;

/**
 *	@brief	设置微信朋友圈分享按钮隐藏标识
 *
 *	@param 	wxTimelineButtonHidden 	YES表示隐藏， NO表示显示
 */
- (void)setWxTimelineButtonHidden:(BOOL)wxTimelineButtonHidden;

/**
 *	@brief	拍照按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 *
 *  @since  ver2.2.0
 *
 *	@return	YES表示隐藏， NO表示显示
 */
- (BOOL)cameraButtonHidden;

/**
 *	@brief	拍照按钮隐藏标识
 *
 *  @since  ver2.2.0
 *
 *	@param 	cameraButtonHidden 	YES表示隐藏， NO表示显示
 */
- (void)setCameraButtonHidden:(BOOL)cameraButtonHidden;

/**
 *	@brief	@按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 *
 *  @since  ver2.2.0
 *
 *	@return	YES表示隐藏， NO表示显示
 */
- (BOOL)mentionButtonHidden;

/**
 *	@brief	@按钮隐藏标识
 *
 *  @since  ver2.2.0
 *
 *	@param 	mentionButtonHidden 	YES表示隐藏， NO表示显示
 */
- (void)setMentionButtonHidden:(BOOL)mentionButtonHidden;

/**
 *	@brief	话题按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 *
 *  @since  ver2.2.0
 *
 *	@return	YES表示隐藏， NO表示显示
 */
- (BOOL)topicButtonHidden;

/**
 *	@brief	话题按钮隐藏标识
 *
 *  @since  ver2.2.0
 *
 *	@param 	topicButtonHidden 	YES表示隐藏， NO表示显示
 */
- (void)setTopicButtonHidden:(BOOL)mentionButtonHidden;

/**
 *	@brief	是否在视图显示时显示键盘,默认NO。当一键分享列表为nil时，此值无效。
 *
 *  @return YES表示显示，NO表示不显示
 */
- (BOOL)showKeyboardOnAppear;

/**
 *	@brief	设置在视图显示时是否显示键盘
 *
 *	@param 	showKeyboardOnAppear 	YES表示显示，NO表示不显示
 */
- (void)setShowKeyboardOnAppear:(BOOL)showKeyboardOnAppear;

/**
 *	@brief	获取分享视图委托
 *
 *  @return 协议委托
 */
- (id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	设置分享视图委托
 *
 *	@param 	shareViewDelegate 	协议委托
 */
- (void)setShareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	获取好友视图委托,此委托仅使用在默认样式视图中弹出的好友列表
 *
 *  @return 协议委托
 */
- (id<ISSViewDelegate>)friendsViewDelegate;

/**
 *	@brief	设置好友视图委托
 *
 *	@param 	friendsViewDelegate 	协议委托
 */
- (void)setFriendsViewDelegate:(id<ISSViewDelegate>)friendsViewDelegate;

/**
 *	@brief	图片查看器视图委托,此委托仅使用在默认样式视图中图片查看器视图
 *
 *  @return 协议委托
 */
- (id<ISSViewDelegate>)picViewerViewDelegate;

/**
 *	@brief	设置图片查看器视图委托
 *
 *	@param 	picViewerViewDelegate 	协议委托
 */
- (void)setPicViewerViewDelegate:(id<ISSViewDelegate>)picViewerViewDelegate;

/**
 *	@brief	获取邮件视图委托
 *
 *	@return	协议委托
 */
- (id<ISSViewDelegate>)mailViewDelegate;

/**
 *	@brief	设置邮件视图委托
 *
 *	@param 	mailViewDelegate 	协议委托
 */
- (void)setMailViewDelegate:(id<ISSViewDelegate>)mailViewDelegate;

/**
 *	@brief	获取短信视图委托
 *
 *	@return	协议委托
 */
- (id<ISSViewDelegate>)smsViewDelegate;

/**
 *	@brief	设置短信视图委托
 *
 *	@param 	smsViewDelegate 	协议委托
 */
- (void)setSmsViewDelegate:(id<ISSViewDelegate>)smsViewDelegate;


@end
