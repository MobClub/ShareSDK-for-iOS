//
//  SSStatusBarView.h
//  ShareSDKInterface
//
//  Created by vimfung on 13-4-6.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *	@brief	状态数
 */
@interface SSStatusBarView : UIView
{
@private
    UIActivityIndicatorView *_indicatorView;
    UIImageView *_iconView;
    UILabel *_textLabel;
    
    BOOL _needLayout;
}

/**
 *	@brief	设置消息
 *
 *	@param 	message 	消息内容
 *	@param 	icon 	图标
 */
- (void)setMessage:(NSString *)message icon:(UIImage *)icon;

/**
 *	@brief	设置消息
 *
 *	@param 	message 	消息内容
 *	@param 	loading 	是否显示等待提示
 */
- (void)setMessage:(NSString *)message loading:(BOOL)loading;

@end
