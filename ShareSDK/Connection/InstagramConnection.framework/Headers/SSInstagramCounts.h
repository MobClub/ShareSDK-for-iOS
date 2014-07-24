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
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

///#begin zh-cn
/**
 *	@brief	数量
 */
///#end
///#begin en
/**
 *	@brief	Counts
 */
///#end
@interface SSInstagramCounts : SSCDataObject

///#begin zh-cn
/**
 *	@brief	媒体数量
 */
///#end
///#begin en
/**
 *	@brief	Media count.
 */
///#end
@property (nonatomic,readonly) NSInteger media;

///#begin zh-cn
/**
 *	@brief	关注数量
 */
///#end
///#begin en
/**
 *	@brief	Follows count.
 */
///#end
@property (nonatomic,readonly) NSInteger follows;

///#begin zh-cn
/**
 *	@brief	粉丝数量
 */
///#end
///#begin en
/**
 *	@brief	Fans count.
 */
///#end
@property (nonatomic,readonly) NSInteger followedBy;

///#begin zh-cn
/**
 *	@brief	创建数量对象实例
 *
 *	@param 	data 	回复数据
 *
 *	@return	数量对象
 */
///#end
///#begin en
/**
 *	@brief	Create a counts object.
 *
 *	@param 	data 	Response data.
 *
 *	@return	Counts object.
 */
///#end
+ (SSInstagramCounts *)countsWithResponse:(NSDictionary *)data;


@end
