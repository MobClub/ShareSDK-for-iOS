//
//  ShareSDKCoreService+Private.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-3-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import "SSCQZoneApiProxy.h"

#ifdef __SHARESDK_CORE_SERVICE_HEADER__
#import "ISSCUserDescriptor.h"
#import "ShareSDKCoreService.h"
#else
#import "../Headers/ISSCUserDescriptor.h"
#import "../Headers/ShareSDKCoreService.h"
#endif

@class SSCServerRequest;

@interface ShareSDKCoreService (Private)

/**
 *	@brief	转换短链接
 *
 *	@param 	urls 	链接集合
 *	@param 	account 	授权帐户
 *  @param  userDescriptor  用户描述
 *  @param  shareType   分享平台
 *	@param 	result 	返回回调
 */
+ (void)getShortUrls:(NSArray *)urls
             account:(id<ISSCAccount>)account
      userDescriptor:(id<ISSCUserDescriptor>)userDescriptor
           shareType:(SSCShareType)shareType
              result:(void(^)(BOOL result, NSArray *shortUrls, CMErrorInfo *error))result;

/**
 *	@brief	上传图片
 *
 *	@param 	attachment 	附件信息
 */
+ (void)uploadImage:(id<ISSCAttachment>)attachment
             result:(void(^)(BOOL result, NSString *url, CMErrorInfo *error))result;

/**
 *	@brief	设置公共对象
 *
 *	@param 	object 	公共对象
 *	@param 	key 	标识
 */
+ (SSCQZoneApiProxy *)qzoneApiForAppId:(NSString *)appId;

/**
 *	@brief	获取唯一设备ID
 *
 *	@return	设备ID
 */
+ (NSString *)openUDID;


@end
