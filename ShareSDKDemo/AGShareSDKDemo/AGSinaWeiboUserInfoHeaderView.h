//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMImageView.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>
#import "AGSinaWeiboInfoButton.h"
#import "AGSinaWeiboSubtitleButton.h"
#import <AGCommon/CMImageCacheManager.h>

@class AGSinaWeiboUserInfoHeaderView;

@protocol AGSinaWeiboUserInfoHeaderViewDelegate <NSObject>

@optional

/**
 *	@brief	添加好友成功
 *
 *	@param 	headerView 	表头视图
 */
- (void)headerViewOnAddFriend:(AGSinaWeiboUserInfoHeaderView *)headerView;


@end

/**
 *	@brief	用户信息表头
 */
@interface AGSinaWeiboUserInfoHeaderView : UIView
{
@private
    UIImageView *_backgroundImageView;
    UIImageView *_genderImageView;
    UIImageView *_vipImageView;
    UIImageView *_lineImageView;
    CMImageView *_iconImageView;
    UILabel *_nameLabel;
    UILabel *_descLabel;
    UILabel *_locationLabel;
    UIButton *_followButton;
    AGSinaWeiboSubtitleButton *_statusesButton;
    AGSinaWeiboSubtitleButton *_friendsButton;
    AGSinaWeiboSubtitleButton *_followerButton;
    AGSinaWeiboInfoButton *_infoButton;
    
    id<ISSPlatformUser> _userInfo;
    CMImageCacheManager *_imageCacheManager;
    CMImageLoader *_iconImageLoader;
    BOOL _needLayout;
    BOOL _isFollowing;
    id<AGSinaWeiboUserInfoHeaderViewDelegate> _delegate;
}

/**
 *	@brief	关注列表按钮
 */
@property (nonatomic,readonly) UIButton *friendsButton;

/**
 *	@brief	粉丝列表按钮
 */
@property (nonatomic,readonly) UIButton *followerButton;

/**
 *	@brief	详细信息按钮
 */
@property (nonatomic,readonly) UIButton *infoButton;

/**
 *	@brief	协议委托
 */
@property (nonatomic,assign) id<AGSinaWeiboUserInfoHeaderViewDelegate> delegate;


/**
 *	@brief	初始化用户信息表头
 *
 *	@param 	frame 	显示范围
 *	@param 	imageCacheManager 	图片缓存管理器
 *
 *	@return	表头视图
 */
- (id)initWithFrame:(CGRect)frame imageCacheManager:(CMImageCacheManager *)imageCacheManager;

/**
 *	@brief	设置用户信息
 *
 *	@param 	userInfo 	用户信息
 */
- (void)setUserInfo:(id<ISSPlatformUser>)userInfo;

@end
