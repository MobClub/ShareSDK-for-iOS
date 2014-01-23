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
 *	@brief	Share description
 */
@interface SSCShareDesc : NSObject

/**
 *	@brief	Platform list，For display in the menu list of platforms, the default initialization for all platforms
 */
@property (nonatomic,retain) NSArray *menuItems;

/**
 *	@brief	Share content entity.
 */
@property (nonatomic,retain) id<ISSContent> contentEntity;

/**
 *	@brief	Auth options.
 */
@property (nonatomic,retain) id<ISSAuthOptions> authOptions;

/**
 *	@brief	Share options.
 */
@property (nonatomic,retain) id<ISSShareOptions> shareOptions;

/**
 *	@brief	Share event handler.
 */
@property (nonatomic,copy) SSPublishContentEventHandler shareEventHandler;


@end
