//
//  SSRenRenImage.h
//  RenRenConnection
//
//  Created by vimfung on 13-7-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	图片对象
 */
@interface SSRenRenImage : SSCDataObject

/**
 *	@brief	图片的大小
 *  MAIN	200pt x 600pt
 *  TINY	50pt x 50pt
 *  LARGE	720pt x 720pt
 *  HEAD	100pt x 300pt
 */
@property (nonatomic,readonly) NSString *size;

/**
 *	@brief	图片的URL
 */
@property (nonatomic,readonly) NSString *url;

/**
 *	@brief	创建图片对象
 *
 *	@param 	response 	回复数据
 *
 *	@return	图片实例
 */
+ (SSRenRenImage *)imageWithResponse:(NSDictionary *)response;


@end
