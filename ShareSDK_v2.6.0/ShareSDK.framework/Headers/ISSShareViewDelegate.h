//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSViewDelegate.h"
#import "ISSContent.h"

/**
 *	@brief	分享视图委托
 */
@protocol ISSShareViewDelegate <ISSViewDelegate>

@optional

/**
 *	@brief	将要分享内容
 *
 *  @since  ver2.2.0    已过时
 *
 *  @deprecated     已过时，推荐使用- (void)view:willPublishContent:shareList:;方法代替
 *
 *	@param 	viewController 	视图控制器
 *	@param 	content 	内容
 *  @param  shareList   将要分享的平台列表
 *
 *	@return	实际发送的内容
 */
- (id<ISSContent>)view:(UIViewController *)viewController
    willPublishContent:(id<ISSContent>)content;

/**
 *	@brief	将要分享内容
 *
 *  @since  ver2.2.0
 *
 *	@param 	viewController 	视图控制器
 *	@param 	content 	内容
 *  @param  shareList   将要分享的平台列表
 *
 *	@return	实际发送的内容
 */
- (id<ISSContent>)view:(UIViewController *)viewController
    willPublishContent:(id<ISSContent>)content
             shareList:(NSArray *)shareList;

/**
 *	@brief	视图取消发布
 *
 *	@param 	viewController 	视图控制器
 */
- (void)viewOnCancelPublish:(UIViewController *)viewController;

@end
