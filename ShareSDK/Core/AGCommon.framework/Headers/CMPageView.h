//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ICMPageContentView.h"

@class CMPageView;

/**
 *	@brief	Page control style.
 */
typedef enum
{
	PageControlStyleNone, /**< 无分页控制器 */
	PageControlStyleTop, /**< 分页控制器在顶部 */
	PageControlStyleBottom /**< 分页控制器在底部 */
}PageControlStyle;

/**
 *	@brief	Page view data source.
 */
@protocol CMPageViewDataSource <NSObject>

@required

/**
 *	@brief	Return page number.
 *
 *	@param 	pageView 	Page view object.
 *
 *	@return	Page number.
 */
- (NSInteger)pageViewNumberOfPage:(CMPageView *)pageView;


/**
 *	@brief	Return a page content view.
 *
 *	@param 	pageView 	Page view object.
 *	@param 	indexPath 	Index path.
 *
 *	@return	Page content view.
 */
- (UIView<ICMPageContentView> *)pageView:(CMPageView *)pageView pageForIndexPath:(NSIndexPath *)indexPath;

@end

/**
 *	@brief	Page view delegate.
 */
@protocol CMPageViewDelegate <NSObject>

@optional

/**
 *	@brief	Will display page.
 *
 *	@param 	pageView 	Page view.
 *	@param 	contentView 	Content view.
 *	@param 	indexPath 	Index path.
 */
- (void)pageView:(CMPageView *)pageView
  willDiplayPage:(UIView<ICMPageContentView> *)contentView
       indexPath:(NSIndexPath *)indexPath;


/**
 *	@brief	Did show page.
 *
 *	@param 	pageView 	Page view object.
 *	@param 	contentView 	Content view object.
 *	@param 	indexPath 	Index path.
 */
- (void)pageView:(CMPageView *)pageView
     didShowPage:(UIView<ICMPageContentView> *)contentView
       indexPath:(NSIndexPath *)indexPath;


/**
 *	@brief	Page view did scroll.
 *
 *	@param 	pageView 	Page view.
 */
- (void)pageViewDidScroll:(CMPageView *)pageView;

/**
 *	@brief	Page view did end dragging.
 *
 *	@param 	pageView    Page view object.
 *	@param 	decelerate 	Decelerate flag.
 */
- (void)pageViewDidEndDragging:(CMPageView *)pageView
                willDecelerate:(BOOL)decelerate;

/**
 *	@brief	Size for page content view.
 *
 *	@param 	pageView 	Page view object.
 *
 *	@return	Page size.
 */
- (CGSize)sizeForPageContentView:(CMPageView *)pageView;

@end

/**
 *	@brief	Page View
 */
@interface CMPageView : UIView <UIScrollViewDelegate>
{
@private
    UIScrollView *_listScrollView;
    UIPageControl *_pageControl;
    
    NSMutableArray *_visiblePagesArray;
    NSInteger _iCurrentPageIndex;
    NSMutableDictionary *_pageContentPool;
    NSInteger _iPageSize;
    
    BOOL _bNeedReloadData;
    PageControlStyle _pageControlStyle;
    
    id _dataSource;
    id _delegate;
}

/**
 *	@brief	Page control.
 */
@property (nonatomic,readonly) UIPageControl *pageControl;


/**
 *	@brief	Page control style.
 */
@property (nonatomic) PageControlStyle pageControlStyle;


/**
 *	@brief	Current page index.
 */
@property (nonatomic,readonly) NSInteger iCurrentPageIndex;


/**
 *	@brief	Content view.
 */
@property (nonatomic,readonly) UIScrollView *contentView;

/**
 *	@brief	Data source.
 */
@property (nonatomic,assign) id<CMPageViewDataSource> dataSource;


/**
 *	@brief	Delegate object.
 */
@property (nonatomic,assign) id<CMPageViewDelegate> delegate;


/**
 *	@brief	Scroll enabled.
 */
@property (nonatomic,assign) BOOL scrollEnabled;


/**
 *	@brief	Current page content view.
 */
@property (nonatomic,readonly) UIView<ICMPageContentView> *currentPageContentView;

/**
 *	@brief	Dequeue reusable page.
 *
 *	@param 	identifier 	Page identifier.
 *
 *	@return	Page content view.
 */
- (UIView<ICMPageContentView> *)dequeueReusablePageWithIdentifier:(NSString *)identifier;


/**
 *	@brief	Scroll to page.
 *
 *	@param 	pageIndex 	Page index.
 *	@param 	animated 	Animated.
 */
- (void)scrollToPage:(NSUInteger)pageIndex animated:(BOOL)animated;


/**
 *	@brief	Reload data.
 */
- (void)reloadData;


@end
