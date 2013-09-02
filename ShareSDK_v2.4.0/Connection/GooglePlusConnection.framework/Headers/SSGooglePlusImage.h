//
//  SSGooglePlusImage.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	图片信息
 */
@interface SSGooglePlusImage : SSCDataObject

/**
 *	@brief	URL地址
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	创建图片信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	图片信息
 */
+ (SSGooglePlusImage *)imageWithResponse:(NSDictionary *)response;


@end
