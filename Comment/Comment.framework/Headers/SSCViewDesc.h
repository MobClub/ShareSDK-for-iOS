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

#import <Foundation/Foundation.h>
#import "SSCommentTypeDef.h"

///#begin zh-cn
/**
 *	@brief	视图描述
 */
///#end
///#begin en
/**
 *	@brief	View description
 */
///#end
@interface SSCViewDesc : NSObject

///#begin zh-cn
/**
 *	@brief	导航栏背景图
 */
///#end
///#begin en
/**
 *	@brief	Navigation bar background image.
 */
///#end
@property (nonatomic,retain) UIImage *navigationBarBackgroundImage;

///#begin zh-cn
/**
 *	@brief	导航栏背景颜色
 */
///#end
///#begin en
/**
 *	@brief	Navigation bar background color.
 */
///#end
@property (nonatomic,retain) UIColor *navigationBarBackgroundColor;

///#begin zh-cn
/**
 *	@brief	评论列表视图将要显示事件
 */
///#end
///#begin en
/**
 *	@brief	Comment list view will display handler.
 */
///#end
@property (nonatomic,copy) SSCViewWillDiplayEvent commentListViewWillDisplayHandler;

///#begin zh-cn
/**
 *	@brief	帐号视图将要显示事件
 */
///#end
///#begin en
/**
 *	@brief	Account view will display handler.
 */
///#end
@property (nonatomic,copy) SSCViewWillDiplayEvent accountViewWillDisplayHandler;

///#begin zh-cn
/**
 *	@brief	评论视图将要显示事件
 */
///#end
///#begin en
/**
 *	@brief	Comment view will display handler.
 */
///#end
@property (nonatomic,copy) SSCViewWillDiplayEvent commentViewWillDisplayHandler;

@end
