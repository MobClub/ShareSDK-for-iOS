///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <UIKit/UIKit.h>
#import "ICMPageContentView.h"

@class CMPageView;

///#begin zh-cn
/**
 *	@brief	页面控制器样式
 */
///#end
///#begin en
/**
 *	@brief	Page control style.
 */
///#end
typedef enum
{
	PageControlStyleNone, /**< 无分页控制器 */
	PageControlStyleTop, /**< 分页控制器在顶部 */
	PageControlStyleBottom /**< 分页控制器在底部 */
}PageControlStyle;

///#begin zh-cn
/**
 *	@brief	分页视图数据源
 */
///#end
///#begin en
/**
 *	@brief	Page view data source.
 */
///#end
@protocol CMPageViewDataSource <NSObject>

@required

///#begin zh-cn
/**
 *	@brief	返回页面数量
 *
 *	@param 	pageView 	页面视图
 *
 *	@return	页面数量
 */
///#end
///#begin en
/**
 *	@brief	Return page number.
 *
 *	@param 	pageView 	Page view object.
 *
 *	@return	Page number.
 */
///#end
- (NSInteger)pageViewNumberOfPage:(CMPageView *)pageView;


///#begin zh-cn
/**
 *	@brief	返回分页内容
 *
 *	@param 	pageView 	页面视图
 *	@param 	indexPath 	索引位置
 *
 *	@return	页面内容
 */
///#end
///#begin en
/**
 *	@brief	Return a page content view.
 *
 *	@param 	pageView 	Page view object.
 *	@param 	indexPath 	Index path.
 *
 *	@return	Page content view.
 */
///#end
- (UIView<ICMPageContentView> *)pageView:(CMPageView *)pageView pageForIndexPath:(NSIndexPath *)indexPath;

@end

///#begin zh-cn
/**
 *	@brief	分页视图委托
 */
///#end
///#begin en
/**
 *	@brief	Page view delegate.
 */
///#end
@protocol CMPageViewDelegate <NSObject>

@optional

///#begin zh-cn
/**
 *	@brief	页面将要显示
 *
 *	@param 	pageView 	页面视图
 *	@param 	contentView 	页面内容视图
 *	@param 	indexPath 	索引位置
 */
///#end
///#begin en
/**
 *	@brief	Will display page.
 *
 *	@param 	pageView 	Page view.
 *	@param 	contentView 	Content view.
 *	@param 	indexPath 	Index path.
 */
///#end
- (void)pageView:(CMPageView *)pageView
  willDiplayPage:(UIView<ICMPageContentView> *)contentView
       indexPath:(NSIndexPath *)indexPath;


///#begin zh-cn
/**
 *	@brief	页面显示
 *
 *	@param 	pageView 	页面视图
 *	@param 	contentView 	页面内容视图
 *	@param 	indexPath 	索引位置
 */
///#end
///#begin en
/**
 *	@brief	Did show page.
 *
 *	@param 	pageView 	Page view object.
 *	@param 	contentView 	Content view object.
 *	@param 	indexPath 	Index path.
 */
///#end
- (void)pageView:(CMPageView *)pageView
     didShowPage:(UIView<ICMPageContentView> *)contentView
       indexPath:(NSIndexPath *)indexPath;


///#begin zh-cn
/**
 *	@brief	视图滚动
 *
 *	@param 	pageView 	页面视图
 */
///#end
///#begin en
/**
 *	@brief	Page view did scroll.
 *
 *	@param 	pageView 	Page view.
 */
///#end
- (void)pageViewDidScroll:(CMPageView *)pageView;

///#begin zh-cn
/**
 *	@brief	视图停止拖动
 *
 *	@param 	pageView    页面视图
 *	@param 	decelerate 	减速标识
 */
///#end
///#begin en
/**
 *	@brief	Page view did end dragging.
 *
 *	@param 	pageView    Page view object.
 *	@param 	decelerate 	Decelerate flag.
 */
///#end
- (void)pageViewDidEndDragging:(CMPageView *)pageView
                willDecelerate:(BOOL)decelerate;

///#begin zh-cn
/**
 *	@brief	分页内容尺寸
 *
 *	@param 	pageView 	分页视图
 *
 *	@return	分页尺寸
 */
///#end
///#begin en
/**
 *	@brief	Size for page content view.
 *
 *	@param 	pageView 	Page view object.
 *
 *	@return	Page size.
 */
///#end
- (CGSize)sizeForPageContentView:(CMPageView *)pageView;

@end

///#begin zh-cn
/**
 *	@brief	分页视图
 */
///#end
///#begin en
/**
 *	@brief	Page View
 */
///#end
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

///#begin zh-cn
/**
 *	@brief	分页控制器
 */
///#end
///#begin en
/**
 *	@brief	Page control.
 */
///#end
@property (nonatomic,readonly) UIPageControl *pageControl;


///#begin zh-cn
/**
 *	@brief	分页控制器样式
 */
///#end
///#begin en
/**
 *	@brief	Page control style.
 */
///#end
@property (nonatomic) PageControlStyle pageControlStyle;


///#begin zh-cn
/**
 *	@brief	当前页面索引
 */
///#end
///#begin en
/**
 *	@brief	Current page index.
 */
///#end
@property (nonatomic,readonly) NSInteger iCurrentPageIndex;


///#begin zh-cn
/**
 *	@brief	内容视图
 */
///#end
///#begin en
/**
 *	@brief	Content view.
 */
///#end
@property (nonatomic,readonly) UIScrollView *contentView;

///#begin zh-cn
/**
 *	@brief	数据源
 */
///#end
///#begin en
/**
 *	@brief	Data source.
 */
///#end
@property (nonatomic,assign) id<CMPageViewDataSource> dataSource;


///#begin zh-cn
/**
 *	@brief	委托.
 */
///#end
///#begin en
/**
 *	@brief	Delegate object.
 */
///#end
@property (nonatomic,assign) id<CMPageViewDelegate> delegate;


///#begin zh-cn
/**
 *	@brief	滚动使能标识
 */
///#end
///#begin en
/**
 *	@brief	Scroll enabled.
 */
///#end
@property (nonatomic,assign) BOOL scrollEnabled;


///#begin zh-cn
/**
 *	@brief	当前分页内容视图
 */
///#end
///#begin en
/**
 *	@brief	Current page content view.
 */
///#end
@property (nonatomic,readonly) UIView<ICMPageContentView> *currentPageContentView;

///#begin zh-cn
/**
 *	@brief	根据标识值获取可用的页面视图
 *
 *	@param 	identifier 	标识值
 *
 *	@return	页面视图
 */
///#end
///#begin en
/**
 *	@brief	Dequeue reusable page.
 *
 *	@param 	identifier 	Page identifier.
 *
 *	@return	Page content view.
 */
///#end
- (UIView<ICMPageContentView> *)dequeueReusablePageWithIdentifier:(NSString *)identifier;


///#begin zh-cn
/**
 *	@brief	滚动到指定页
 *
 *	@param 	pageIndex 	页面索引
 *	@param 	animated 	动画过度标识
 */
///#end
///#begin en
/**
 *	@brief	Scroll to page.
 *
 *	@param 	pageIndex 	Page index.
 *	@param 	animated 	Animated.
 */
///#end
- (void)scrollToPage:(NSUInteger)pageIndex animated:(BOOL)animated;


///#begin zh-cn
/**
 *	@brief	重新加载数据
 */
///#end
///#begin en
/**
 *	@brief	Reload data.
 */
///#end
- (void)reloadData;


@end
