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
 *	@brief	照片信息
 */
///#end
///#begin en
/**
 *	@brief	Photo.
 */
///#end
@interface SSVKontaktePhoto : SSCDataObject

///#begin zh-cn
/**
 *	@brief	相册ID
 */
///#end
///#begin en
/**
 *	@brief	Album id.
 */
///#end
@property (nonatomic,readonly) NSInteger aid;

///#begin zh-cn
/**
 *	@brief	创建时间
 */
///#end
///#begin en
/**
 *	@brief	Created tiem.
 */
///#end
@property (nonatomic,readonly) long long created;

///#begin zh-cn
/**
 *	@brief	高度
 */
///#end
///#begin en
/**
 *	@brief	Height.
 */
///#end
@property (nonatomic,readonly) NSInteger height;

///#begin zh-cn
/**
 *	@brief	标识
 */
///#end
///#begin en
/**
 *	@brief	id.
 */
///#end
@property (nonatomic,readonly) NSString *Id;

///#begin zh-cn
/**
 *	@brief	所属用户ID
 */
///#end
///#begin en
/**
 *	@brief	Belongs user id.
 */
///#end
@property (nonatomic,readonly) NSInteger ownerId;

///#begin zh-cn
/**
 *	@brief	照片标识
 */
///#end
///#begin en
/**
 *	@brief	Photo id.
 */
///#end
@property (nonatomic,readonly) NSInteger pid;

///#begin zh-cn
/**
 *	@brief	路径
 */
///#end
///#begin en
/**
 *	@brief	Path string.
 */
///#end
@property (nonatomic,readonly) NSString *src;

///#begin zh-cn
/**
 *	@brief	大图路径
 */
///#end
///#begin en
/**
 *	@brief	The path of large picture.
 */
///#end
@property (nonatomic,readonly) NSString *srcBig;

///#begin zh-cn
/**
 *	@brief	小图路径
 */
///#end
///#begin en
/**
 *	@brief	The path of Small picture.
 */
///#end
@property (nonatomic,readonly) NSString *srcSmall;

///#begin zh-cn
/**
 *	@brief	描述
 */
///#end
///#begin en
/**
 *	@brief	Photo description.
 */
///#end
@property (nonatomic,readonly) NSString *text;

///#begin zh-cn
/**
 *	@brief	宽度
 */
///#end
///#begin en
/**
 *	@brief	Width.
 */
///#end
@property (nonatomic,readonly) NSInteger width;

///#begin zh-cn
/**
 *	@brief	创建照片信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	照片信息实例
 */
///#end
///#begin en
/**
 *	@brief	Create a photo information.
 *
 *	@param 	response 	Response data.
 *
 *	@return	Photo object.
 */
///#end
+ (SSVKontaktePhoto *)photoWithResponse:(NSDictionary *)response;


@end
