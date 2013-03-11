//
//  AGCustomShareViewController.h
//  AGShareSDKDemo
//
//  Created by 冯 鸿杰 on 13-3-5.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AGCommon/ImageView.h>
#import <ShareSDK/ShareSDK.h>
#import "AGCustomShareViewToolbar.h"

/**
 *	@brief	自定义分享视图控制器
 */
@interface AGCustomShareViewController : UIViewController <UITextViewDelegate>
{
@private
    UITextView *_textView;
    ImageView *_picImageView;
    AGCustomShareViewToolbar *_toolbar;
    UIButton *_atButton;
    UIImageView *_contentBG;
    UIImageView *_toolbarBG;
    UIImageView *_picBG;
    UIImageView *_pinImageView;
    UILabel *_atTipsLabel;
    UILabel *_wordCountLabel;
    
    UIImage *_image;
    NSString *_content;
    CGFloat _keyboardHeight;
}

/**
 *	@brief	初始化视图控制器
 *
 *	@param 	image 	图片
 *	@param 	content 	内容
 *
 *	@return	视图控制器
 */
- (id)initWithImage:(UIImage *)image
            content:(NSString *)content;


@end
