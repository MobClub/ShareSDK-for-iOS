//
//  SSLocationCoordinate2D.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-8-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
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
