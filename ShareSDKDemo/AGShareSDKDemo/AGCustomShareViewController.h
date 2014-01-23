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
#import <ShareSDK/ShareSDK.h>
#import "AGCustomShareViewToolbar.h"

@class AGAppDelegate;

/**
 *	@brief	Custom share view controller.
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
 *	@brief	Initialize share view controller
 *
 *	@param 	image 	Image
 *	@param 	content 	Content string
 *
 *	@return	View controller.
 */
- (id)initWithImage:(UIImage *)image
            content:(NSString *)content;


@end
