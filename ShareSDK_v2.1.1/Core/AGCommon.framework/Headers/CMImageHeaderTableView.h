//
//  ImageHeaderTableView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMImageView.h"

/**
 *	@brief	带图片头部的表格视图
 */
@interface CMImageHeaderTableView : UIView <UITableViewDelegate, UITableViewDataSource>
{
@private
    UIView *_headerView;
    CMImageView *_imageView;
    UITableView *_tableView;
    UIImageView *_backgroundImageView;
    
    id _delegate;
    id _dataSource;
}

/**
 *	@brief	表格委托
 */
@property (nonatomic,assign) id<UITableViewDelegate> delegate;

/**
 *	@brief	表格事件
 */
@property (nonatomic,assign) id<UITableViewDataSource> dataSource;

/**
 *	@brief	表头图片
 */
@property (nonatomic,retain) UIImage *headerImage;

/**
 *	@brief	表头高度
 */
@property (nonatomic) CGFloat headerHeight;

/**
 *	@brief	表格背景颜色
 */
@property (nonatomic,retain) UIColor *tableBackgroundColor;

/**
 *	@brief	表格背景图片
 */
@property (nonatomic,retain) UIImage *tableBackgroundImage;

/**
 *	@brief	分隔线颜色
 */
@property (nonatomic,retain) UIColor *separatorColor;

/**
 *	@brief	分隔线样式
 */
@property (nonatomic) UITableViewCellSeparatorStyle separatorStyle;

/**
 *	@brief	行高度
 */
@property (nonatomic) CGFloat rowHeight;

/**
 *	@brief	添加表头子视图
 *
 *	@param 	subview 	子视图
 */
- (void)addHeaderSubview:(UIView *)subview;



@end

