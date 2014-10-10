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
#import <AGCommon/CMImageCacheManager.h>
#import <SinaWeiboConnection/SSSinaWeiboStatusInfoReader.h>

@class AGSinaWeiboRefContentView;

@protocol AGSinaWeiboRefContentViewDelegate <NSObject>

@optional

/**
 *	@brief	显示图片
 *
 *	@param 	contentView 	内容视图
 *	@param 	imageUrl 	图片URL
 */
- (void)contentView:(AGSinaWeiboRefContentView *)contentView showPic:(NSString *)imageUrl;


@end

/**
 *	@brief	引用内容视图
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
 *	@brief	委托对象
 */
@property (nonatomic,assign) id<AGSinaWeiboRefContentViewDelegate> delegate;

/**
 *	@brief	状态信息
 */
@property (nonatomic,retain) SSSinaWeiboStatusInfoReader *status;

/**
 *	@brief	初始化引用内容视图
 *
 *  @param  frame   显示范围
 *	@param 	imageCacheManager 	图片缓存管理器
 *
 *	@return	引用内容视图
 */
- (id)initWithFrame:(CGRect)frame imageCacheManager:(CMImageCacheManager *)imageCacheManager;

@end
