//
//  SSCUrl.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-5-3.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "SSCTypeDef.h"
#else
#import "../Headers/SSCTypeDef.h"
#endif

/**
 *	@brief	URL信息
 */
@interface SSCUrl : NSObject
{
@private
    NSString *_url;
    NSString *_surl;
    SSCShareType _plat;
}

/**
 *	@brief	源链接
 */
@property (nonatomic,copy) NSString *url;

/**
 *	@brief	短链接
 */
@property (nonatomic,copy) NSString *surl;

/**
 *	@brief	分享平台类型
 */
@property (nonatomic) SSCShareType plat;


/**
 *	@brief	创建URL信息
 *
 *	@param 	response 	回复数据
 *
 *	@return	URL信息
 */
+ (SSCUrl *)urlWithResponse:(NSDictionary *)response;


@end
