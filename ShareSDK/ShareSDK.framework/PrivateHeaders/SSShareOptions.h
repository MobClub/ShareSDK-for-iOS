//
//  SSShareOptions.h
//  ShareSDKInterface
//
//  Created by 冯 鸿杰 on 13-4-7.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef __SHARESDK_HEADER__
#import "ISSShareOptions.h"
#import "ISSViewDelegate.h"
#import "ISSShareViewDelegate.h"
#import "ShareSDKTypeDef.h"
#import "ISSShareView.h"
#else
#import "../Headers/ISSShareOptions.h"
#import "../Headers/ISSViewDelegate.h"
#import "../Headers/ISSShareViewDelegate.h"
#import "../Headers/ShareSDKTypeDef.h"
#import "../Headers/ISSShareView.h"
#endif

/**
 *	@brief	分享选项
 */
@interface SSShareOptions : NSObject <ISSShareOptions>
{
@private
    SSShareViewStyle _viewStyle;
    NSArray *_oneKeyShareList;
    NSString *_title;
    
    BOOL _cameraButtonHidden;
    BOOL _mentiontButtonHidden;
    BOOL _topicButtonHidden;
    BOOL _qqButtonHidden;
    BOOL _wxSessionButtonHidden;
    BOOL _wxTimelineButtonHidden;
    BOOL _showKeyboardOnAppear;
    
    id<ISSShareViewDelegate> _shareViewDelegate;
    id<ISSViewDelegate> _friendsViewDelegate;
    id<ISSViewDelegate> _picViewerViewDelegate;
    id<ISSViewDelegate> _mailViewDelegate;
    id<ISSViewDelegate> _smsViewDelegate;
}

/**
 *	@brief	分享视图样式
 */
@property (nonatomic) SSShareViewStyle viewStyle;

/**
 *	@brief	一键分享列表, 样式为ShareViewStyleDefault时有效
 */
@property (nonatomic,retain) NSArray *oneKeyShareList;

/**
 *	@brief	分享视图标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *	@brief	QQ分享按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 */
@property (nonatomic) BOOL qqButtonHidden;

/**
 *	@brief	微信好友分享按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 */
@property (nonatomic) BOOL wxSessionButtonHidden;

/**
 *	@brief	微信朋友圈分享按钮隐藏标识，默认NO, 样式为ShareViewStyleDefault时有效
 */
@property (nonatomic) BOOL wxTimelineButtonHidden;

/**
 *	@brief	是否在视图显示时显示键盘,默认NO。当一键分享列表为nil时，此值无效。
 */
@property (nonatomic) BOOL showKeyboardOnAppear;

/**
 *	@brief	分享视图委托
 */
@property (nonatomic,assign) id<ISSShareViewDelegate> shareViewDelegate;

/**
 *	@brief	好友视图委托
 */
@property (nonatomic,assign) id<ISSViewDelegate> friendsViewDelegate;

/**
 *	@brief	图片查看器视图委托
 */
@property (nonatomic,assign) id<ISSViewDelegate> picViewerViewDelegate;

/**
 *	@brief	邮件视图委托
 */
@property (nonatomic,assign) id<ISSViewDelegate> mailViewDelegate;

/**
 *	@brief	短信时间委托
 */
@property (nonatomic,assign) id<ISSViewDelegate> smsViewDelegate;


/**
 *	@brief	拍照按钮隐藏标识，YES 表示隐藏，NO 表示显示，默认为NO.
 *
 *  @since  ver2.2.0
 */
@property (nonatomic) BOOL cameraButtonHidden;

/**
 *	@brief	@按钮隐藏标识，YES 表示隐藏，NO 表示显示，默认为NO.
 *
 *  @since  ver2.2.0
 */
@property (nonatomic) BOOL mentionButtonHidden;

/**
 *	@brief	话题按钮隐藏标识，YES 表示隐藏，NO 表示显示，默认为NO.
 *
 *  @since  ver2.2.0
 */
@property (nonatomic) BOOL topicButtonHidden;

/**
 *	@brief	获取分享视图对象
 *
 *	@return	分享视图对象
 */
- (id<ISSShareView>)getShareView;

@end
