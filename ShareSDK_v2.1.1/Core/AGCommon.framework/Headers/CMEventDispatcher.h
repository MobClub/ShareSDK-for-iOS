//
//  EventDispatcher.h
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	事件派发器
 */
@interface CMEventDispatcher : NSObject
{
@private
	NSNotificationCenter *_handle;
}

/**
 *	@brief	添加通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	监听目标
 *	@param 	action 	监听处理
 */
- (void)addNotificationWithName:(NSString *)name
                         target:(id)target
                         action:(SEL)action;


/**
 *	@brief	移除通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	监听目标
 */
- (void)removeNotificationWithName:(NSString *)name
                            target:(id)target;


/**
 *	@brief	移除某个监听目标的所有通知
 *
 *	@param 	target 	监听目标
 */
- (void)removeAllNotificationWithTarget:(id)target;


/**
 *	@brief	派发通知
 *
 *	@param 	name 	通知名称
 *	@param 	data 	通知数据
 */
- (void)postNotificationWithName:(NSString *)name
                            data:(NSDictionary *)data;

@end
