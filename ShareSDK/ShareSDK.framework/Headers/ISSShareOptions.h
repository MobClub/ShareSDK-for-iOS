//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSViewDelegate.h"
#import "ISSShareViewDelegate.h"

/**
 *	@brief	Share options protocol
 */
@protocol ISSShareOptions <NSObject>

/**
 *	@brief	Get one key share list.
 *
 *	@return	One key share list array.
 */
- (NSArray *)oneKeyShareList;

/**
 *	@brief	Set one key share list.
 *
 *	@param 	oneKeyShareList 	One key share list.
 */
- (void)setOneKeyShareList:(NSArray *)oneKeyShareList;

/**
 *	@brief	Get share view title.
 *
 *	@return	Title string.
 */
- (NSString *)title;

/**
 *	@brief	Set share view title
 *
 *	@param 	title 	Title string.
 */
- (void)setTitle:(NSString *)title;

/**
 *	@brief	Get QQ Share button hidden flag，Default NO, Style is effective when ShareViewStyleDefault
 *
 *	@return	YES indicate hidden, NO indicate display.
 */
- (BOOL)qqButtonHidden;

/**
 *	@brief	Set QQ Share button hidden flag.
 *
 *	@param 	qqButtonHidden 	YES indicate hidden, NO indicate display.
 */
- (void)setQqButtonHidden:(BOOL)qqButtonHidden;

/**
 *	@brief	Get WeChat session share button hidden flag，Default NO, Style is effective when ShareViewStyleDefault
 *
 *	@return	YES indicate hidden, NO indicate display.
 */
- (BOOL)wxSessionButtonHidden;

/**
 *	@brief	Set WeChat session share button flag.
 *
 *	@param 	wxSessionButtonHidden 	YES indicate hidden, NO indicate display.
 */
- (void)setWxSessionButtonHidden:(BOOL)wxSessionButtonHidden;

/**
 *	@brief	Get WeChat timeline share button hidden flag，Default NO, Style is effective when ShareViewStyleDefault
 *
 *  @return YES indicate hidden, NO indicate display.
 */
- (BOOL)wxTimelineButtonHidden;

/**
 *	@brief	Set WeChat timeline share button hidden flag
 *
 *	@param 	wxTimelineButtonHidden 	YES indicate hidden, NO indicate display.
 */
- (void)setWxTimelineButtonHidden:(BOOL)wxTimelineButtonHidden;

/**
 *	@brief	Get camera button hidden flag，Defulat NO, Style is effective when ShareViewStyleDefault
 *
 *  @since  ver2.2.0
 *
 *	@return	YES indicate hidden, NO indicate display.
 */
- (BOOL)cameraButtonHidden;

/**
 *	@brief	Set camera button hidden flag.
 *
 *  @since  ver2.2.0
 *
 *	@param 	cameraButtonHidden 	YES indicate hidden, NO indicate display.
 */
- (void)setCameraButtonHidden:(BOOL)cameraButtonHidden;

/**
 *	@brief	Get mention button hidden flag，Default NO, Style is effective when ShareViewStyleDefault
 *
 *  @since  ver2.2.0
 *
 *	@return	YES indicate hidden, NO indicate display.
 */
- (BOOL)mentionButtonHidden;

/**
 *	@brief	Set mention button hidden flag.
 *
 *  @since  ver2.2.0
 *
 *	@param 	mentionButtonHidden 	YES indicate hidden, NO indicate display.
 */
- (void)setMentionButtonHidden:(BOOL)mentionButtonHidden;

/**
 *	@brief	Get topic button hidden flag，Default NO, Style is effective when ShareViewStyleDefault
 *
 *  @since  ver2.2.0
 *
 *	@return	YES indicate hidden, NO indicate display.
 */
- (BOOL)topicButtonHidden;

/**
 *	@brief	Set topic button hidden flag.
 *
 *  @since  ver2.2.0
 *
 *	@param 	topicButtonHidden 	YES indicate hidden, NO indicate display.
 */
- (void)setTopicButtonHidden:(BOOL)mentionButtonHidden;

/**
 *	@brief	Whether in view of the display when the keyboard is displayed, the default NO. When on key share list is nil, this value is invalid.
 *
 *  @return YES indicates display. otherwise hidden.
 */
- (BOOL)showKeyboardOnAppear;

/**
 *	@brief	Set whether to display the keyboard when the view display
 *
 *	@param 	showKeyboardOnAppear 	YES indicates display. otherwise hidden.
 */
- (void)setShowKeyboardOnAppear:(BOOL)showKeyboardOnAppear;

/**
 *	@brief	Get share view delegate.
 *
 *  @return Delegate object.
 */
- (id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	Set share view delegate.
 *
 *	@param 	shareViewDelegate 	Delegate object.
 */
- (void)setShareViewDelegate:(id<ISSShareViewDelegate>)shareViewDelegate;

/**
 *	@brief	Get friends view delegate,only use the default sylte view friends list pop.
 *
 *  @return Delegate object.
 */
- (id<ISSViewDelegate>)friendsViewDelegate;

/**
 *	@brief	Set friends view delegate.
 *
 *	@param 	friendsViewDelegate 	Delegate object.
 */
- (void)setFriendsViewDelegate:(id<ISSViewDelegate>)friendsViewDelegate;

/**
 *	@brief	Get picture viewer view delegate.This delegate is only used in the default style view's picture viewer view.
 *
 *  @return Delegate object.
 */
- (id<ISSViewDelegate>)picViewerViewDelegate;

/**
 *	@brief	Set picture viewer view delegate.
 *
 *	@param 	picViewerViewDelegate 	Delegate object.
 */
- (void)setPicViewerViewDelegate:(id<ISSViewDelegate>)picViewerViewDelegate;

/**
 *	@brief	Get mail view delegate.
 *
 *	@return	Delegate object.
 */
- (id<ISSViewDelegate>)mailViewDelegate;

/**
 *	@brief	Set mail view delegate.
 *
 *	@param 	mailViewDelegate 	Delegate object.
 */
- (void)setMailViewDelegate:(id<ISSViewDelegate>)mailViewDelegate;

/**
 *	@brief	Get SMS view delegate.
 *
 *	@return	Delegate object.
 */
- (id<ISSViewDelegate>)smsViewDelegate;

/**
 *	@brief	Set SMS view delegate
 *
 *	@param 	smsViewDelegate 	Delegate object.
 */
- (void)setSmsViewDelegate:(id<ISSViewDelegate>)smsViewDelegate;


@end
