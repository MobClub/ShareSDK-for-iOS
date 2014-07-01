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

/**
 *	@brief	Grid view cell.
 */
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
 *	@brief	Update item data.
 *
 *	@param 	itemType 	Item class.
 *	@param 	itemSize 	Item size.
 *	@param 	topPadding 	Top padding.
 *	@param 	rightPadding 	Right padding.
 *	@param 	bottomPadding 	Bottom padding.
 *	@param 	leftPadding 	Left padding.
 *	@param 	hGap 	Horizontal gap.
 */
- (void)updateItemType:(Class)itemType
              itemSize:(CGSize)itemSize
            topPadding:(CGFloat)topPadding
          rightPadding:(CGFloat)rightPadding
         bottomPadding:(CGFloat)bottomPadding
           leftPadding:(CGFloat)leftPadding
                  hGap:(CGFloat)hGap;


/**
 *	@brief	Get grid item.
 *
 *	@param 	index 	Item index.
 *
 *	@return	Item object.
 */
- (UIView<ICMGridItemView> *)getItemAtIndex:(NSInteger)index;


/**
 *	@brief	Began to hide unused list items from the specified location
 *
 *	@param 	index 	Item index.
 */
- (void)hideItemFromIndex:(NSInteger)index;


@end
