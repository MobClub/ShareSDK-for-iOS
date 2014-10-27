//
//  SSStatusBar.h
//  ShareSDKInterface
//
//  Created by vimfung on 13-4-6.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSStatusBarView.h"

/**
 *	@brief	状态栏
 */
@interface SSStatusBar : UIWindow
{
@private
    NSMutableArray *_immediMessages;
    NSDictionary *_alwaysMessage;
    NSInteger _curShowType;        //当前消息类型 0 没有消息， 1 永久消息  2 立即消息
    BOOL _isShow;
    BOOL _hasMessage;
    UIStatusBarStyle _curBarStyle;
    
    UIView *_maskPanelView;
    NSMutableArray *_reuseViewPool;
    SSStatusBarView *_curView;
    SSStatusBarView *_bufferView;
}

/**
 *	@brief	添加立即消息
 *
 *	@param 	message 	消息内容
 *  @param  icon    图标
 *  @param  loading 等待提示
 *  @param  duration    持续时间
 */
- (void)addImmediMessage:(NSString *)message icon:(UIImage *)icon loading:(BOOL)loading duration:(CGFloat)duration;

/**
 *	@brief	添加永久消息
 *
 *	@param 	message 	消息内容
 *  @param  icon    图标
 *  @param  loading 等待提示
 */
- (void)addAlwaysMessage:(NSString *)message icon:(UIImage *)icon loading:(BOOL)loading;

/**
 *	@brief	删除永久消息
 */
- (void)removeAlwaysMessage;

@end
