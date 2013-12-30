//
//  SSCCommentViewController.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-19.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSCComment.h"
#import "SSCShareDesc.h"
#import "SSCViewDesc.h"

/**
 *	@brief	评论视图控制器
 */
@interface SSCCommentViewController : UIViewController <UITextViewDelegate>

/**
 *	@brief	分享操作相关设置
 */
@property (nonatomic,retain) SSCShareDesc *shareDesc;

/**
 *	@brief	视图描述
 */
@property (nonatomic,retain) SSCViewDesc *viewDesc;

/**
 *	@brief	初始化视图控制器
 *
 *	@param 	contentId 	内容标识
 *	@param 	topic 	标题
 *	@param 	comment 	被评论内容
 *  @param  resultHandler   返回回调
 *
 *	@return	视图控制器
 */
- (id)initWithContentId:(NSString *)contentId
                  topic:(NSString *)topic
                comment:(id<ISSCComment>)comment
                 result:(SSCReplyResultEvent)resultHandler;

/**
 *	@brief	设置帐号来源，表示允许用户使用哪些平台进行登录授权来进行评论。默认为nil，表示使用ShareSDK中初始化的平台作为帐号来源。
 *
 *	@param 	platforms 	平台列表，由ShareType组成。
 */
- (void)setAccountSources:(NSArray *)platforms;


@end
