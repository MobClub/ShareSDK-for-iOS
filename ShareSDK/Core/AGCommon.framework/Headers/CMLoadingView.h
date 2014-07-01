//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
 *	@brief	Loading View.
 */
@interface CMLoadingView : UIView
{
    UIView *_backgroundView;
    UIActivityIndicatorView *_indicatorView;
    UILabel *_label;
    
    BOOL _needLayout;
    
}

/**
 *	@brief	Message content.
 */
@property (nonatomic,copy) NSString *text;

/**
 *	@brief	Display.
 */
- (void)show;

/**
 *	@brief	Display to the specified view
 *
 *	@param 	view 	View object.
 */
- (void)showInView:(UIView *)view;

/**
 *	@brief	hide view.
 */
- (void)hide;

@end
