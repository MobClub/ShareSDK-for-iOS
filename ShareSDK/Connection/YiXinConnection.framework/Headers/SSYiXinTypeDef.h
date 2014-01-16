//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
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
