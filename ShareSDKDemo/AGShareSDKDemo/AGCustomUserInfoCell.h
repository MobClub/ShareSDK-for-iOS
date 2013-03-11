//
//  AGCustomUserInfoCell.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/ImageView.h>
#import <AGCommon/ImageCacheManager.h>

@interface AGCustomUserInfoCell : UITableViewCell
{
@private
    NSDictionary *_userInfo;
    ShareType _shareType;
    ImageCacheManager *_cacheManager;
    ImageLoader *_loader;
    
    UIActivityIndicatorView *_indicatorView;
    ImageView *_iconImageView;
    
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
  imageCacheManager:(ImageCacheManager *)imageCacheManager
          shareType:(ShareType)shareType;


@end
