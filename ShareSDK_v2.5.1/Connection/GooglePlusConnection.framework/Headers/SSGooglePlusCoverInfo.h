//
//  SSGooglePlusCoverInfo.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	封面信息
 */
@interface SSGooglePlusCoverInfo : SSCDataObject

/**
 *	@brief	The difference between the top position of the image cover and the actual displayed cover image. Only valid for BANNER layout.
 */
@property (nonatomic,readonly) NSInteger topImageOffset;

/**
 *	@brief	The difference between the left position of the image cover and the actual displayed cover image. Only valid for BANNER layout.
 */
@property (nonatomic,readonly) NSInteger leftImageOffset;

/**
 *	@brief	创建封面信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	封面信息
 */
+ (SSGooglePlusCoverInfo *)coverInfoWithResponse:(NSDictionary *)response;



@end
