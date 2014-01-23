//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#ifndef YiXinConnection_SSYiXinTypeDef_h
#define YiXinConnection_SSYiXinTypeDef_h

/**
 *	@brief	YiXin Scene.
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
