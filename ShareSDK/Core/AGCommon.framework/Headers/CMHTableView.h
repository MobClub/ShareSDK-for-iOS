//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ICMHTableViewItem.h"

@class CMHTableView;

/**
 *	@brief	Horizontal table view data source.
 */
@protocol CMHTableViewDataSource <NSObject>

@required

/**
 *	@brief	Return items count.
 *
 *	@param 	tableView 	Table view object.
 *
 *	@return	item number of table view.
 */
- (NSInteger)itemNumberOfTableView:(CMHTableView *)tableView;

/**
 *	@brief	Return a table view item.
 *
 *	@param 	tableView 	Table view object.
 *	@param 	indexPath 	Index path.
 *
 *	@return	Item object.
 */
- (UIView<ICMHTableViewItem> *)tableView:(CMHTableView *)tableView itemForIndexPath:(NSIndexPath *)indexPath;


@end

/**
 *	@brief	Horizontal table view delegate.
 */
@protocol CMHTableViewDelegate <NSObject>

@optional

/**
 *	@brief	Get item width.
 *
 *	@param 	tableView 	Table view object.
 *	@param 	indexPath 	Index path.
 *
 *	@return	Item width.
 */
- (CGFloat)tableView:(CMHTableView *)tableView itemWidthForIndexPath:(NSIndexPath *)indexPath;

/**
 *	@brief	item will display
 *
 *	@param 	tableView 	Table view object.
 *  @param  item    Item view.
 *	@param 	indexPath 	Index path.
 */
- (void)tableView:(CMHTableView *)tableView willDisplayItem:(UIView<ICMHTableViewItem> *)item indexPath:(NSIndexPath *)indexPath;


@end

/**
 *	@brief	Horizontal Table View
 */
@interface CMHTableView : UIView <UIScrollViewDelegate>
{
@private
    NSMutableDictionary *_reuseItemDictionary;
    NSMutableArray *_visibleItemArray;
    id<CMHTableViewDataSource> _dataSource;
    id<CMHTableViewDelegate> _delegate;
    NSMutableArray *_itemsMeasureArray;
    BOOL _needLayout;
    NSInteger _itemCount;
    CGFloat _itemWidth;
    CGFloat _currX;
    
    UIScrollView *_contentView;
}

/**
 *	@brief	Data source.
 */
@property (nonatomic,assign) id<CMHTableViewDataSource> dataSource;

/**
 *	@brief	Delegate object.
 */
@property (nonatomic,assign) id<CMHTableViewDelegate> delegate;

/**
 *	@brief	Item width.
 */
@property (nonatomic) CGFloat itemWidth;

/**
 *	@brief	Show horizontal scroll indicator.
 */
@property (nonatomic) BOOL showsHorizontalScrollIndicator;

/**
 *	@brief	Reload data.
 */
- (void)reloadData;

/**
 *	@brief	Dequeue a reusable item.
 *
 *	@param 	identifier 	Item identifier.
 *
 *	@return	Item object.
 */
- (UIView<ICMHTableViewItem> *)dequeueReusableItemWithIdentifier:(NSString *)identifier;



@end
