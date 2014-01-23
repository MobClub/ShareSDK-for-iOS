//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
 *	@brief	Add friend success event.
 *
 *	@param 	headerView 	header view.
 */
- (void)headerViewOnAddFriend:(AGSinaWeiboUserInfoHeaderView *)headerView;


@end

/**
 *	@brief	User information header view.
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
 *	@brief	Friend list button.
 */
@property (nonatomic,readonly) UIButton *friendsButton;

/**
 *	@brief	Follower list button.
 */
@property (nonatomic,readonly) UIButton *followerButton;

/**
 *	@brief	Detail information button
 */
@property (nonatomic,readonly) UIButton *infoButton;

/**
 *	@brief	Delegate object.
 */
@property (nonatomic,assign) id<AGSinaWeiboUserInfoHeaderViewDelegate> delegate;


/**
 *	@brief	Initialize user information header view.
 *
 *	@param 	frame 	Display rect.
 *	@param 	imageCacheManager 	Image cache manager.
 *
 *	@return	Header view.
 */
- (id)initWithFrame:(CGRect)frame imageCacheManager:(CMImageCacheManager *)imageCacheManager;

/**
 *	@brief	Set user information.
 *
 *	@param 	userInfo 	User information.
 */
- (void)setUserInfo:(id<ISSPlatformUser>)userInfo;

@end
