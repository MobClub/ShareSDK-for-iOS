//
//  SSLinkedInShare.h
//  LinkedInConnection
//
//  Created by vimfung on 13-8-11.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/SSCDataObject.h>

/**
 *	@brief	分享信息
 */
@interface SSLinkedInShare : SSCDataObject

/**
 *	@brief	分享标识
 */
@property (nonatomic,readonly) NSString *updateKey;

/**
 *	@brief	分享路径
 */
@property (nonatomic,readonly) NSString *updateUrl;

/**
 *	@brief	创建用户信息
 *
 *	@param 	response 	服务器返回数据
 *
 *	@return	用户信息对象
 */
+ (SSLinkedInShare *)shareWithResponse:(NSDictionary *)response;

@end
