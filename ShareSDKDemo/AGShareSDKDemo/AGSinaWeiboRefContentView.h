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
#import <AGCommon/CMImageCacheManager.h>
#import <SinaWeiboConnection/SSSinaWeiboStatusInfoReader.h>

@class AGSinaWeiboRefContentView;

@protocol AGSinaWeiboRefContentViewDelegate <NSObject>

@optional

/**
 *	@brief	Show picture
 *
 *	@param 	contentView 	Content view
 *	@param 	imageUrl 	图片URL
 */
- (void)contentView:(AGSinaWeiboRefContentView *)contentView showPic:(NSString *)imageUrl;


@end

/**
 *	@brief	Reference content view.
 */
@interface AGSinaWeiboRefContentView : UIView
{
@private
    UIImageView *_backgroundView;
    UILabel *_contentLabel;
    CMImageView *_imageView;
    
    CMImageCacheManager *_imageCacheManager;
    SSSinaWeiboStatusInfoReader *_status;
    CMImageLoader *_imageLoader;
    
    id<AGSinaWeiboRefContentViewDelegate> _delegate;
}

/**
 *	@brief	Delegate object
 */
@property (nonatomic,assign) id<AGSinaWeiboRefContentViewDelegate> delegate;

/**
 *	@brief	Status information.
 */
@property (nonatomic,retain) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	Initialize Reference content view.
 *
 *  @param  frame   Display rect
 *	@param 	imageCacheManager 	Image cache manager.
 *
 *	@return	Reference content view.
 */
- (id)initWithFrame:(CGRect)frame imageCacheManager:(CMImageCacheManager *)imageCacheManager;

@end
