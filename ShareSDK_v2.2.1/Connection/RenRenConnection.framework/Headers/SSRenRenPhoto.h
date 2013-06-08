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

/**
 *	@brief	照片信息
 */
@interface SSRenRenPhoto : NSObject <NSCoding,
                                     ISSCDataObject>
{
@private
    NSMutableDictionary *_sourceData;
}

/**
 *	@brief	源数据
 */
@property (nonatomic,retain) NSDictionary *sourceData;

/**
 *	@brief	照片的ID
 */
@property (nonatomic,readonly) long long pid;

/**
 *	@brief	照片所在相册的ID
 */
@property (nonatomic,readonly) long long aid;

/**
 *	@brief	照片的所有者用户ID
 */
@property (nonatomic,readonly) long long uid;

/**
 *	@brief	照片路径，宽度固定为100，长度按实际比例，相册列表中的大小
 */
@property (nonatomic,readonly) NSString *src;

/**
 *	@brief	小图路径，宽度固定为200，长度按实际比例，封面大小
 */
@property (nonatomic,readonly) NSString *srcSmall;

/**
 *	@brief	大图路径，最大为720*720，正常相片
 */
@property (nonatomic,readonly) NSString *srcBig;

/**
 *	@brief	照片的描述信息
 */
@property (nonatomic,readonly) NSString *caption;

/**
 *	@brief	创建照片信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	照片信息
 */
+ (SSRenRenPhoto *)photoWithResponse:(NSDictionary *)response;


@end
