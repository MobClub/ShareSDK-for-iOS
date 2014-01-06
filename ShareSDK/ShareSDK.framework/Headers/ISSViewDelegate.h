//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ShareSDKTypeDef.h"

/**
 *	@brief	视图委托协议
 */
@protocol ISSViewDelegate <NSObject>

@optional

/**
 *	@brief	视图将要显示
 *
 *	@param 	viewController 	视图控制器
 *  @param  shareType   分享类型
 */
- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType;

/**
 *	@brief	视图将要关闭
 *
 *	@param 	viewController 	视图控制器
 *  @param  shareType   分享类型
 */
- (void)viewOnWillDismiss:(UIViewController *)viewController shareType:(ShareType)shareType;

/**
 *	@brief	视图旋转到某个方向
 *
 *  @param  viewController    视图控制器
 *	@param 	toInterfaceOrientation 	设备方向
 *  @param  shareType   分享类型
 */
- (void)view:(UIViewController *)viewController autorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation shareType:(ShareType)shareType;

@end
