//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AGCommon/CMImageCacheManager.h>
#import <AGCommon/CMImageView.h>
#import <SinaWeiboConnection/SinaWeiboConnection.h>
#import <SinaWeiboConnection/SSSinaWeiboUserInfoReader.h>

@interface AGSinaWeiboUserCell : UITableViewCell
{
@private
    SSSinaWeiboUserInfoReader *_userInfo;
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
@property (nonatomic,retain) SSSinaWeiboUserInfoReader *userInfo;

/**
 *	@brief	初始化表格单元格
 *
 *	@param 	style 	样式
 *	@param 	reuseIdentifier 	复用标识
 *	@param 	imageCacheManager 	图片缓存管理器
 *
 *	@return	表格单元格
 */
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
  imageCacheManager:(CMImageCacheManager *)imageCacheManager;

@end
