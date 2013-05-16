//
//  QuiltView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMQuiltItemView.h"

@class CMQuiltView;

/**
 *	@brief	瀑布流视图数据源
 */
@protocol QuiltViewDataSource <NSObject>

@required

/**
 *	@brief	返回
 *
 *	@param 	quiltView 	瀑布流视图
 *
 *	@return	子项数量
 */
- (NSInteger)quiltViewNumberOfItem:(CMQuiltView *)quiltView;

/**
 *	@brief	返回子项内容
 *
 *	@param 	QuiltView 	瀑布流视图
 *	@param 	indexPath 	索引位置
 *
 *	@return	子项对象
 */
- (UIView<ICMQuiltItemView> *)quiltView:(CMQuiltView *)quiltView itemForIndexPath:(NSIndexPath *)indexPath;

@end

/**
 *	@brief	瀑布流视图协议
 */
@protocol QuiltViewDelegate <NSObject>

@optional

/**
 *	@brief	子项视图将要显示
 *
 *	@param 	quiltView 	瀑布流视图
 *	@param 	itemView 	子项视图
 *	@param 	indexPath 	索引位置
 */
- (void)quiltView:(CMQuiltView *)quiltView willDisplayItemView:(UIView<ICMQuiltItemView> *)itemView indexPath:(NSIndexPath *)indexPath;

/**
 *	@brief	瀑布流视图滚动
 *
 *	@param 	quiltView 	瀑布流视图
 */
- (void)quiltViewDidScroll:(CMQuiltView *)quiltView;

/**
 *	@brief	瀑布流视图停止拖动
 *
 *	@param 	quiltView 	瀑布流视图
 *	@param 	decelerate 	减速运动标识，YES表示进行减速运动，否则不进行减速运动
 */
- (void)quiltViewDidEndDragging:(CMQuiltView *)quiltView willDecelerate:(BOOL)decelerate;


@end

/**
 *	@brief	瀑布流视图
 */
@interface CMQuiltView : UIView <UIScrollViewDelegate,
                                ICMQuiltItemViewConstructorDelegate>
{
@private
    NSInteger _columnsCount;
    NSInteger _itemCount;
    NSInteger _currentIndex;
    
    CGFloat _verticalGap;
    CGFloat _horizontalGap;
    CGFloat _itemWidth;
    
    BOOL _hasUpdateLayout;
    BOOL _hasLoadingItem;                          //标识是否正在加载子项
    NSMutableDictionary *_reuseItemPool;
    NSMutableDictionary *_measureHeightDict;
    NSMutableArray *_visibleItemArray;
    NSMutableArray *_itemsFrameArray;
    
    id<QuiltViewDelegate> _delegate;
    id<QuiltViewDataSource> _dataSource;
    
    UIScrollView *_contentView;
    UIView *_headerView;
}

/**
 *	@brief	数据源对象
 */
@property (nonatomic,assign) id<QuiltViewDataSource> dataSource;

/**
 *	@brief	协议对象
 */
@property (nonatomic,assign) id<QuiltViewDelegate> delegate;

/**
 *	@brief	表头视图
 */
@property (nonatomic,retain) UIView *headerView;

/**
 *	@brief	内容视图
 */
@property (nonatomic,readonly) UIScrollView *contentView;

/**
 *	@brief	项宽度
 */
@property (nonatomic,readonly) CGFloat itemWidth;

/**
 *	@brief	初始化瀑布流视图
 *
 *	@param 	frame 	显示区域
 *	@param 	itemWidth 	子项视图宽度
 *
 *	@return	瀑布流视图
 */
- (id)initWithFrame:(CGRect)frame itemWidth:(CGFloat)itemWidth;

/**
 *	@brief	重新加载数据
 */
- (void)reloadData;

/**
 *	@brief	初始化瀑布流，用于重新计算项目
 */
- (void)clean;


/**
 *	@brief	根据标识值获取可用的瀑布流子项视图
 *
 *	@param 	identifier 	复用标识
 *
 *	@return	子项视图对象
 */
- (UIView<ICMQuiltItemView> *)dequeueReusablePageWithIdentifier:(NSString *)identifier;


@end
