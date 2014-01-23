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
#import "AGSinaWeiboRefContentView.h"
#import <AGCommon/CMImageCacheManager.h>
#import <SinaWeiboConnection/SSSinaWeiboStatusInfoReader.h>
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

@class AGSinaWeiboStatusCell;

@protocol AGSinaWeiboStatusCellDelegate <NSObject>

@optional

/**
 *	@brief	Show picture.
 *
 *	@param 	cell 	Table view cell.
 *	@param 	url 	Picture url.
 */
- (void)cell:(AGSinaWeiboStatusCell *)cell onShowPic:(NSString *)url;


@end

/**
 *	@brief	Status Cell
 */
@interface AGSinaWeiboStatusCell : UITableViewCell <AGSinaWeiboRefContentViewDelegate>
{
@private
    CMImageView *_iconImageView;
    UIImageView *_vipImageView;
    UIImageView *_lineImageView;
    UILabel *_nameLabel;
    UILabel *_contentLabel;
    UILabel *_pubDateLabel;
    UILabel *_sourceLabel;
    UILabel *_commentLabel;
    UILabel *_splitLabel;
    UILabel *_replyLabel;
    CMImageView *_picImageView;
    AGSinaWeiboRefContentView *_refContentView;
    
    CMImageCacheManager *_imageCacheManager;
    SSSinaWeiboStatusInfoReader *_status;
    BOOL _needLayout;
    CGFloat _cellHeight;
    CMImageLoader *_iconLoader;
    CMImageLoader *_picLoader;
    
    id<AGSinaWeiboStatusCellDelegate> _delegate;
}

/**
 *	@brief	Status information.
 */
@property (nonatomic,retain) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	Cell height.
 */
@property (nonatomic,readonly) CGFloat cellHeight;

/**
 *	@brief	Delegate object.
 */
@property (nonatomic,assign) id<AGSinaWeiboStatusCellDelegate> delegate;

/**
 *	@brief	Initialize Cell
 *
 *	@param 	style 	Cell style.
 *	@param 	reuseIdentifier 	Reuse identifier
 *	@param 	imageCacheManager 	Image cache manager
 *
 *	@return	Cell object.
 */
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
  imageCacheManager:(CMImageCacheManager *)imageCacheManager;

/**
 *	@brief	According to Sina status information typesetting
 *
 *	@param 	status 	Status information.
 *  @param  isCalCellHeight     Whether to calculate the height of cell, YES, said calculating height, the picture will not be loaded
 *
 *	@return	Cell height.
 */
- (CGFloat)layoutThatStaus:(SSSinaWeiboStatusInfoReader *)status isCalCellHeight:(BOOL)isCalCellHeight;


@end
