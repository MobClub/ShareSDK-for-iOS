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

/**
 *	@brief	Picture view controller.
 */
@interface AGSinaWeiboPictureViewController : UIViewController <UIScrollViewDelegate>
{
@private
    NSString *_imageUrl;
    CMImageCacheManager *_imageCacheManager;
    CMImageLoader *_imageLoader;
    
    UIScrollView *_contentView;
    UIImageView *_imageView;
}

/**
 *	@brief	Initialize view controller.
 *
 *	@param 	imageUrl 	Image URL.
 *
 *	@return	View controller.
 */
- (id)initWithImageUrl:(NSString *)imageUrl imageCacheManager:(CMImageCacheManager *)imageCacheManager;

@end
