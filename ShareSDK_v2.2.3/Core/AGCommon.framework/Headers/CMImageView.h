//
//  ImageView.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMImageView : UIControl
{
@private
    UIImageView *_imageView;
    UIImage *_image;
    UIImage *_defaultImage;
    
    BOOL _bNeedLayout;
}

/**
 *	@brief	图片对象
 */
@property (nonatomic,retain) UIImage *image;

/**
 *	@brief	默认图片对象，在没有设置图片时显示
 */
@property (nonatomic,retain) UIImage *defaultImage;



@end
