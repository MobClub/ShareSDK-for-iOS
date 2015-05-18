//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
