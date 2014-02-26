//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <AGCommon/ICMErrorInfo.h>

#ifndef ShareSDKInterface_ShareSDKTypeDef_h
#define ShareSDKInterface_ShareSDKTypeDef_h

/**
 *	@brief	Platform type.
 */
typedef enum
{
	ShareTypeSinaWeibo = 1,         /**< 新浪微博 */
	ShareTypeTencentWeibo = 2,      /**< 腾讯微博 */
	ShareTypeSohuWeibo = 3,         /**< 搜狐微博 */
    ShareType163Weibo = 4,          /**< 网易微博 */
	ShareTypeDouBan = 5,            /**< 豆瓣社区 */
	ShareTypeQQSpace = 6,           /**< QQ空间 */
	ShareTypeRenren = 7,            /**< 人人网 */
	ShareTypeKaixin = 8,            /**< 开心网 */
	ShareTypePengyou = 9,           /**< 朋友网 */
	ShareTypeFacebook = 10,         /**< Facebook */
	ShareTypeTwitter = 11,          /**< Twitter */
	ShareTypeEvernote = 12,         /**< 印象笔记 */
	ShareTypeFoursquare = 13,       /**< Foursquare */
	ShareTypeGooglePlus = 14,       /**< Google＋ */
	ShareTypeInstagram = 15,        /**< Instagram */
	ShareTypeLinkedIn = 16,         /**< LinkedIn */
	ShareTypeTumblr = 17,           /**< Tumbir */
    ShareTypeMail = 18,             /**< 邮件分享 */
	ShareTypeSMS = 19,              /**< 短信分享 */
	ShareTypeAirPrint = 20,         /**< 打印 */
	ShareTypeCopy = 21,             /**< 拷贝 */
    ShareTypeWeixiSession = 22,     /**< 微信好友 */
	ShareTypeWeixiTimeline = 23,    /**< 微信朋友圈 */
    ShareTypeQQ = 24,               /**< QQ */
    ShareTypeInstapaper = 25,       /**< Instapaper */
    ShareTypePocket = 26,           /**< Pocket */
    ShareTypeYouDaoNote = 27,       /**< 有道云笔记 */
    ShareTypeSohuKan = 28,          /**< 搜狐随身看 */
    ShareTypePinterest = 30,        /**< Pinterest */
    ShareTypeFlickr = 34,           /**< Flickr */
    ShareTypeDropbox = 35,          /**< Dropbox */
    ShareTypeVKontakte = 36,        /**< VKontakte */
    ShareTypeWeixiFav = 37,         /**< 微信收藏 */
    ShareTypeYiXinSession = 38,     /**< 易信好友 */
    ShareTypeYiXinTimeline = 39,    /**< 易信朋友圈 */
    ShareTypeYiXinFav = 40,         /**< 易信收藏 */
    ShareTypeAny = 99               /**< 任意平台 */
}
ShareType;

/**
 *	@brief	Request method.
 */
typedef enum
{
	ShareSDKRequestMethodGet = 0,           /**< HTTP Get方式 */
	ShareSDKRequestMethodPost = 1,          /**< HTTP Post方法 */
	ShareSDKRequestMethodMultipartPost = 2  /**< HTTP Multipart POST方式，一般用于上传文件的api接口 */
}
ShareSDKRequestMethod;

/**
 *	@brief	WeChat scene.
 */
typedef enum
{
	ShareSDKWeChatSceneSession = 0, /**< 好友 */
	ShareSDKWeChatSceneTimeline = 1 /**< 朋友圈 */
}
ShareSDKWeChatScene;

/**
 *	@brief	Authorized state.
 */
typedef enum
{
    SSAuthStateBegan = 0, /**< 开始 */
	SSAuthStateSuccess = 1, /**< 成功 */
	SSAuthStateFail = 2, /**< 失败 */
    SSAuthStateCancel = 3 /**< 取消 */
}
SSAuthState;

/**
 *	@brief	Publish content state.
 */
typedef enum
{
	SSPublishContentStateBegan = 0, /**< 开始 */
	SSPublishContentStateSuccess = 1, /**< 成功 */
	SSPublishContentStateFail = 2, /**< 失败 */
	SSPublishContentStateCancel = 3 /**< 取消 */
}
SSPublishContentState;

/**
 *	@brief	Response state.
 */
