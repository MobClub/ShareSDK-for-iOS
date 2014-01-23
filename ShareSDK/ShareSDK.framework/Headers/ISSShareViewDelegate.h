//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSViewDelegate.h"
#import "ISSContent.h"

/**
 *	@brief	Share view delegate protocol
 */
@protocol ISSShareViewDelegate <ISSViewDelegate>

@optional

/**
 *	@brief	Will publish content
 *
 *  @since  ver2.2.0    deprecated
 *
 *  @deprecated     Deprecated.Recommended use - (id <ISSContent>) view: willPublishContent: shareList:; method instead.
 *
 *	@param 	viewController 	View controller.
 *	@param 	content 	Share content object.
 *  @param  shareList   Platform list.
 *
 *	@return	The actual transmission of the content object.
 */
- (id<ISSContent>)view:(UIViewController *)viewController
    willPublishContent:(id<ISSContent>)content;

/**
 *	@brief	Will publish content
 *
 *  @since  ver2.2.0
 *
 *	@param 	viewController 	View controller
 *	@param 	content 	Share content object.
 *  @param  shareList   Platform list.
 *
 *	@return	The actual transmission of the content object.
 */
- (id<ISSContent>)view:(UIViewController *)viewController
    willPublishContent:(id<ISSContent>)content
             shareList:(NSArray *)shareList;

/**
 *	@brief	Cancel publish
 *
 *	@param 	viewController 	View controller.
 */
- (void)viewOnCancelPublish:(UIViewController *)viewController;

@end
