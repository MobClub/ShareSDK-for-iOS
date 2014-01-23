//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
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
 *	@brief	User information.
 */
@property (nonatomic,retain) SSSinaWeiboUserInfoReader *userInfo;

/**
 *	@brief	Initialize table view cell.
 *
 *	@param 	style 	Style
 *	@param 	reuseIdentifier 	Reuse identifier
 *	@param 	imageCacheManager 	Image cache manager.
 *
 *	@return	Table view cell.
 */
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
  imageCacheManager:(CMImageCacheManager *)imageCacheManager;

@end
