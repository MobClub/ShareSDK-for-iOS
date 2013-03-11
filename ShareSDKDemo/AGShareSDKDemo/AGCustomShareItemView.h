//
//  AGShareItemView.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AGCommon/CMHTableViewItem.h>

/**
 *	@brief	一键分享列表项视图
 */
@interface AGCustomShareItemView : CMHTableViewItem
{
@private
    UIImageView *_iconImageView;
    id _clickHandler;
}

/**
 *	@brief	图标视图
 */
@property (nonatomic,readonly) UIImageView *iconImageView;


/**
 *	@brief	初始化列表项
 *
 *	@param 	reuseIdentifier 	复用标识
 *  @param  clickHandler    点击事件处理器
 *
 *	@return	列表项对象
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
                 clickHandler:(void(^)(NSIndexPath *indexPath))clickHandler;


@end
