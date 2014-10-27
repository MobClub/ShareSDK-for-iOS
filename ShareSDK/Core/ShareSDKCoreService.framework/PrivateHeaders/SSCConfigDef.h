//
//  SSCConfigDef.h
//  ShareSDKCoreService
//
//  Created by 冯 鸿杰 on 13-4-2.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#ifndef ShareSDKCoreService_SSCConfigDef_h
#define ShareSDKCoreService_SSCConfigDef_h

/**
 *	@brief	检测包含链接正则表达式
 */
#define CONTAIN_URL_REGEXP @"(https?://){1}[A-Za-z0-9_\\.\\-/:\\?&%=,;\\[\\]\\{\\}`~!@#\\$\\^\\*\\(\\)\\+\\\\\\|]+"

/**
 *	@brief	检查HTML标签是否包含链接正则表达式
 */
#define HTML_CONTAIN_URL_REGEXP @"<a[^>]*?href[\\s]*=[\\s]*[\"\']?([^\'\">]+?)[\'\"]?>"

/**
 *	@brief	服务器版本
 */
#define SDK_SERVER_VERSION 2

/**
 *	@brief	SDK版本
 */
#define SDK_VERSION 40

/**
 *	@brief	平台类型
 */
#define PLAT @"2"

/**
 *	@brief	厂商
 */
#define FACTORY @"apple"

/**
 *	@brief	AES密钥
 */
#define AES_KEY @"sdk.sharesdk.sdk"

/**
 *	@brief	日志大小
 */
#define LOG_SIZE 100

/**
 *	@brief	进入分享菜单事件
 */
#define EVENT_ENTER_SHAREMENU @"SHARESDK_ENTER_SHAREMENU"

/**
 *	@brief	取消分享菜单事件
 */
#define EVENT_CANCEL_SHAREMENU @"SHARESDK_CANCEL_SHAREMENU"

/**
 *	@brief	编辑分享内容事件
 */
#define EVENT_EDIT_SHARE @"SHARESDK_EDIT_SHARE"

/**
 *	@brief	分享失败事件
 */
#define EVENT_FAILED_SHARE @"SHARESDK_FAILED_SHARE"

/**
 *	@brief	取消分享事件
 */
#define EVENT_CANCEL_SHARE @"SHARESDK_CANCEL_SHARE"

/**
 *	@brief	图片服务器路径
 */
#define BASE_IMG_URL @"http://up.sharesdk.cn"
//#define BASE_IMG_URL @"http://192.168.1.189:8080"

/**
 *	@brief	新接口路径
 */
#define BASE_URL_2 @"http://api2.sharesdk.cn:5566"
//#define BASE_URL_2 @"http://192.168.1.189:8080"
//#define BASE_URL_2 @"http://192.168.1.110:8080"

/**
 *	@brief	转换短链服务域名
 */
#define SHORT_CONVERT_URL @"http://s.sharesdk.cn"
//#define SHORT_CONVERT_URL @"http://192.168.1.189:8080/surl"


#endif
