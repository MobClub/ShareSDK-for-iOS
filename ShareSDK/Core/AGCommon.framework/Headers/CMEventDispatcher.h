//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Event Dispatcher.
 */
@interface CMEventDispatcher : NSObject
{
@private
	NSNotificationCenter *_handle;
}

/**
 *	@brief	Add notification listener.
 *
 *	@param 	name 	Name.
 *	@param 	target 	Target object.
 *	@param 	action 	Trigger action.
 */
- (void)addNotificationWithName:(NSString *)name
                         target:(id)target
                         action:(SEL)action;

/**
 *	@brief	Remove a notification.
 *
 *	@param 	name 	Name.
 *	@param 	target 	Target.
 */
- (void)removeNotificationWithName:(NSString *)name
                            target:(id)target;

/**
 *	@brief	Remove all notification of target
 *
 *	@param 	target 	Target object.
 */
- (void)removeAllNotificationWithTarget:(id)target;

/**
 *	@brief	Post a notification.
 *
 *	@param 	name 	Name.
 *	@param 	data 	Data.
 */
- (void)postNotificationWithName:(NSString *)name
                            data:(NSDictionary *)data;

@end
