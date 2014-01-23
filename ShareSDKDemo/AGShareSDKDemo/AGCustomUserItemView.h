//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <AGCommon/CMHTableViewItem.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/CMImageCacheManager.h>

/**
 *	@brief	Custome User item View.
 */
@interface AGCustomUserItemView : CMHTableViewItem
{
@private
    NSMutableDictionary *_userInfo;
    BOOL _needLayout;
    ShareType _shareType;
    CMImageCacheManager *_imageCacheManager;
    CMImageLoader *_loader;
    id _clickHandler;

    UIImageView *_iconImageView;
    UIImageView *_maskImageView;
}

/**
 *	@brief	User information.
 */
@property (nonatomic,retain) NSMutableDictionary *userInfo;

/**
 *	@brief	Initialize custom user item view.
 *
 *	@param 	reuseIdentifier 	Reuse identifier
 *	@param 	imageCacheManager 	Image cache manager.
 *	@param 	shareType 	Platform type
 *  @param  clickHandler    Click handler.
 *
 *	@return	Item view.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
            imageCacheManager:(CMImageCacheManager *)imageCacheManager
                    shareType:(ShareType)shareType
                 clickHandler:(void(^)(NSMutableDictionary *userInfo))clickHandler;


@end
