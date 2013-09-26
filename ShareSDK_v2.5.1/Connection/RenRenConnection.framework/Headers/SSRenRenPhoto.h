//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	照片信息
 */
@interface SSRenRenPhoto : SSCDataObject

/**
 *	@brief	照片的ID
 */
@property (nonatomic,readonly) long long Id;

/**
 *	@brief	照片所属相册的ID
 */
@property (nonatomic,readonly) long long albumId;

/**
 *	@brief	照片所有者的ID
 */
@property (nonatomic,readonly) long long ownerId;

/**
 *	@brief	照片的描述
 */
@property (nonatomic,readonly) NSString *description;

/**
 *	@brief	照片对应的各种类型图片
 */
@property (nonatomic,readonly) NSArray *images;

/**
 *	@brief	照片的创建时间
 */
@property (nonatomic,readonly) NSString *createTime;

/**
 *	@brief	照片被浏览的次数
 */
@property (nonatomic,readonly) NSInteger viewCount;

/**
 *	@brief	照片被回复的次数
 */
@property (nonatomic,readonly) NSInteger commentCount;

/**
 *	@brief	创建照片信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	照片信息
 */
+ (SSRenRenPhoto *)photoWithResponse:(NSDictionary *)response;


@end
