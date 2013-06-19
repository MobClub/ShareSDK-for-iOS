//
//  CMHorizontalTableView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMHTableViewItem.h"

@class CMHTableView;

/**
 *	@brief	水平排版表格数据源
 */
@protocol CMHTableViewDataSource <NSObject>

@required

/**
 *	@brief	返回表格的列表项数量
 *
 *	@param 	tableView 	表格视图
 *
 *	@return	列表项数量
 */
- (NSInteger)itemNumberOfTableView:(CMHTableView *)tableView;

/**
 *	@brief	返回列表项视图
 *
 *	@param 	tableView 	表格视图
 *	@param 	indexPath 	索引位置
 *
 *	@return	列表项视图
 */
- (UIView<ICMHTableViewItem> *)tableView:(CMHTableView *)tableView itemForIndexPath:(NSIndexPath *)indexPath;


@end

/**
 *	@brief	水平排版表格委托
 */
@protocol CMHTableViewDelegate <NSObject>

@optional

/**
 *	@brief	返回列表项宽度
 *
 *	@param 	tableView 	表格视图
 *	@param 	indexPath 	索引位置
 *
 *	@return	列表项宽度
 */
- (CGFloat)tableView:(CMHTableView *)tableView itemWidthForIndexPath:(NSIndexPath *)indexPath;

/**
 *	@brief	子项将要显示
 *
 *	@param 	tableView 	表格视图
 *  @param  item    子项视图
 *	@param 	indexPath 	索引位置
 */
- (void)tableView:(CMHTableView *)tableView willDisplayItem:(UIView<ICMHTableViewItem> *)item indexPath:(NSIndexPath *)indexPath;


@end

/**
 *	@brief	水平排版表格
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
 *	@brief	数据源
 */
@property (nonatomic,assign) id<CMHTableViewDataSource> dataSource;

/**
 *	@brief	委托
 */
@property (nonatomic,assign) id<CMHTableViewDelegate> delegate;

/**
 *	@brief	列表项宽度
 */
@property (nonatomic) CGFloat itemWidth;

/**
 *	@brief	显示水平方向滚动条
 */
@property (nonatomic) BOOL showsHorizontalScrollIndicator;

/**
 *	@brief	重新刷新数据
 */
- (void)reloadData;

/**
 *	@brief	根据标识值获取可用的子项视图
 *
 *	@param 	identifier 	复用标识
 *
 *	@return	子项视图对象
 */
- (UIView<ICMHTableViewItem> *)dequeueReusableItemWithIdentifier:(NSString *)identifier;



@end
