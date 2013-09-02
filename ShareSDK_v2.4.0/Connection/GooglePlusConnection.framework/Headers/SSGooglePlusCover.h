//
//  SSGooglePlusCover.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>
#import "SSGooglePlusCoverInfo.h"
#import "SSGooglePlusCoverPhoto.h"

@interface SSGooglePlusCover : SSCDataObject

/**
 *	@brief	The layout of the cover art. Possible values are:
 *          "banner" - One large image banner.
 */
@property (nonatomic,readonly) NSString *layout;

/**
 *	@brief	Extra information about the cover photo.
 */
@property (nonatomic,readonly) SSGooglePlusCoverInfo *coverInfo;

/**
 *	@brief	The person's primary cover image.
 */
@property (nonatomic,readonly) SSGooglePlusCoverPhoto *coverPhoto;

/**
 *	@brief	创建封面信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	封面信息
 */
+ (SSGooglePlusCover *)coverWithResponse:(NSDictionary *)response;


@end
