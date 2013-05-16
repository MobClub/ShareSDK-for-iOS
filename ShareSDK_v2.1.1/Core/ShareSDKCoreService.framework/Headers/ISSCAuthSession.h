//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCTypeDef.h"

/**
 *	@brief	授权会话
 */
@protocol ISSCAuthSession <NSObject>

/**
 *	@brief	开始会话
 *
 *  @param  scopes  权限列表,传入nil则默认授权权限
 *	@param 	result 	返回事件
 */
- (void)start:(NSArray *)scopes result:(SSCAuthSessionResultEvent)result;

/**
 *	@brief	取消会话
 */
- (void)cancel;

/**
 *	@brief	获取授权视图
 *
 *	@return	授权视图
 */
- (UIView *)view;

@end
