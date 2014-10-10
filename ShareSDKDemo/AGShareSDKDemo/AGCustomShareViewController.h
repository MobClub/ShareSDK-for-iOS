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
#import <ShareSDK/ShareSDK.h>
#import "AGCustomShareViewToolbar.h"

@class AGAppDelegate;

/**
 *	@brief	自定义分享视图控制器
 */
@interface AGCustomShareViewController : UIViewController <UITextViewDelegate>
{
@private
    UITextView *_textView;
    CMImageView *_picImageView;
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
    AGAppDelegate *_appDelegate;
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
