//
//  ImageHeaderTableView.h
//  Common
//
//  Created by vimfung on 12-8-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageView.h"

/**
 *	@brief	带图片头部的表格视图
 */
@interface ImageHeaderTableView : UIView <UITableViewDelegate, UITableViewDataSource>
{
@private
    UIView *_headerView;
    ImageView *_imageView;
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

