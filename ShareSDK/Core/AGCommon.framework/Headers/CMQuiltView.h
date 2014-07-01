//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ICMQuiltItemView.h"

@class CMQuiltView;

/**
 *	@brief	Quilt View Data Source.
 */
@protocol QuiltViewDataSource <NSObject>

@required

/**
 *	@brief	Return number of item.
 *
 *	@param 	quiltView 	Quilt View object.
 *
 *	@return	Items number.
 */
- (NSInteger)quiltViewNumberOfItem:(CMQuiltView *)quiltView;

/**
 *	@brief	Return item view.
 *
 *	@param 	QuiltView 	Quilt View object.
 *	@param 	indexPath 	Index path.
 *
 *	@return	Item view.
 */
- (UIView<ICMQuiltItemView> *)quiltView:(CMQuiltView *)quiltView itemForIndexPath:(NSIndexPath *)indexPath;

@end

/**
 *	@brief	Quilt View Delegate.
 */
@protocol QuiltViewDelegate <NSObject>

@optional

/**
 *	@brief	Will display item view.
 *
 *	@param 	quiltView 	Quilt View object.
 *	@param 	itemView 	Item view.
 *	@param 	indexPath 	Index path.
 */
- (void)quiltView:(CMQuiltView *)quiltView willDisplayItemView:(UIView<ICMQuiltItemView> *)itemView indexPath:(NSIndexPath *)indexPath;

/**
 *	@brief	Did scroll.
 *
 *	@param 	quiltView 	Quilt View object.
 */
- (void)quiltViewDidScroll:(CMQuiltView *)quiltView;

/**
 *	@brief	Did end dragging.
 *
 *	@param 	quiltView 	Quilt View object.
 *	@param 	decelerate 	Deceleration flag, YES indicates deceleration movement, or not decelerating motion
 */
- (void)quiltViewDidEndDragging:(CMQuiltView *)quiltView willDecelerate:(BOOL)decelerate;


@end

/**
 *	@brief	Quilt View
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
 *	@brief	Data source object.
 */
@property (nonatomic,assign) id<QuiltViewDataSource> dataSource;

/**
 *	@brief	Delegate object.
 */
@property (nonatomic,assign) id<QuiltViewDelegate> delegate;

/**
 *	@brief	Header view.
 */
@property (nonatomic,retain) UIView *headerView;

/**
 *	@brief	Content view.
 */
@property (nonatomic,readonly) UIScrollView *contentView;

/**
 *	@brief	Item width.
 */
@property (nonatomic,readonly) CGFloat itemWidth;

/**
 *	@brief	Initialize quilt view.
 *
 *	@param 	frame 	Display rect.
 *	@param 	itemWidth 	Item width.
 *
 *	@return	Quilt view.
 */
- (id)initWithFrame:(CGRect)frame itemWidth:(CGFloat)itemWidth;

/**
 *	@brief	Reload data.
 */
- (void)reloadData;

/**
 *	@brief	Initialize quilt view，Used to recalculate all items.
 */
- (void)clean;

/**
 *	@brief	Dequeue reusable page.
 *
 *	@param 	identifier 	Item identifier.
 *
 *	@return	Item view object.
 */
- (UIView<ICMQuiltItemView> *)dequeueReusablePageWithIdentifier:(NSString *)identifier;


@end
