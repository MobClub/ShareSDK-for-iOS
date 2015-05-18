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
 *	@brief	分享相关描述
 */
///#end
///#begin en
/**
 *	@brief	Share description
 */
///#end
@interface SSCShareDesc : NSObject

///#begin zh-cn
/**
 *	@brief	分享平台列表，用于显示在菜单中的平台列表，默认为初始化的所有平台
 */
///#end
///#begin en
/**
 *	@brief	Platform list，For display in the menu list of platforms, the default initialization for all platforms
 */
///#end
@property (nonatomic,retain) NSArray *menuItems;

///#begin zh-cn
/**
 *	@brief	分享内容实体
 */
///#end
///#begin en
/**
 *	@brief	Share content entity.
 */
///#end
@property (nonatomic,retain) id<ISSContent> contentEntity;

///#begin zh-cn
/**
 *	@brief	授权选项
 */
///#end
///#begin en
/**
 *	@brief	Auth options.
 */
///#end
@property (nonatomic,retain) id<ISSAuthOptions> authOptions;

///#begin zh-cn
/**
 *	@brief	分享选项
 */
///#end
///#begin en
/**
 *	@brief	Share options.
 */
///#end
@property (nonatomic,retain) id<ISSShareOptions> shareOptions;

///#begin zh-cn
/**
 *	@brief	分享事件处理器
 */
///#end
///#begin en
/**
 *	@brief	Share event handler.
 */
///#end
@property (nonatomic,copy) SSPublishContentEventHandler shareEventHandler;


@end
