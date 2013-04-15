//
//  AGCustomUserInfoCell.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/CMImageView.h>
#import <AGCommon/CMImageCacheManager.h>

@interface AGCustomUserInfoCell : UITableViewCell
{
@private
    NSDictionary *_userInfo;
    ShareType _shareType;
    CMImageCacheManager *_cacheManager;
    CMImageLoader *_loader;
    
    UIActivityIndicatorView *_indicatorView;
    CMImageView *_iconImageView;
    
    UIImageView *_vipImageView;
    UIImageView *_sexImageView;
    UILabel *_nickNameLabel;
    UILabel *_descLabel;
    
    
    BOOL _needLayout;
}

/**
 *	@brief	用户信息
 */
@property (nonatomic,retain) NSDictionary *userInfo;

/**
 *	@brief	初始化表格单元格
 *
 *	@param 	style 	样式
 *	@param 	reuseIdentifier 	复用标识
 *	@param 	imageCacheManager 	图片缓存管理器
 *  @param  shareType       分享类型
 *
 *	@return	表格单元格
 */
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
  imageCacheManager:(CMImageCacheManager *)imageCacheManager
          shareType:(ShareType)shareType;


@end
