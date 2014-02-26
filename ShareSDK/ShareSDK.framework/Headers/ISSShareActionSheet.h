//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSContainer.h"
#import "ShareSDKTypeDef.h"

/**
 *	@brief	Share menu protocol
 */
@protocol ISSShareActionSheet <NSObject>

/**
 *	@brief	Show share menu.
 *
 *	@param 	container 	Container.
 *	@param 	items 	Share item list.
 *  @param  itemClickHandler    Item click event handler.
 *  @param  cancelHandler   Cancel button click event handler.
 */
- (void)showWithContainer:(id<ISSContainer>)container
                    items:(NSArray *)items
              onItemClick:(void (^)(ShareType shareType))itemClickHandler
                 onCancel:(void(^)())cancelHandler;


/**
 *	@brief	Dismiss menu.
 */
- (void)dismiss;

@end
