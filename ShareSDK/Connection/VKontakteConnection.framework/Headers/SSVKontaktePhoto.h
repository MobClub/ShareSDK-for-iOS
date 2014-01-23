//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	Photo.
 */
@interface SSVKontaktePhoto : SSCDataObject

/**
 *	@brief	Album id.
 */
@property (nonatomic,readonly) NSInteger aid;

/**
 *	@brief	Created tiem.
 */
@property (nonatomic,readonly) long long created;

/**
 *	@brief	Height.
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	id.
 */
@property (nonatomic,readonly) NSString *Id;

/**
 *	@brief	Belongs user id.
 */
@property (nonatomic,readonly) NSInteger ownerId;

/**
 *	@brief	Photo id.
 */
@property (nonatomic,readonly) NSInteger pid;

/**
 *	@brief	Path string.
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	The path of large picture.
 */
@property (nonatomic,readonly) NSString *srcBig;

/**
 *	@brief	The path of Small picture.
 */
@property (nonatomic,readonly) NSString *srcSmall;

/**
 *	@brief	Photo description.
 */
@property (nonatomic,readonly) NSString *text;

/**
 *	@brief	Width.
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	Create a photo information.
 *
 *	@param 	response 	Response data.
 *
 *	@return	Photo object.
 */
+ (SSVKontaktePhoto *)photoWithResponse:(NSDictionary *)response;


@end
