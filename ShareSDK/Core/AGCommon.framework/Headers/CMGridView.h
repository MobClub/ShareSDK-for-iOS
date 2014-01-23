//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ICMGridItemView.h"

@class CMGridView;

/**
 *	@brief	Grid view delegate.
 */
@protocol CMGridViewDelegate <NSObject>



@required

/**
 *	@brief	Grid item renderer.
 *
 *	@param 	gridView 	Grid view.
 *	@param 	itemRenderer 	Item renderer.
 *	@param 	itemData 	Item data.
 *	@param 	index 	Index.
 */
- (void)gridView:(CMGridView *)gridView
    itemRenderer:(UIView<ICMGridItemView> *)itemRenderer
        itemData:(id)itemData
           index:(NSInteger)index;

@optional

/**
 *	@brief	View did scroll
 *
 *	@param 	gridView 	Grid view.
 */
- (void)gridViewDidScroll:(CMGridView *)gridView;

/**
 *	@brief	View did end dragging.
 *
 *	@param 	gridView 	Grid view object.
 *	@param 	decelerate 	Deceleration flag, YES indicates deceleration movement, or not decelerating motion
 */
- (void)gridViewDidEndDragging:(CMGridView *)gridView willDecelerate:(BOOL)decelerate;

/**
 *	@brief	Footer will display.
 *
 *	@param 	gridView 	Grid view object.
 *	@param 	cell 	Footer cell.
 */
- (void)gridView:(CMGridView *)gridView footerWillDisplay:(UITableViewCell *)cell;

/**
 *	@brief	Footer did selected.
 *
 *	@param 	gridView 	Grid view object.
 *	@param 	cell 	Footer cell.
 */
- (void)gridView:(CMGridView *)gridView footerDidSelected:(UITableViewCell *)cell;


@end

/**
 *	@brief	Grid View.
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
 *	@brief	Data array.
 */
@property (nonatomic,retain) NSArray *dataArray;

/**
 *	@brief	Item class
 */
@property (nonatomic,assign) Class itemType;


/**
 *	@brief	Item size.
 */
@property (nonatomic,assign) CGSize itemSize;


/**
 *	@brief	Scroll enable.
 */
@property (nonatomic) BOOL scrollEnable;


/**
 *	@brief	Left padding.
 */
@property (nonatomic,readonly) CGFloat fLeftPadding;


/**
 *	@brief	Right padding.
 */
@property (nonatomic,readonly) CGFloat fRightPadding;

/**
 *	@brief	Top padding.
 */
@property (nonatomic,readonly) CGFloat fTopPadding;


/**
 *	@brief	Bottom padding
 */
@property (nonatomic,readonly) CGFloat fBottomPadding;


/**
 *	@brief	Horizontal gap
 */
@property (nonatomic,readonly) CGFloat fHorizontalGap;


/**
 *	@brief	Vertical gap.
 */
@property (nonatomic,readonly) CGFloat fVerticalGap;


/**
 *	@brief	Content inset.
 */
@property (nonatomic) UIEdgeInsets contentInset;

/**
 *	@brief	Delegate object.
 */
@property (nonatomic,assign) id<CMGridViewDelegate> delegate;


/**
 *	@brief	Content view.
 */
@property (nonatomic,readonly) UITableView *contentView;

/**
 *	@brief	Footer class，If nil is not displayed footer
 */
@property (nonatomic,assign) Class footerType;

/**
 *	@brief	Set grid padding and spacing
 *
 *	@param 	topPadding 	Top padding
 *	@param 	rightPadding 	Right padding
 *	@param 	bottomPadding 	Bottom padding
 *	@param 	leftPadding 	Left padding
 *	@param 	hGap 	Horizontal gap
 *	@param 	vGap 	Vertical gap
 */
- (void)setGridTopPadding:(CGFloat)topPadding
             rightPadding:(CGFloat)rightPadding
            bottomPadding:(CGFloat)bottomPadding
              leftPadding:(CGFloat)leftPadding
                     hGap:(CGFloat)hGap
                     vGap:(CGFloat)vGap;


/**
 *	@brief	Dequeue a reusable cell.
 *
 *	@param 	identifier 	Cell identifier.
 *
 *	@return	Cell object. If you has not reusable cell return nil
 */
- (UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;



@end
