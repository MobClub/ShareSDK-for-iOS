//
//  ZGGridViewCell.h
//  iAround
//
//  Created by hower on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGridItemView.h"

@interface GridViewCell : UITableViewCell
{
@private
    NSMutableArray *_itemArray;
    
    Class _itemType;
    
    CGSize _itemSize;
    CGFloat _fTopPadding;
    CGFloat _fBottomPadding;
    CGFloat _fLeftPadding;
    CGFloat _fRightPadding;
    CGFloat _fHGap;
    
    BOOL _bHasUpdateLayout;
}

/**
	更新列表项类型以及列数量
    @param itemType 列表项类型
    @param itemSize 列表项大小
    @param topPadding 顶部边距
    @param rightPadding 右边距
    @param bottomPadding 底部边距
    @param leftPadding 左边距
    @param hGap 水平间距
 */
- (void)updateItemType:(Class)itemType
              itemSize:(CGSize)itemSize
            topPadding:(CGFloat)topPadding
          rightPadding:(CGFloat)rightPadding
         bottomPadding:(CGFloat)bottomPadding
           leftPadding:(CGFloat)leftPadding
                  hGap:(CGFloat)hGap;

/**
	获取表格项视图
	@param index 索引位置
	@returns 表格项视图对象
 */
- (UIView<IGridItemView> *)getItemAtIndex:(NSInteger)index;

/**
	从指定位置开始隐藏不必要的列表项
	@param index 索引位置
 */
- (void)hideItemFromIndex:(NSInteger)index;



@end
