//
//  SSGooglePlusCoverPhoto.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	封面照片
 */
@interface SSGooglePlusCoverPhoto : SSCDataObject

/**
 *	@brief	The url to the image.
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	The height to the image.
 */
@property (nonatomic,readonly) NSInteger height;

/**
 *	@brief	The width to the image.
 */
@property (nonatomic,readonly) NSInteger width;

/**
 *	@brief	创建封面照片对象
 *
 *	@param 	response 	回复数据
 *
 *	@return	照片对象
 */
+ (SSGooglePlusCoverPhoto *)coverPhotoWithResponse:(NSDictionary *)response;


@end
