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
 *	@brief	Location information
 */
@interface SSCLocationCoordinate2D : NSObject
{
@private
    double _latitude;
    double _longitude;
}

/**
 *	@brief	Latitude.
 */
@property (nonatomic) double latitude;

/**
 *	@brief	Longitude.
 */
@property (nonatomic) double longitude;

/**
 *	@brief	Location information.
 *
 *	@param 	latitude 	Latitude
 *	@param 	longitude 	Longitude
 *
 *	@return	Location information.
 */
+ (SSCLocationCoordinate2D *)locationCoordinate2DWithLatitude:(double)latitude
                                                    longitude:(double)longitude;


@end
