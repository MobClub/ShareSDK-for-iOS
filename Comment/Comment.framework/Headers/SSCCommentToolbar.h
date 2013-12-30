//
//  SSCCommentToolbar.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCommentTypeDef.h"
#import "SSCShareDesc.h"
#import "SSCViewDesc.h"

/**
 *	@brief	评论工具栏
 */
@interface SSCCommentToolbar : UIView

/**
 *	@brief	分享操作相关设置
 */
@property (nonatomic,retain) SSCShareDesc *shareDesc;

/**
 *	@brief	视图描述
 */
@property (nonatomic,retain) SSCViewDesc *viewDesc;

/**
 *	@brief	返回按钮隐藏标识
 */
@property (nonatomic) BOOL backButtonHidden;

/**
 *	@brief	初始化评论工具栏
 *
 *	@param 	contentId 	内容标识
 *	@param 	title 	标题
 *	@param 	frame 	显示范围
 *
 *	@return	评论工具栏
 */
- (id)initWithContentId:(NSString *)contentId
                  title:(NSString *)title
                  frame:(CGRect)frame;

/**
 *	@brief	设置帐号来源，表示允许用户使用哪些平台进行登录授权来进行评论。默认为nil，表示使用ShareSDK中初始化的平台作为帐号来源。
 *
 *	@param 	platforms 	平台列表，由ShareType组成。
 */
- (void)setAccountSources:(NSArray *)platforms;

/**
 *	@brief	设置返回事件,点击返回按钮时触发
 *
 *	@param 	handler 	事件处理器
 */
- (void)setBackEvent:(SSCCommentListPageBackEvent)handler;


@end
