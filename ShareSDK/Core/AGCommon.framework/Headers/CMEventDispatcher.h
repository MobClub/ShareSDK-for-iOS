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

///#begin zh-cn
/**
 *	@brief	事件派发器
 */
///#end
///#begin en
/**
 *	@brief	Event Dispatcher.
 */
///#end
@interface CMEventDispatcher : NSObject
{
@private
	NSNotificationCenter *_handle;
}

///#begin zh-cn
/**
 *	@brief	添加通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	监听目标
 *	@param 	action 	监听处理
 */
///#end
///#begin en
/**
 *	@brief	Add notification listener.
 *
 *	@param 	name 	Name.
 *	@param 	target 	Target object.
 *	@param 	action 	Trigger action.
 */
///#end
- (void)addNotificationWithName:(NSString *)name
                         target:(id)target
                         action:(SEL)action;

///#begin zh-cn
/**
 *	@brief	移除通知监听
 *
 *	@param 	name 	通知名称
 *	@param 	target 	监听目标
 */
///#end
///#begin en
/**
 *	@brief	Remove a notification.
 *
 *	@param 	name 	Name.
 *	@param 	target 	Target.
 */
///#end
- (void)removeNotificationWithName:(NSString *)name
                            target:(id)target;

///#begin zh-cn
/**
 *	@brief	移除某个监听目标的所有通知
 *
 *	@param 	target 	监听目标
 */
///#end
///#begin en
/**
 *	@brief	Remove all notification of target
 *
 *	@param 	target 	Target object.
 */
///#end
- (void)removeAllNotificationWithTarget:(id)target;

///#begin zh-cn
/**
 *	@brief	派发通知
 *
 *	@param 	name 	通知名称
 *	@param 	data 	通知数据
 */
///#end
///#begin en
/**
 *	@brief	Post a notification.
 *
 *	@param 	name 	Name.
 *	@param 	data 	Data.
 */
///#end
- (void)postNotificationWithName:(NSString *)name
                            data:(NSDictionary *)data;

@end
