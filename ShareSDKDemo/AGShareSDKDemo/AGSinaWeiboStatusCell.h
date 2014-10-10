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
#import "AGSinaWeiboRefContentView.h"
#import <AGCommon/CMImageCacheManager.h>
#import <SinaWeiboConnection/SSSinaWeiboStatusInfoReader.h>
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

@class AGSinaWeiboStatusCell;

@protocol AGSinaWeiboStatusCellDelegate <NSObject>

@optional

/**
 *	@brief	显示图片
 *
 *	@param 	cell 	状态单元
 *	@param 	url 	图片路径
 */
- (void)cell:(AGSinaWeiboStatusCell *)cell onShowPic:(NSString *)url;


@end

/**
 *	@brief	微博状态单元格
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
 *	@brief	微博状态信息
 */
@property (nonatomic,retain) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	单元格高度
 */
@property (nonatomic,readonly) CGFloat cellHeight;

/**
 *	@brief	协议委托
 */
@property (nonatomic,assign) id<AGSinaWeiboStatusCellDelegate> delegate;

/**
 *	@brief	初始化单元格
 *
 *	@param 	style 	风格
 *	@param 	reuseIdentifier 	复用标识
 *	@param 	imageCacheManager 	图片缓存管理器
 *
 *	@return	单元格
 */
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
  imageCacheManager:(CMImageCacheManager *)imageCacheManager;

/**
 *	@brief	根据新浪状态信息排版
 *
 *	@param 	status 	状态信息
 *  @param  isCalCellHeight     是否计算高度标识，YES表示计算高度，将不对图片进行加载
 *
 *	@return	单元格高度
 */
- (CGFloat)layoutThatStaus:(SSSinaWeiboStatusInfoReader *)status isCalCellHeight:(BOOL)isCalCellHeight;


@end
