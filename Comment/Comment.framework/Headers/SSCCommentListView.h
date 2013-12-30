//
//  SSCommentListView.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCommentTypeDef.h"
#import "SSCShareDesc.h"
#import "SSCViewDesc.h"


/**
 *	@brief	评论列表视图
 */
@interface SSCCommentListView : UIView <UITableViewDataSource,
                                        UITableViewDelegate>

/**
 *	@brief	分享操作相关的设置
 */
@property (nonatomic,retain) SSCShareDesc *shareDesc;

/**
 *	@brief	视图描述
 */
@property (nonatomic,retain) SSCViewDesc *viewDesc;

/**
 *	@brief	初始化评论列表视图
 *
 *	@param 	contentId 	内容标识
 *  @param  title   标题
 *  @param  order   排序方法
 *	@param 	frame 	显示范围
 *
 *	@return	视图对象
 */
- (id)initWithContentId:(NSString *)contentId
                  title:(NSString *)title
                  order:(NSComparator)order
                  frame:(CGRect)frame;

/**
 *	@brief	初始化复合评论列表视图
 *
 *	@param 	contentId 	内容标志
 *	@param 	title 	标题
 *	@param 	menuItems 	菜单项集合
 *	@param 	frame 	显示范围
 *
 *	@return	视图对象
 */
- (id)initWithContentId:(NSString *)contentId
                  title:(NSString *)title
              menuItems:(NSArray *)menuItems
                  frame:(CGRect)frame;

/**
 *	@brief	设置帐号来源，表示允许用户使用哪些平台进行登录授权来进行评论。默认为nil，表示使用ShareSDK中初始化的平台作为帐号来源。
 *
 *	@param 	platforms 	平台列表，由ShareType组成。
 */
- (void)setAccountSources:(NSArray *)platforms;

/**
 *	@brief	设置评论列表表头视图
 *
 *	@param 	header 	表头视图
 */
- (void)setHeaderView:(UIView *)headerView;

/**
 *	@brief	重新加载数据
 */
- (void)reloadData;

@end
