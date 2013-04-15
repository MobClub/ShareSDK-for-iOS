//
//  AGCustomUserItemView.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-6.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <AGCommon/CMHTableViewItem.h>
#import <ShareSDK/ShareSDK.h>
#import <AGCommon/CMImageCacheManager.h>

/**
 *	@brief	用户列表项
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
 *	@brief	用户信息
 */
@property (nonatomic,retain) NSMutableDictionary *userInfo;

/**
 *	@brief	初始化列表项
 *
 *	@param 	reuseIdentifier 	复用标识
 *	@param 	imageCacheManager 	图片缓存管理器
 *	@param 	shareType 	分享类型
 *  @param  clickHandler    点击事件处理器
 *
 *	@return	列表项
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
            imageCacheManager:(CMImageCacheManager *)imageCacheManager
                    shareType:(ShareType)shareType
                 clickHandler:(void(^)(NSMutableDictionary *userInfo))clickHandler;


@end
