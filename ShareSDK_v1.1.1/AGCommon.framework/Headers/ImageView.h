//
//  ImageView.h
//  Common
//
//  Created by vimfung on 12-8-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageView : UIControl
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