typedef enum
{
	SSResponseStateBegan = 0, /**< 开始 */
	SSResponseStateSuccess = 1, /**< 成功 */
	SSResponseStateFail = 2, /**< 失败 */
	SSResponseStateCancel = 3 /**< 取消 */
}
SSResponseState;

/**
 *	@brief	Authorize view style.
 */
typedef enum
{
	SSAuthViewStylePopup = 0, /**< 弹出式窗口 */
	SSAuthViewStyleModal = 1, /**< 模态式窗口，iPad默认 */
    SSAuthViewStyleFullScreenPopup = 2 /**< 全屏弹出式窗口，iPhone默认 */
}
SSAuthViewStyle;

/**
 *	@brief	Interface orientation.
 */
typedef enum {
    SSInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),
    SSInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft),
    SSInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight),
    SSInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown),
    SSInterfaceOrientationMaskLandscape = (SSInterfaceOrientationMaskLandscapeLeft | SSInterfaceOrientationMaskLandscapeRight),
    SSInterfaceOrientationMaskAll = (SSInterfaceOrientationMaskPortrait | SSInterfaceOrientationMaskLandscapeLeft | SSInterfaceOrientationMaskLandscapeRight | SSInterfaceOrientationMaskPortraitUpsideDown),
    SSInterfaceOrientationMaskAllButUpsideDown = (SSInterfaceOrientationMaskPortrait | SSInterfaceOrientationMaskLandscapeLeft | SSInterfaceOrientationMaskLandscapeRight),
}SSInterfaceOrientationMask;

typedef enum
{
    SSRectEdgeNone   = 0,
    SSRectEdgeTop    = 1 << 0,
    SSRectEdgeLeft   = 1 << 1,
    SSRectEdgeBottom = 1 << 2,
    SSRectEdgeRight  = 1 << 3,
    SSRectEdgeAll    = SSRectEdgeTop | SSRectEdgeLeft | SSRectEdgeBottom | SSRectEdgeRight
}
SSRectEdge;

/**
 *	@brief	User field type.
 */
typedef enum
{
	SSUserFieldTypeUid = 0,     /**< 用户ID */
	SSUserFieldTypeName = 1,    /**< 用户名称 */
    SSUserFieldTypePath = 2     /**< 个人主页路径，仅用于LinkedIn */
}
SSUserFieldType;

/**
 *	@brief	Share meida type，Only for WeChat QQ.
 */
typedef enum
{
	SSPublishContentMediaTypeText = 0, /**< 文本 */
	SSPublishContentMediaTypeImage = 1, /**< 图片 */
	SSPublishContentMediaTypeNews = 2, /**< 新闻 */
	SSPublishContentMediaTypeMusic = 3, /**< 音乐 */
	SSPublishContentMediaTypeVideo = 4, /**< 视频 */
    SSPublishContentMediaTypeApp = 5, /**< 应用,仅供微信使用 */
    SSPublishContentMediaTypeNonGif = 6, /**< 非Gif消息,仅供微信使用 */
    SSPublishContentMediaTypeGif = 7 /**< Gif消息,仅供微信使用 */
}
SSPublishContentMediaType;

/**
 *	@brief	Share view style.
 */
typedef enum
{
	SSShareViewStyleDefault = 0, /**< 默认 */
	SSShareViewStyleSimple = 1, /**< 简约，只带有文字和图片显示UI */
	SSShareViewStyleAppRecommend = 2 /**< 应用推荐，专为应用推荐而设的显示样式 */
}
SSShareViewStyle;

/**
 *	@brief	Evernote type.
 */
typedef enum
{
	SSEverNoteTypeSandbox = 0, /**< 沙箱 */
	SSEverNoteTypeCN = 1, /**< 印象笔记 */
	SSEverNoteTypeUS = 2 /**< Evernote International */
}
SSEverNoteType;

/**
 *	@brief	Obtain coins
 */
typedef enum
{
	SSObtainCoinsActionInitalActivation = 1, /**< 首次激活 */
	SSObtainCoinsActionDailyActivation = 2, /**< 每日激活 */
	SSObtainCoinsActionShare = 3 /**< 分享 */
}
SSObtainCoinsAction;

/**
 *	@brief	UI Style
 */
typedef enum
{
	SSUIStyleiOS7 = 0, /**< iOS7风格 */
	SSUIStyleiOS7Below = 1 /**< iOS7系统版本以下风格 */
}
SSUIStyle;


#endif
