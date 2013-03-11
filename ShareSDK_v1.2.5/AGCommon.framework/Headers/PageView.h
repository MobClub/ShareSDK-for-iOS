//
//  PageView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:1955211608
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IPageContentView.h"

@class PageView;

typedef enum
{
    PageControlStyleNone,
    PageControlStyleTop,
    PageControlStyleBottom
}PageControlStyle;

@protocol PageViewDataSource <NSObject>

@required

/**
	返回页面数量
	@param pageView 页面视图
	@returns 页面数量
 */
- (NSInteger)pageViewNumberOfPage:(PageView *)pageView;

/**
	返回分页内容
	@param pageView 页面视图
	@param indexPath 索引位置
	@returns 页面内容
 */
- (UIView<IPageContentView> *)pageView:(PageView *)pageView pageForIndexPath:(NSIndexPath *)indexPath;



@end

@protocol PageViewDelegate <NSObject>

@optional

/**
	页面将要显示
	@param pageView 页面视图
	@param contentView 页面内容视图
	@param indexPath 索引位置
 */
- (void)pageView:(PageView *)pageView
  willDiplayPage:(UIView<IPageContentView> *)contentView
       indexPath:(NSIndexPath *)indexPath;

/**
	页面显示
	@param pageView 页面视图
	@param contentView 页面内容视图
	@param indexPath 索引位置
 */
- (void)pageView:(PageView *)pageView
     didShowPage:(UIView<IPageContentView> *)contentView
       indexPath:(NSIndexPath *)indexPath;

/**
 *	@brief	视图滚动
 *
 *	@param 	pageView 	页面视图
 */
- (void)pageViewDidScroll:(PageView *)pageView;

/**
 *	@brief	视图停止拖动
 *
 *	@param 	pageView    页面视图
 *	@param 	decelerate 	减速标识
 */
- (void)pageViewDidEndDragging:(PageView *)pageView
                willDecelerate:(BOOL)decelerate;


/**
 *	@brief	分页内容尺寸
 *
 *	@param 	pageView 	分页视图
 *
 *	@return	分页尺寸
 */
- (CGSize)sizeForPageContentView:(PageView *)pageView;

@end

@interface PageView : UIView <UIScrollViewDelegate>
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
	分页控制器样式
 */
@property (nonatomic) PageControlStyle pageControlStyle;

/**
	当前页面索引
 */
@property (nonatomic,readonly) NSInteger iCurrentPageIndex;

/**
 *	@brief	内容视图
 */
@property (nonatomic,readonly) UIScrollView *contentView;

/**
	数据源
 */
@property (nonatomic,assign) id<PageViewDataSource> dataSource;

/**
	委托
 */
@property (nonatomic,assign) id<PageViewDelegate> delegate;

/**
	滚动使能标识
 */
@property (nonatomic,assign) BOOL scrollEnabled;

/**
 *	@brief	当前分页内容视图
 */
@property (nonatomic,readonly) UIView<IPageContentView> *currentPageContentView;


/**
	根据标识值获取可用的页面视图
	@param identifier 标识值
	@returns 页面视图
 */
- (UIView<IPageContentView> *)dequeueReusablePageWithIdentifier:(NSString *)identifier;

/**
    滚动到指定页
    @param pageIndex 页面索引
    @param animated 动画过度标识
 */
- (void)scrollToPage:(NSUInteger)pageIndex animated:(BOOL)animated;

/**
	重新加载数据
 */
- (void)reloadData;

@end
