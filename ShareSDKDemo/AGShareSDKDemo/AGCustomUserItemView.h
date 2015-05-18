//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.mob.com
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
