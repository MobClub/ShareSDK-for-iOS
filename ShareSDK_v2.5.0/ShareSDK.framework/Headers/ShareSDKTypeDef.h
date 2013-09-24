//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <AGCommon/ICMErrorInfo.h>

#ifndef ShareSDKInterface_ShareSDKTypeDef_h
#define ShareSDKInterface_ShareSDKTypeDef_h

/**
 *	@brief	分享类型
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
    ShareTypeAny = 99               /**< 任意平台 */
}
ShareType;

/**
 *	@brief	请求方式
 */
typedef enum
{
	ShareSDKRequestMethodGet = 0,           /**< HTTP Get方式 */
	ShareSDKRequestMethodPost = 1,          /**< HTTP Post方法 */
	ShareSDKRequestMethodMultipartPost = 2  /**< HTTP Multipart POST方式，一般用于上传文件的api接口 */
}
ShareSDKRequestMethod;

/**
 *	@brief	微信分享场景
 */
typedef enum
{
	ShareSDKWeChatSceneSession = 0, /**< 好友 */
	ShareSDKWeChatSceneTimeline = 1 /**< 朋友圈 */
}
ShareSDKWeChatScene;

/**
 *	@brief	授权状态
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
 *	@brief	发布内容状态
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
 *	@brief	响应状态
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
 *	@brief	授权视图样式
 */
typedef enum
{
	SSAuthViewStylePopup = 0, /**< 弹出式窗口 */
	SSAuthViewStyleModal = 1, /**< 模态式窗口，iPad默认 */
    SSAuthViewStyleFullScreenPopup = 2 /**< 全屏弹出式窗口，iPhone默认 */
}
SSAuthViewStyle;

/**
 *	@brief	视图方向
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
 *	@brief	用户字段类型
 */
typedef enum
{
	SSUserFieldTypeUid = 0,     /**< 用户ID */
	SSUserFieldTypeName = 1,    /**< 用户名称 */
    SSUserFieldTypePath = 2     /**< 个人主页路径，仅用于LinkedIn */
}
SSUserFieldType;

/**
 *	@brief	分享内容的消息类型，仅对微信、QQApi有效
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
 *	@brief	分享视图样式
 */
typedef enum
{
	SSShareViewStyleDefault = 0, /**< 默认 */
	SSShareViewStyleSimple = 1, /**< 简约，只带有文字和图片显示UI */
	SSShareViewStyleAppRecommend = 2 /**< 应用推荐，专为应用推荐而设的显示样式 */
}
SSShareViewStyle;

/**
 *	@brief	印象笔记类型
 */
typedef enum
{
	SSEverNoteTypeSandbox = 0, /**< 沙箱 */
	SSEverNoteTypeCN = 1, /**< 印象笔记 */
	SSEverNoteTypeUS = 2 /**< Evernote International */
}
SSEverNoteType;


#endif
