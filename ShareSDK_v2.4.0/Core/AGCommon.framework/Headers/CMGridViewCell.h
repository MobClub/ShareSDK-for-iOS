//
//  ZGGridViewCell.h
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

@interface CMGridViewCell : UITableViewCell
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
- (UIView<ICMGridItemView> *)getItemAtIndex:(NSInteger)index;

/**
	从指定位置开始隐藏不必要的列表项
	@param index 索引位置
 */
- (void)hideItemFromIndex:(NSInteger)index;



@end
