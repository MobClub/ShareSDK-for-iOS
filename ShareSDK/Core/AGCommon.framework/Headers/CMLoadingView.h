///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <UIKit/UIKit.h>

///#begin zh-cn
/**
 *	@brief	加载视图
 */
///#end
///#begin en
/**
 *	@brief	Loading View.
 */
///#end
@interface CMLoadingView : UIView
{
    UIView *_backgroundView;
    UIActivityIndicatorView *_indicatorView;
    UILabel *_label;
    
    BOOL _needLayout;
    
}

///#begin zh-cn
/**
 *	@brief	提示信息
 */
///#end
///#begin en
/**
 *	@brief	Message content.
 */
///#end
@property (nonatomic,copy) NSString *text;

///#begin zh-cn
/**
 *	@brief	显示
 */
///#end
///#begin en
/**
 *	@brief	Display.
 */
///#end
- (void)show;

///#begin zh-cn
/**
 *	@brief	显示到指定视图中
 *
 *	@param 	view 	视图
 */
///#end
///#begin en
/**
 *	@brief	Display to the specified view
 *
 *	@param 	view 	View object.
 */
///#end
- (void)showInView:(UIView *)view;

///#begin zh-cn
/**
 *	@brief	隐藏
 */
///#end
///#begin en
/**
 *	@brief	hide view.
 */
///#end
- (void)hide;

@end
