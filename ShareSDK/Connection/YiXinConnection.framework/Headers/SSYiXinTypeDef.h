//
//  SSYiXinTypeDef.h
//  YiXinConnection
//
//  Created by Nogard on 13-12-4.
//  Copyright (c) 2013年 AppGo. All rights reserved.
//

#ifndef YiXinConnection_SSYiXinTypeDef_h
#define YiXinConnection_SSYiXinTypeDef_h

/**
 *	@brief	易信分享类型
 */
typedef enum
{
	SSYiXinSceneSession = 0,   /**< 好友 */
	SSYiXinSceneTimeline = 1 , /**< 朋友圈 */
}
SSYiXinScene;

#define ERROR_CODE_YIXIN_NOT_INTEGRATED -38001
#define ERROR_DESC_YIXIN_NOT_INTEGRATED ShareSDKLocalizableString(@"ERROR_DESC_YIXIN_NOT_INTEGRATED", @"尚未集成易信接口")

#define ERROR_CODE_YIXIN_UNKNOWN_MEDIA_TYPE -38002
#define ERROR_DESC_YIXIN_UNKNOWN_MEDIA_TYPE ShareSDKLocalizableString(@"ERROR_DESC_YIXIN_UNKNOWN_MEDIA_TYPE", @"未知的消息发送类型")

#define ERROR_CODE_YIXIN_NOT_INSTALL -38003
#define ERROR_DESC_YIXIN_NOT_INSTALL ShareSDKLocalizableString(@"ERROR_DESC_YIXIN_NOT_INSTALL", @"尚未安装易信")

#define ERROR_CODE_YIXIN_API_IS_NOT_SUPPORT -38004
#define ERROR_DESC_YIXIN_API_IS_NOT_SUPPORT ShareSDKLocalizableString(@"ERROR_DESC_YIXIN_API_IS_NOT_SUPPORT", @"当前易信版本不支持该功能")

#define ERROR_CODE_YIXIN_SEND_REQUEST_ERROR -38005
#define ERROR_DESC_YIXIN_SEND_REQUEST_ERROR ShareSDKLocalizableString(@"ERROR_DESC_YIXIN_SEND_REQUEST_ERROR", @"请求易信OpenApi失败")

#define ERROR_CODE_YIXIN_NOT_SET_URL_SCHEME -38006
#define ERROR_DESC_YIXIN_NOT_SET_URL_SCHEME ShareSDKLocalizableString(@"ERROR_DESC_YIXIN_NOT_SET_URL_SCHEME", @"尚未设置易信的URL Scheme")

#endif
