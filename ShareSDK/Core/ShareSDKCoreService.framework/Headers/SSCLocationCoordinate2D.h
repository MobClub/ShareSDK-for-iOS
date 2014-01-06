//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	地理位置信息
 */
@interface SSCLocationCoordinate2D : NSObject
{
@private
    double _latitude;
    double _longitude;
}

/**
 *	@brief	纬度
 */
@property (nonatomic) double latitude;

/**
 *	@brief	经度
 */
@property (nonatomic) double longitude;

/**
 *	@brief	地理位置信息
 *
 *	@param 	latitude 	纬度
 *	@param 	longitude 	经度
 *
 *	@return	地理位置信息
 */
+ (SSCLocationCoordinate2D *)locationCoordinate2DWithLatitude:(double)latitude
                                                    longitude:(double)longitude;


@end
