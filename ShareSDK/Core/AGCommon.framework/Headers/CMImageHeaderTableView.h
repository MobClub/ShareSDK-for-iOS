//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CMImageView.h"

/**
 *	@brief	Image Header Table View.
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
 *	@brief	Table view delegate.
 */
@property (nonatomic,assign) id<UITableViewDelegate> delegate;

/**
 *	@brief	Table view data source.
 */
@property (nonatomic,assign) id<UITableViewDataSource> dataSource;

/**
 *	@brief	Header image.
 */
@property (nonatomic,retain) UIImage *headerImage;

/**
 *	@brief	Header height.
 */
@property (nonatomic) CGFloat headerHeight;

/**
 *	@brief	Table background color.
 */
@property (nonatomic,retain) UIColor *tableBackgroundColor;

/**
 *	@brief	Table background image.
 */
@property (nonatomic,retain) UIImage *tableBackgroundImage;

/**
 *	@brief	Separator color.
 */
@property (nonatomic,retain) UIColor *separatorColor;

/**
 *	@brief	Separator style.
 */
@property (nonatomic) UITableViewCellSeparatorStyle separatorStyle;

/**
 *	@brief	Row height.
 */
@property (nonatomic) CGFloat rowHeight;

/**
 *	@brief	Add header subview.
 *
 *	@param 	subview 	Subview.
 */
- (void)addHeaderSubview:(UIView *)subview;



@end

