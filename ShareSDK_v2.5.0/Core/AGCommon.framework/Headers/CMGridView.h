//
//  ZGGridView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICMGridItemView.h"

@class CMGridView;

/**
	表格视图委托
 */
@protocol CMGridViewDelegate <NSObject>


@required

/**
 *	@brief	表格项渲染
 *
 *	@param 	gridView 	表格视图
 *	@param 	itemRenderer 	表格项渲染器
 *	@param 	itemData 	表格项数据
 *	@param 	index 	位置索引
 */
- (void)gridView:(CMGridView *)gridView
    itemRenderer:(UIView<ICMGridItemView> *)itemRenderer
        itemData:(id)itemData
           index:(NSInteger)index;

@optional

/**
 *	@brief	表格视图滚动
 *
 *	@param 	gridView 	表格视图
 */
- (void)gridViewDidScroll:(CMGridView *)gridView;

/**
 *	@brief	表格视图停止拖动
 *
 *	@param 	quiltView 	表格视图
 *	@param 	decelerate 	减速运动标识，YES表示进行减速运动，否则不进行减速运动
 */
- (void)gridViewDidEndDragging:(CMGridView *)gridView willDecelerate:(BOOL)decelerate;

/**
 *	@brief	表格视图页脚将要显示
 *
 *	@param 	gridView 	表格视图
 *	@param 	cell 	页脚项
 */
- (void)gridView:(CMGridView *)gridView footerWillDisplay:(UITableViewCell *)cell;

/**
 *	@brief	表格视图页脚被选中
 *
 *	@param 	gridView 	表格视图
 *	@param 	cell 	页脚项
 */
- (void)gridView:(CMGridView *)gridView footerDidSelected:(UITableViewCell *)cell;


@end

/**
	表格视图
 */
@interface CMGridView : UIView <UITableViewDataSource,
                                UITableViewDelegate,
                                UIScrollViewDelegate>
{
@private
    UITableView *_tableView;
    Class _itemType;
    Class _footerType;
    NSArray *_dataArray;
    
    NSInteger _iColumnCount;
    NSInteger _iRowCount;
    CGFloat _fLeftPadding;
    CGFloat _fRightPadding;
    CGFloat _fTopPadding;
    CGFloat _fBottomPadding;
    CGFloat _fHorizontalGap;
    CGFloat _fVerticalGap;
    
    CGSize _itemSize;
    
    id _delegate;
}

/**
    列表数据
 */
@property (nonatomic,retain) NSArray *dataArray;

/**
	列表项类型
 */
@property (nonatomic,assign) Class itemType;

/**
	列表项大小
 */
@property (nonatomic,assign) CGSize itemSize;

/**
	滚动标识
 */
@property (nonatomic) BOOL scrollEnable;

/**
	左边距
 */
@property (nonatomic,readonly) CGFloat fLeftPadding;

/**
	右边距
 */
@property (nonatomic,readonly) CGFloat fRightPadding;

/**
	顶部边距
 */
@property (nonatomic,readonly) CGFloat fTopPadding;

/**
	顶部边距
 */
@property (nonatomic,readonly) CGFloat fBottomPadding;

/**
	水平间距
 */
@property (nonatomic,readonly) CGFloat fHorizontalGap;

/**
	垂直间距
 */
@property (nonatomic,readonly) CGFloat fVerticalGap;

/**
 *	@brief	内容偏移量
 */
@property (nonatomic) UIEdgeInsets contentInset;

/**
	委托对象
 */
@property (nonatomic,assign) id<CMGridViewDelegate> delegate;

/**
 *	@brief	内容视图
 */
@property (nonatomic,readonly) UITableView *contentView;

/**
 *	@brief	页脚类型，如果为nil则不显示页脚
 */
@property (nonatomic,assign) Class footerType;




/**
	设置表格边距及间距
	@param topPadding 顶部边距
	@param rightPadding 右边距
	@param bottomPadding 底部边距
	@param leftPadding 左边距
	@param hGap 水平间距
	@param vGap 垂直间距
 */
- (void)setGridTopPadding:(CGFloat)topPadding
             rightPadding:(CGFloat)rightPadding
            bottomPadding:(CGFloat)bottomPadding
              leftPadding:(CGFloat)leftPadding
                     hGap:(CGFloat)hGap
                     vGap:(CGFloat)vGap;


/**
	出队一个尚未使用的单元格
	@param identifier 引用标识
	@returns 单元格对象，如果没有尚未使用的则返回nil
 */
- (UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;


@end
